@echo off
rem Hellwalker - every done-test, headless: 14 core tests (the same functions the B0 simulator runs) + UE-side checks.
setlocal
set UE=D:\Shadow\Epic Games\UE_5.8
"%UE%\Engine\Binaries\Win64\UnrealEditor-Cmd.exe" "%~dp0..\Hellwalker.uproject" -ExecCmds="Automation RunTests Project.Hellwalker;Quit" -unattended -nullrhi -nosplash -nosound -nopause -ReportExportPath="%~dp0..\Saved\Automation" >nul 2>&1
set RC=%ERRORLEVEL%
findstr /C:"Test Completed" "%~dp0..\Saved\Logs\Hellwalker.log"
echo Exit code %RC% (0 = all passed)
exit /b %RC%
