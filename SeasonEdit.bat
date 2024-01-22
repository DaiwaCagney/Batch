@ECHO OFF
:: Save the original path
Set OriDir=%CD%
:: Get the season number
Set Season=%2
Set /a Ep=1
cd %1
setlocal ENABLEDELAYEDEXPANSION
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
cd %OriDir%
echo Finish