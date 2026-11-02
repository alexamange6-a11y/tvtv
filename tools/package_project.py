"""Bundle the full project, original inputs archive and verified research outputs.

The top-level build.bat is runnable after extraction. No modified flash BIN is
included. This packager uses only Python's standard library.
"""
from pathlib import Path
import argparse
import hashlib
import json
import zipfile

ROOT = Path(__file__).resolve().parents[1]
PREFIX = 'Romsat_T8020HD_Project_NOT_FLASHABLE/'
NAME = 'Romsat_T8020HD_FULL_PROJECT_NOT_FLASHABLE.zip'


def package_project(destination=None):
    destination = Path(destination) if destination else ROOT/'build'/NAME
    artifacts = ROOT/'build/romsat_research_artifacts_NOT_FLASHABLE.zip'
    if not artifacts.is_file():
        raise ValueError('First run build.bat or tools/build.py')
    sources = [ROOT/name for name in ('.gitignore','START_HERE_RU.md','README_RU.md',
               'build.bat','requirements.txt','Romsat_T8020HD_Codex_Full_Project.zip')]
    for directory in ('tools','tests','reports'):
        sources += [p for p in sorted((ROOT/directory).rglob('*'))
                    if p.is_file() and '__pycache__' not in p.parts
                    and p.suffix in ('.py','.sh','.md','.json','.asm','.log')]
    payload = {p.relative_to(ROOT).as_posix():p.read_bytes() for p in sources}
    with zipfile.ZipFile(artifacts) as archive:
        if archive.testzip() is not None:
            raise ValueError('Research artifact ZIP has invalid CRC')
        manifest = json.loads(archive.read('patch_manifest.json'))
        if manifest.get('modified_flash_bin_emitted') is not False:
            raise ValueError('Artifact status must explicitly reject a modified flash BIN')
        for entry in archive.infolist():
            if entry.is_dir() or entry.filename.startswith('source/'):
                continue
            path = Path(entry.filename)
            if path.is_absolute() or '..' in path.parts or '\\' in entry.filename:
                raise ValueError('Unsafe artifact path')
            if entry.filename.lower().endswith('.bin'):
                raise ValueError('Unexpected BIN in research outputs')
            payload['build/'+entry.filename] = archive.read(entry)
    with zipfile.ZipFile(ROOT/'Romsat_T8020HD_Codex_Full_Project.zip') as original:
        if original.testzip() is not None:
            raise ValueError('Original archive has invalid CRC')
        digest = hashlib.sha256(original.read('firmware/original_firmware.bin')).hexdigest()
        if digest != '3395ffe1989e78a1e4496c91246b8b84f3efcd16ca9ee6d8606691523a03aa4c':
            raise ValueError('Wrong original firmware')
    sums = ''.join(f'{hashlib.sha256(data).hexdigest()}  {name}\n'
                   for name,data in sorted(payload.items()))
    payload['SHA256SUMS.txt'] = sums.encode('utf-8')
    destination.parent.mkdir(parents=True,exist_ok=True)
    with zipfile.ZipFile(destination,'w',zipfile.ZIP_DEFLATED) as archive:
        for name,data in sorted(payload.items()):
            info = zipfile.ZipInfo(PREFIX+name,date_time=(2024,8,2,0,0,0))
            info.compress_type = zipfile.ZIP_DEFLATED
            archive.writestr(info,data)
    with zipfile.ZipFile(destination) as archive:
        if archive.testzip() is not None:
            raise ValueError('Full project ZIP has invalid CRC')
        if len(archive.namelist()) != len(set(archive.namelist())):
            raise ValueError('Duplicate package paths')
    print(destination)
    print(f'{len(payload)} files; {destination.stat().st_size} bytes')
    print('SHA256 '+hashlib.sha256(destination.read_bytes()).hexdigest())
    return destination


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output',type=Path)
    args = parser.parse_args()
    package_project(args.output)
