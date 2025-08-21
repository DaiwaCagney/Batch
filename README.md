# Batch

# Check Cert:
echo Please input the URL

set /p website=

openssl s_client -connect %website%:443 -showcerts

# Check KB:
wmic qfe get HotfixID

# Check DC:
echo Please Input the Name of the Domain

set /p DCNAME=

nltest /DCList:%DCNAME%

# Defender:
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -SignatureUpdate -MMPC

"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 2

# Start gpedit.msc:
FOR %F IN ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~*.mum") DO ( DISM /Online /NoRestart /Add-Package:"%F" )

FOR %F IN ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~*.mum") DO ( DISM /Online /NoRestart /Add-Package:"%F" )

# PSExec To System:
psexec.exe -s -i cmd.exe

# Start Telnet:
pkgmgr /iu:"TelnetClient"

# Established Network Connection:
netstat -naob

# Check Process ID
tasklist /m /fi “pid eq <PID>”

wmic process where processid=<PID> get commandline

# Disable Firewall & Defender
Set-MpPreference -DisableRealtimeMonitoring $true

netsh advfirewall set allprofiles state off

# Compute Hash
certutil -hashfile  %filename%  %hashtype%

# Add PATH
set PATH=%PATH%;C:\Your\New\Path

echo %PATH%
