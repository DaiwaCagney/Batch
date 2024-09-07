goto Comment
This script is for some simple Json format
For example
{
  "name": "John Doe",
  "age": 30,
  "isStudent": false,
  "courses": null
}
:Comment

@echo off
setlocal enabledelayedexpansion

echo File Name of the JSON
set /p filename=

echo:
echo Before extract the Key Value Pair
set "string="

for /f "delims=" %%x in (%filename%) do set "string=!string!%%x"

set "string=%string:"=%"
set "string=%string:{=%"
set "string=%string:}=%"
set "string=%string:: ==%"
set "string=%string:  =%"

echo %string%

set "RemainingString=%string%"

echo:
echo Key Value Pair as follow:

:loop
if "%RemainingString%"=="" goto end

for /f "tokens=1* delims=," %%a in ("%RemainingString%") do (
    set "KeyValuePair=%%a"
    set "RemainingString=%%b"
)

echo %KeyValuePair%

goto loop

:end

endlocal
pause