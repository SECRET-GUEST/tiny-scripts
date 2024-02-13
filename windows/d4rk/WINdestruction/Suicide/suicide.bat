REM dd if=/dev/zero of=%~d0 bs=1M

@echo off
SET "FichierCible=%~dp0zero.bin"
SET "TailleFichier=1MB"

PowerShell -Command "& {New-Object byte[] ([System.Convert]::ToInt32((%TailleFichier%).ToString().Replace('MB','')) * 1024 * 1024) | Set-Content -LiteralPath '%FichierCible%' -Encoding Byte}"
