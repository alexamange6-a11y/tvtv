"""Reproducible research build. Never emits a modified full flash BIN."""
from pathlib import Path
import argparse
import hashlib
import json
import subprocess
import zipfile

from prepare import ROOT, prepare
from analyze import analyze
from formats import Firmware, Cramfs
from hook import build_hook, START, LIMIT
from csky import BASE
from theme import create_theme, verify_theme, TILES
from youtube_theme import create_youtube_theme, render_preview
from youtube_playback import audit_and_patch
from meecast import write_findings, emit_disassembly
from meecast_theme import create_meecast_theme, render_preview as render_meecast_preview
from hook import PHONE_KEY, PHONE_WINDOW


def build(objdump=None):
    inputs = prepare()
    report = analyze(objdump)
    output = ROOT/'build'
    fw = Firmware((inputs/'firmware/original_firmware.bin').read_bytes())
    ecos = (inputs/'extracted/ecos.bin').read_bytes()
    hook, labels = build_hook()
    (output/'menu_callback.ck610').write_bytes(hook)
    resources = create_theme(inputs)
    youtube_resources = create_youtube_theme(inputs,resources)
    resources.update(youtube_resources)
    meecast_resources = create_meecast_theme(inputs,resources)
    resources.update(meecast_resources)
    verify_theme(resources)
    packed = fw.cramfs.repack(resources,allow_additions=True)
    (output/'theme_RESEARCH_ONLY.cramfs').write_bytes(packed)
    youtube_output=output/'youtube'
    youtube_output.mkdir(exist_ok=True)
    render_preview(inputs,youtube_resources,youtube_output/'layout_preview_NOT_DEVICE.png')
    meecast_output = output/'meecast'
    meecast_output.mkdir(exist_ok=True)
    write_findings(ecos,meecast_output/'findings.json')
    render_meecast_preview(inputs,meecast_resources,meecast_output/'layout_preview_NOT_DEVICE.png')
    if objdump:
        emit_disassembly(objdump,inputs/'extracted/ecos.bin',meecast_output/'disassembly')
    playback_report,_ = audit_and_patch(ecos)
    (youtube_output/'playback_patch_EXPERIMENTAL.json').write_text(json.dumps(playback_report,indent=2)+'\n',encoding='utf-8')
    for name,data in resources.items():
        target = output/'overlay'/name
        target.parent.mkdir(parents=True,exist_ok=True)
        target.write_bytes(data)
    manifest = dict(status='EXPERIMENTAL_NOT_FLASHABLE', tiles=TILES,
                    original_ecos_sha256=hashlib.sha256(ecos).hexdigest(),
                    callback_address=START, callback_offset=START-BASE,
                    callback_length=len(hook), callback_envelope_end=LIMIT,
                    original_callback_bytes=ecos[START-BASE:START-BASE+len(hook)].hex(),
                    replacement_callback_bytes=hook.hex(),
                    labels=labels, resources=[dict(path=p,sha256=hashlib.sha256(d).hexdigest(),size=len(d))
                                             for p,d in sorted(resources.items())],
                    cramfs_size=len(packed), cramfs_limit=fw.by_name['ROOT']['capacity'],
                    cramfs_crc_verified=True, all_repacked_files_verified=True,
                    youtube=dict(layout='Minimal four-row TV search/results view; native navigation retained',
                                 shared_with_other_netvideo_clients=True,
                                 native_signals_preserved=True,
                                 playback_patch_applied=False,
                                 playback_patch_manifest='youtube/playback_patch_EXPERIMENTAL.json',
                                 live_probe='Cloud proxy denied CONNECT; no YouTube server response obtained'),
                    phone_control=dict(service='Existing native MeeCast',
                                       requested_phone='iPhone',
                                       menu_shortcut_key=PHONE_KEY,
                                       menu_shortcut_label='0', window_address=PHONE_WINDOW,
                                       new_server_injected=False,
                                       native_key_parser_executed_in_tests=True,
                                       system_input_queue_delivery_stubbed=True,
                                       phone_playback_verified=False,
                                       google_cast_compatibility_verified=False,
                                       findings='meecast/findings.json'),
                    callback_external_calls='Original app-name initialization and dispatcher also executed in tests; platform services and ultimate app entrypoints stubbed; NOT verified on device',
                    modified_flash_bin_emitted=False,
                    release_blockers=['Physical recovery method and exact PCB/flash revision not verified',
                                      'GUI lifecycle, zero-area list focus and return from each app untested',
                                      'Native window-create path may restore stock focus/content on return',
                                      'Non-CRC vendor metadata at partition table tail not fully interpreted',
                                      'Current YouTube/MEGOGO network operation untested'])
    (output/'patch_manifest.json').write_text(json.dumps(manifest,indent=2,ensure_ascii=False)+'\n',encoding='utf-8')
    if objdump:
        end = labels['return'] + 20
        result = subprocess.run([str(objdump),'-D','-b','binary','-m','csky:ck610','-EL',
                                 f'--adjust-vma={START:#x}',f'--stop-address={end:#x}',
                                 str(output/'menu_callback.ck610')],check=True,capture_output=True,text=True)
        if '.long' in result.stdout: raise ValueError('GNU disassembler rejected callback instruction')
        (output/'disassembly/menu_callback.asm').write_text(result.stdout,encoding='utf-8')
    with zipfile.ZipFile(output/'romsat_research_artifacts_NOT_FLASHABLE.zip','w',zipfile.ZIP_DEFLATED) as archive:
        files = [output/'menu_callback.ck610',output/'theme_RESEARCH_ONLY.cramfs',
                 output/'patch_manifest.json',output/'analysis.json',output/'registrations.json']
        files += sorted((output/'overlay').rglob('*'))
        files += sorted((output/'disassembly').glob('*.asm'))
        files += [youtube_output/'playback_patch_EXPERIMENTAL.json',youtube_output/'layout_preview_NOT_DEVICE.png']
        files += sorted(youtube_output.glob('*.asm'))
        files += sorted(meecast_output.rglob('*'))
        for path in files:
            if path.is_file():
                info = zipfile.ZipInfo(path.relative_to(output).as_posix(),date_time=(2024,8,2,0,0,0))
                info.compress_type = zipfile.ZIP_DEFLATED
                archive.writestr(info,path.read_bytes())
        sources = [ROOT/'README_RU.md',ROOT/'build.bat',ROOT/'requirements.txt']
        sources += sorted((ROOT/'tools').glob('*.py'))
        sources += sorted((ROOT/'tools').glob('*.sh'))
        sources += sorted((ROOT/'tests').glob('*.py'))
        sources += sorted((ROOT/'reports').glob('*.md'))
        for path in sources:
            info = zipfile.ZipInfo('source/'+path.relative_to(ROOT).as_posix(),date_time=(2024,8,2,0,0,0))
            info.compress_type = zipfile.ZIP_DEFLATED
            archive.writestr(info,path.read_bytes())
    print(f'Built {len(hook)} CK610 callback bytes; {len(resources)} changed resource files; cramfs {len(packed):#x}/{fw.by_name["ROOT"]["capacity"]:#x}')
    print('NO MODIFIED FLASH BIN: see patch_manifest.json release_blockers')
    return manifest


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--objdump',type=Path)
    args = parser.parse_args()
    build(args.objdump)
