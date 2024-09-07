@echo off
echo Please input the URL
set /p website=
openssl s_client -connect %website%:443 -showcerts