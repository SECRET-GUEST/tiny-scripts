```
██╗    ██╗██╗███╗   ██╗██████╗ ███████╗███████╗████████╗██████╗ ██╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗
██║    ██║██║████╗  ██║██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔══██╗██║   ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║
██║ █╗ ██║██║██╔██╗ ██║██║  ██║█████╗  ███████╗   ██║   ██████╔╝██║   ██║██║        ██║   ██║██║   ██║██╔██╗ ██║
██║███╗██║██║██║╚██╗██║██║  ██║██╔══╝  ╚════██║   ██║   ██╔══██╗██║   ██║██║        ██║   ██║██║   ██║██║╚██╗██║
╚███╔███╔╝██║██║ ╚████║██████╔╝███████╗███████║   ██║   ██║  ██║╚██████╔╝╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║
 ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
                                                                                                                
```
# Anti system system club

## ❗ Warning

This repository contains potentially dangerous scripts that perform destructive operations on disk partitions. Use them at your own risk and ensure to fully understand the commands before executing them. These scripts should only be used to erase confidential partitions. It is important to emphasize that without complete physical destruction of the drives, the risk of data recovery is not 100% guaranteed. Below, you will find a detailed explanation of each script along with their respective potential data recovery percentages as indicated by a shield.io badge.

---

## 1. fastHit.bat
![Recovery Risk: 75%](https://img.shields.io/badge/Recovery%20Risk-75%25-red)

This script formats the specified partition (X:) to NTFS file system and performs a single pass of data wiping. It uses the command:

```batch
format X: /fs:ntfs /p:1
```

#### Operations Explained:
- `format`: Command to format a partition.
- `X:`: Specifies the target drive (X: in this case).
- `/fs:ntfs`: Formats the partition with NTFS file system.
- `/p:1`: Specifies the number of passes (1 in this case).

## 2. ultraHit.bat
![Recovery Risk: 40%](https://img.shields.io/badge/Recovery%20Risk-40%25-orange)

This script writes zeros to all the sectors in the partition (X:) using `dd`, a powerful disk copying tool. The command used is:

```batch
dd if=/dev/zero of=\\.\X: bs=1M
```

#### Operations Explained:
- `dd`: Disk copying tool used to convert and copy files.
- `if=/dev/zero`: Input file is set to `/dev/zero`, which writes zeros.
- `of=\\.\X:`: Output file set to the target partition (X:).
- `bs=1M`: Block size set to 1 megabyte.

## 3. comboHit.bat
![Recovery Risk: 15%](https://img.shields.io/badge/Recovery%20Risk-15%25-yellow)

This script performs three passes of data wiping on the specified partition (X:), making data recovery extremely difficult. It uses a loop to execute the `dd` command three times:

```batch
@echo off
setlocal

set "drive=X:"
set "passes=3"

echo Starting secure data erasure on %drive%...
for /l %%i in (1,1,%passes%) do (
    echo Pass %%i of %passes%...
    dd if=/dev/zero of=%drive% bs=4M
)

echo Secure data erasure completed on %drive%.
endlocal
```

#### Operations Explained:
- It performs 3 passes of writing zeros with a block size of 4M.
- Uses a loop to execute the `dd` command 3 times, ensuring more thorough data deletion compared to a single pass.

## 4. suicidalTendencies.bat
![Recovery Risk: 90%](https://img.shields.io/badge/Recovery%20Risk-90%25-red)

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

Bien sûr, voici une partie README adaptée pour votre nouveau script `suicide.bat` :

---

## 5. suicide.bat
![Recovery Risk: 5%](https://img.shields.io/badge/Recovery%20Risk-5%25-green)

This script initiates a highly destructive operation, which writes zeros to every byte of the partition from which the script is executed, essentially "committing suicide". The command used is as follows:

```batch
dd if=/dev/zero of=%~d0 bs=1M
```

#### Operations Explained:
- `dd`: Disk copying tool used to convert and copy files.
- `if=/dev/zero`: Input file is set to `/dev/zero`, which writes zeros.
- `of=%~d0`: Output file set to the partition from which the script is executed.
- `bs=1M`: Block size set to 1 megabyte.

#### ⚠️ Extreme Caution:
- This script will irreversibly destroy all data on the drive from which it is run.
- The operating system and all data will be lost during this process.
- It's very likely that the system will become unresponsive and fail before the process completes, as essential system files will be deleted.
- Before executing, ensure that there is absolutely nothing of value on the drive, and you fully intend to "kill" the drive.
- This script should be used as a last resort for data sanitization and should only be executed with extreme caution.
- Even with a low recovery risk, physical destruction of the drive remains the only method to guarantee 100% data elimination.


## Recommendations

1. Be certain of the target drive before running these scripts to avoid unintended data loss.
2. These scripts should only be used on partitions containing confidential information that needs to be securely erased.
3. For an absolute secure data disposal, physical destruction of the storage medium is recommended.
4. Always back up important data before proceeding with any form of data wiping.

## License

These scripts are provided "AS IS" without warranty of any kind, use them at your own risk. By using these scripts, you agree to take full responsibility for any consequences resulted from the usage.
