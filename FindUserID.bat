@echo off

set /p Dir=

setlocal enabledelayedexpansion
for /f %%U in (%Dir%) do (
    net user /domain %%U >nul 2>&1
    if !errorlevel! equ 0 (
        for /f "tokens=1,2,* delims= " %%A in ('net user /domain %%U ^| find "Full Name"') do (
            echo %%U %%C >> Result.txt
        )
    )
)
endlocal

echo finish
pause