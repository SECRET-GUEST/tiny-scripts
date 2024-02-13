REM dd if=/dev/zero of=\\.\X: bs=1M

$drive = "C:"
$blockSize = 1MB
$driveInfo = Get-PSDrive -Name $drive[0]
$totalSize = $driveInfo.Used + $driveInfo.Free
$filePath = $drive + "\zero.bin"

$fs = [System.IO.File]::Create($filePath)
$bytes = New-Object byte[] $blockSize
$written = 0

while ($written -lt $totalSize) {
    $fs.Write($bytes, 0, $bytes.Length)
    $fs.Flush()
    $written += $bytes.Length
}

$fs.Close()
Remove-Item $filePath
