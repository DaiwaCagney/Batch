@echo off

echo Please Input the Name of the Domain
set /p DCNAME=
nltest /DCList:%DCNAME%