"""Conservative playback audit/experimental patch, without embedded API keys.

No player endpoint spoofing, TLS downgrade or speculative version bump. The
patch only aligns an inconsistent existing Android header and User-Agent with
the existing JSON clientVersion. It is not a verified playback repair.
"""
import argparse
import hashlib
import json
from pathlib import Path
from urllib.parse import parse_qs, urlsplit
from csky import BASE, cstring, literal

ANDROID_BODY = 0x4da46c
ANDROID_UA = 0x4da488
ANDROID_HEADER = 0x4da4e4


def audit_and_patch(ecos):
    if hashlib.sha256(ecos).hexdigest() != '64c58484ffaa86996a367c060fcaa46c841f3bcca6d4368b02c17c8b39bf22dc':
        raise ValueError('Unsupported eCos revision')
    loads = {0x115c5e:ANDROID_BODY,0x115c78:ANDROID_UA,0x115d24:ANDROID_UA,
             0x115d2a:0x4da4c8,0x115d2e:ANDROID_HEADER}
    for pc,offset in loads.items():
        if literal(ecos,pc)[1] != BASE+offset:
            raise ValueError('Request-construction code differs')
    body = cstring(ecos,BASE+ANDROID_BODY)
    ua = cstring(ecos,BASE+ANDROID_UA)
    header = cstring(ecos,BASE+ANDROID_HEADER)
    if (body,header) != ('19.09.4','X-YouTube-Client-Version: 18.11.34'):
        raise ValueError('Unexpected Android profile')
    changes = []
    for offset,before,after in ((ANDROID_UA,ua,ua.replace('/19.09.04 ','/19.09.4 ')),
                               (ANDROID_HEADER,header,'X-YouTube-Client-Version: '+body)):
        if before == after: raise ValueError('No change at expected patch location')
        old = before.encode('ascii')+b'\0'
        new = after.encode('ascii')+b'\0'
        if len(new)>len(old): raise ValueError('String patch cannot grow allocation')
        new = new.ljust(len(old),b'\0')
        changes.append(dict(offset=offset,address=BASE+offset,before_hex=old.hex(),after_hex=new.hex()))
    patched = bytearray(ecos)
    for change in changes:
        off = change['offset']; before = bytes.fromhex(change['before_hex']); after = bytes.fromhex(change['after_hex'])
        if patched[off:off+len(before)] != before: raise ValueError('Preimage mismatch')
        patched[off:off+len(after)] = after
    assert len(patched) == len(ecos)
    report = dict(status='EXPERIMENTAL_UNVERIFIED_PLAYBACK', symptom='Lists work; video does not start',
                  original_sha256=hashlib.sha256(ecos).hexdigest(),
                  patched_sha256=hashlib.sha256(patched).hexdigest(),
                  confirmed_issue='Android JSON clientVersion, User-Agent and HTTP header disagree',
                  original=dict(json_client_version=body,user_agent=ua,version_header=header),
                  proposed_version=body, changes=changes,
                  code_loads=[dict(pc=BASE+p,literal_address=BASE+v) for p,v in loads.items()],
                  ios_profile_changed=False, root_cause_proven=False, service_tested=False,
                  complete_firmware_emitted=False,
                  remaining_checks=['Actual player response and playabilityStatus',
                                    'Direct URL versus signatureCipher and challenge requirements',
                                    'Available progressive AVC/AAC versus separate adaptive tracks',
                                    'Video CDN HTTP result, expiry and device TLS/clock',
                                    'Actual decoder compatibility and device recovery'])
    return report,bytes(patched)


def diagnose_player(response, now=None):
    """Summarize a captured player response without printing URLs/tokens/keys.

    Operates on a local JSON capture only. A candidate stream is not proof of
    device support or server accessibility. No signature/challenge bypass.
    """
    if not isinstance(response,dict): raise ValueError('Expected a player JSON object')
    status=response.get('playabilityStatus',{})
    if not isinstance(status,dict): raise ValueError('Invalid playabilityStatus')
    data=response.get('streamingData') or {}
    if not isinstance(data,dict): raise ValueError('Invalid streamingData')
    safe_status=status.get('status','UNKNOWN')
    if safe_status not in ('OK','UNKNOWN','ERROR','LOGIN_REQUIRED','UNPLAYABLE','LIVE_STREAM_OFFLINE',
                           'CONTENT_CHECK_REQUIRED','AGE_CHECK_REQUIRED'):
        safe_status='UNKNOWN'
    result=dict(playability_status=safe_status,
                formats=[],progressive_avc_aac_candidates=0,ciphered_formats=0,
                hls_present=bool(data.get('hlsManifestUrl')), dash_present=bool(data.get('dashManifestUrl')),
                playback_verified=False)
    for collection in ('formats','adaptiveFormats'):
        values=data.get(collection,[])
        if not isinstance(values,list): raise ValueError('Invalid formats list')
        for item in values:
            if not isinstance(item,dict): continue
            mime=item.get('mimeType','')
            if not isinstance(mime,str): mime=''
            url=item.get('url','')
            if not isinstance(url,str): url=''
            cipher=bool(item.get('signatureCipher') or item.get('cipher'))
            candidate=(collection=='formats' and mime.startswith('video/mp4') and
                       'avc1' in mime and 'mp4a' in mime and bool(url) and not cipher)
            expired=None
            if now is not None and url:
                try:
                    expires=parse_qs(urlsplit(url).query).get('expire',[None])[0]
                    if expires is not None: expired=int(expires)<=now
                except (ValueError,TypeError): pass
            # Whitelist only codec/format fields. Never copy server error text,
            # URL, cipher, tracking parameters or the original response.
            result['formats'].append(dict(itag=item.get('itag') if isinstance(item.get('itag'),int) else None,
                                          track_group=collection,
                                          avc='avc1' in mime,aac='mp4a' in mime,
                                          has_direct_url=bool(url),ciphered=cipher,
                                          progressive_candidate=candidate,expired=expired))
            result['progressive_avc_aac_candidates'] += int(candidate and expired is not True)
            result['ciphered_formats'] += int(cipher)
    if result['playability_status'] not in ('OK','UNKNOWN'):
        result['next_check']='Service refused this player request; inspect client support/authentication without exposing tokens'
    elif result['progressive_avc_aac_candidates']:
        result['next_check']='Check candidate CDN HTTP status, expiration, TLS and actual decoder playback'
    elif result['ciphered_formats']:
        result['next_check']='Current response needs signature handling; changing menu resources cannot repair this'
    elif result['formats']:
        result['next_check']='Check supported adaptive/HLS playback; no usable direct combined AVC/AAC candidate was found'
    else:
        result['next_check']='Capture player HTTP status/response; no formats were supplied'
    return result


if __name__ == '__main__':
    import time
    parser=argparse.ArgumentParser(description='Offline playback diagnostic. Output omits URLs and credentials.')
    parser.add_argument('response',type=Path)
    args=parser.parse_args()
    print(json.dumps(diagnose_player(json.loads(args.response.read_text(encoding='utf-8')),int(time.time())),indent=2))
