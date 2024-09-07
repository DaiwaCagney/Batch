@echo off

echo To Stop Microsoft Compatibility Telemetry

echo Confirm: (Y/N)
set /p confirm=

if NOT "%confirm%"=="Y" (
    if NOT "%confirm%"=="N" (
        echo Please input Y or N
        exit /B 0
    )
)

if "%confirm%"=="N" (
    exit /B 0
)

sc stop DiagTrack

sc config DiagTrack start= disabled

schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /disable
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable

schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable

taskkill /IM compattelrunner.exe /F

schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable

schtasks /change /tn "\Microsoft\Windows\Application Experience\AitAgent" /disable

schtasks /change /tn "\Microsoft\Windows\Autochk\Proxy" /disable