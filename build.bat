@echo off
setlocal
cd /d "%~dp0"
if not exist .venv\Scripts\python.exe (
  py -3 -m venv .venv
  if errorlevel 1 exit /b 1
)
.venv\Scripts\python.exe -m pip install -r requirements.txt
if errorlevel 1 exit /b 1
.venv\Scripts\python.exe -m unittest discover -s tests -v
if errorlevel 1 exit /b 1
if defined CSKY_OBJDUMP (
  .venv\Scripts\python.exe tools\build.py --objdump "%CSKY_OBJDUMP%"
) else (
  .venv\Scripts\python.exe tools\build.py
)
if errorlevel 1 exit /b 1
echo Research artifacts built. No modified flash BIN was produced.
exit /b 0
