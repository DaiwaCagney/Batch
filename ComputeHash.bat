@echo off
echo If want to know more about certutil - Please use: certutil -?
certutil -hashfile -?

echo Please input filename
set /p filename=

echo Please input hash type
set /p hashtype=

echo Hash Value is:
certutil -hashfile  %filename%  %hashtype%