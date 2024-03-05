@ECHO OFF

:: Save the original path
set OriDir=%CD%

:: Get file location
echo Input File Location
set /p TarDir=

::Ask if delete the empty directory
echo Would you like to delete the directory? (Y/N)
set /p DelDir=

::Check input is valid
if NOT "%DelDir%"=="Y" (
    if NOT "%DelDir%"=="N" (
        echo Please input Y or N
        exit /B 0
    )
)

:: Go to target directory
cd %TarDir%

::Move file
call:GetFileOut

:: Go back to original directory
cd %OriDir%

:: Finish
echo Finish

::Move file function
:GetFileOut
for /D %%x in (*) do (
    cd %%x
    call:GetFileOut
    for %%y in (*) do (
        move "%%y" "%TarDir%"
    )
    cd ..
    if "%DelDir%"=="Y" rmdir %%x
)
exit /B 0