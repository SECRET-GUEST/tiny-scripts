![OS](https://img.shields.io/badge/WINDOWS-blue)

```
██████╗  █████╗ ███╗   ██╗ ██████╗ ███████╗██████╗     ███████╗ ██████╗ ███╗   ██╗███████╗
██╔══██╗██╔══██╗████╗  ██║██╔════╝ ██╔════╝██╔══██╗    ╚══███╔╝██╔═══██╗████╗  ██║██╔════╝
██║  ██║███████║██╔██╗ ██║██║  ███╗█████╗  ██████╔╝      ███╔╝ ██║   ██║██╔██╗ ██║█████╗  
██║  ██║██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██╔══██╗     ███╔╝  ██║   ██║██║╚██╗██║██╔══╝  
██████╔╝██║  ██║██║ ╚████║╚██████╔╝███████╗██║  ██║    ███████╗╚██████╔╝██║ ╚████║███████╗
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝    ╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
```


# ⚠️ DANGER : Instant Execution with a Double Click ❗

## Warning Regarding `suicide.bat` and `suicidalTendencies.bat`

The scripts `suicide.bat` and `suicidalTendencies.bat` are highly dangerous and destructive data eradication tools. These scripts are executable with a simple double-click, which initiates the irreversible data destruction process immediately. They are designed to irreversibly eliminate all data on the partitions they are run on. Here's why these scripts are particularly hazardous:

1. **Irreversible Data Destruction**: These scripts erase all data on the target partition by writing zeros onto every byte, making data recovery extremely difficult, if not impossible.

2. **Operating System Damage**: The `suicide.bat` script is designed to self-destruct, removing not only data but also essential system files necessary for the functioning of the operating system. Running this script will inevitably lead to system failure.

3. **Extremely Risky Usage**: Due to their destructive nature, these scripts should only be used in extreme circumstances where complete and irreversible data deletion is absolutely necessary.

4. **User Responsibility**: Users must be fully aware of the risks associated with running these scripts and take full responsibility for the consequences.

We strongly urge you to exercise the utmost caution and to resort to these scripts only as a last resort when all other data deletion methods have been exhausted. We highly recommend backing up all essential data before running these scripts and to consider physical disk destruction as a safer alternative to ensure complete data elimination.

---
---
---

### 4. suicidalTendencies.bat ![Recovery Risk: 90%](https://img.shields.io/badge/Recovery%20Risk-90%25-red)

This script formats the partition of the drive from which the script is executed. It uses the following dangerous command:

```batch
format %~d0 /fs:fat /p:1 /q
```

#### Operations Explained:
- `format`: Command to format a partition.
- `%~d0`: Targeting the drive from which the script is executed.
- `/fs:fat`: Formats the partition with FAT file system.
- `/p:1`: Specifies one pass of data wiping.
- `/q`: Quick format.

---

### 5. suicide.bat ![Recovery Risk: 5%](https://img.shields.io/badge/Recovery%20Risk-5%25-green)

This script is designed for highly destructive data eradication, either by using a Unix/Linux-based command or its equivalent in Windows. The primary purpose is to irreversibly erase all data on the partition from which it is executed. The Unix/Linux command and its equivalent Windows command are as follows:

#### Unix/Linux Command:
```batch
dd if=/dev/zero of=%~d0 bs=1M
```

#### Operations Explained (Unix/Linux):
- `dd`: A disk copying tool used in Unix/Linux for converting and copying files.
- `if=/dev/zero`: Sets the input file to `/dev/zero`, which effectively writes zeros.
- `of=%~d0`: Sets the output file to the partition from which the script is executed.
- `bs=1M`: Sets the block size to 1 megabyte, determining the size of each chunk of zeros written.

#### Windows Equivalent Command:
```batch
@echo off
SET ScriptPath=%~dp0

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
```

#### Operations Explained (Windows):
- This PowerShell script is designed to create a file on the target drive and continuously write zeros to it until the drive is full.
- `$drive` dynamically identifies the drive where the batch script is executed.
- The script attempts to fill the entire drive with zeros, potentially overwriting all existing data.
- This approach is more comprehensive and aggressive compared to the original Unix/Linux `dd` command, as it continuously writes until the drive is completely full, potentially causing system instability.

#### ⚠️ Extreme Caution:
- Both scripts will irreversibly destroy all data on the drive from which they are run.
- The Windows script, in particular, is designed to fill the entire drive, which can cause the system to become unresponsive or fail.
- These scripts should be used as a last resort for data sanitization and executed with extreme caution.
- Physical destruction of the drive remains the only method to guarantee 100% data elimination.

---
### Recommendations

1. Be certain of the target drive before running these scripts to avoid unintended data loss.
2. These scripts should only be used on partitions containing confidential information that needs to be securely erased.
3. For an absolute secure data disposal, physical destruction of the storage medium is recommended.
4. Always back up important data before proceeding with any form of data wiping.

---
### License

These scripts are provided "AS IS" without warranty of any kind, use them at your own risk. By using these scripts, you agree to take full responsibility for any consequences resulted from the usage.
