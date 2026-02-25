# Batch

## Date
`date & time`

`echo | date >> file.txt`

---

## System Information
`systeminfo`

`ver`

`vol` - Volume Label and Volume Serial Number

`%TEMP%`

---

## Check Cert
```
echo Please input the URL
set /p website=
openssl s_client -connect %website%:443 -showcerts
```

---

## Check KB
`wmic qfe get HotfixID`

---

## Check DC
```
echo Please Input the Name of the Domain
set /p DCNAME=
nltest /DCList:%DCNAME%
```

---

## Defender
`"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -SignatureUpdate -MMPC`

`"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 2`

---

## Start gpedit.msc
`FOR %F IN ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~*.mum") DO ( DISM /Online /NoRestart /Add-Package:"%F" )`

`FOR %F IN ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~*.mum") DO ( DISM /Online /NoRestart /Add-Package:"%F" )`

---

## PSExec To System
`psexec.exe -s -i cmd.exe`

---

## Start Telnet
`pkgmgr /iu:"TelnetClient"`

---

## Network
`netstat -naob` - Established network connection

`netstat -r` - IP Routing Table

`net statistics workstation`

`net session` - who is connected

`net file` - who is connected and what they are doing

`net view` - Network Scan

`Netsh firewall show opmode` --> show available profiles in firewall

`netsh advfirewall firewall add rule` --> add a new rule in firewall

---

## Process
`tasklist /m /fi “pid eq <PID>”`

`wmic process where processid=<PID> get commandline`

`tasklist /v`

`tasklist /svc`

`net start`

---

## Disable Firewall & Defender
`Set-MpPreference -DisableRealtimeMonitoring $true`

`netsh advfirewall set allprofiles state off`

---

## Compute Hash
`certutil -hashfile  %filename%  %hashtype%`

---

## Add PATH
`set PATH=%PATH%;C:\Your\New\Path`

`echo %PATH%`

---

## openfiles
`openfiles`

`openfiles /local on`

---

## Dumping Wi-Fi Credentials Using netsh
`netsh wlan show profiles`

`netsh wlan show profile name={name} key=clear`

---

## WMIC
This tells them the system’s language and region settings (e.g., en-US, ru-RU, etc.). Some malware avoids executing in certain regions to stay under the radar  
`wmic os get locale`

Grabs a unique hardware ID that helps detect if the malware is running in a virtual machine (a common analysis environment)  
`wmic csproduct get uuid`

Returns the OS version (e.g., Windows 10 Pro), which helps decide if the system is a viable target  
`wmic os get Caption`

This installs a product key on the system, usually a routine action  
`wmic path SoftwareLicensingService call InstallProductKey`

This command triggers a license check on the system, another behavior that can either reinforce the disguise or quietly collect status data  
`wmic call RefreshLicenseStatus`

This command tells Windows Defender to exclude the entire C:\ drive from scans  
`wmic /Namespace:\\root\Microsoft\Windows\Defender class MSFT_MpPreference call Add ExclusionPath=”C:\” `

This disables the Windows recovery environment entirely, preventing the system from launching recovery tools during startup  
`wmic bcdedit /set {default} recoveryenabled no`

Silently deletes all existing shadow copies  
`vssadmin delete shadows /all /quiet`

Another method to remove previous restore points that users could use to roll back encrypted files  
`wmic shadowcopy delete`

This command attempts to terminate a running process, any process it has permission to kill  
`wmic process call terminate`

`wmic process where “name=’svchost.exe'” call terminate`

---
