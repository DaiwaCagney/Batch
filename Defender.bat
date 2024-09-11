@echo off
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -SignatureUpdate -MMPC
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 2