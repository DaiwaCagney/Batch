@ECHO OFF

:: Save the original path
set OriDir=%CD%

::Check if the path is on network
echo Network Path or Not? (Y/N)
set /p NetPath=

if NOT "%NetPath%"=="Y" (
    if NOT "%NetPath%"=="N" (
        echo Please input Y or N
        exit /B 0
    )
)

:: Get file location
echo Input File Location
set /p TarDir=

:: Get season
echo Input Which Season
set /p Season=

:: Go to target directory
if "%NetPath%"=="Y" (
    pushd %TarDir%
) else (
    cd %TarDir%
)

::Change name
setlocal ENABLEDELAYEDEXPANSION
set /a Ep=1
for %%x in (*) do (
    if !Ep! LSS 10 (
        ren "%%x" "Episode S%Season%E0!Ep!%%~xx"
        set /a Ep=Ep+1
    ) else (
        ren "%%x" "Episode S%Season%E!Ep!%%~xx"
        set /a Ep=Ep+1
    )
)
endlocal

:: Go back to original directory
if "%NetPath%"=="Y" (
    popd
) else (
    cd %OriDir%
)

:: Finish
echo Finish