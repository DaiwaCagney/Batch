@echo off

echo Where is the list?
set /p Dir=

echo Look for what field?
set /p field=

echo Search Start
setlocal enabledelayedexpansion
for /f %%U in (%Dir%) do (
    net user /domain %%U >nul 2>&1
    if !errorlevel! equ 0 (
        for /f "tokens=1,2,* delims= " %%A in ('net user /domain %%U ^| find %field%') do (
            echo %%U %%C >> Result.txt
        )
    )
)
endlocal

echo Finish
pause