@ECHO OFF
:: Save the original path
Set OriDir=%CD%
:: Get file location
echo Input File Location
Set /p TarDir=
:: Get season
echo Input Which Season
Set /p Season=
:: Go to target directory
cd %TarDir%
::Change name
setlocal ENABLEDELAYEDEXPANSION
Set /a Ep=1
for %%x in (*) do (
    if !Ep! LSS 10 (
        Ren "%%x" "Episode S%Season%E0!Ep!%%~xx"
        Set /a Ep=Ep+1
    ) else (
        Ren "%%x" "Episode S%Season%E!Ep!%%~xx"
        Set /a Ep=Ep+1
    )
)
endlocal
:: Go back to original directory
cd %OriDir%
:: Finish
echo Finish