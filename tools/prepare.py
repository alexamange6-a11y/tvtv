"""Extract the supplied project without overwriting edited inputs."""
from pathlib import Path
import hashlib
import zipfile

ROOT = Path(__file__).resolve().parents[1]
ARCHIVE = ROOT / 'Romsat_T8020HD_Codex_Full_Project.zip'
INPUTS = ROOT / 'inputs'


def prepare():
    with zipfile.ZipFile(ARCHIVE) as archive:
        if archive.testzip():
            raise ValueError('ZIP CRC failure')
        for member in archive.infolist():
            target = INPUTS / member.filename
            if not target.resolve().is_relative_to(INPUTS.resolve()):
                raise ValueError('Unsafe ZIP path')
            if member.is_dir():
                target.mkdir(parents=True, exist_ok=True)
                continue
            data = archive.read(member)
            if target.exists():
                if target.read_bytes() != data:
                    raise ValueError(f'Preserving changed input: {target}')
                continue
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(data)
    firmware = INPUTS / 'firmware/original_firmware.bin'
    digest = hashlib.sha256(firmware.read_bytes()).hexdigest()
    if digest != '3395ffe1989e78a1e4496c91246b8b84f3efcd16ca9ee6d8606691523a03aa4c':
        raise ValueError('Wrong firmware revision')
    return INPUTS


if __name__ == '__main__':
    print(prepare())
