![OS](https://img.shields.io/badge/WINDOWS-blue)
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

This folder contains potentially dangerous scripts that perform destructive operations on disk partitions. Use them at your own risk and ensure to fully understand the commands before executing them. These scripts should only be used to erase confidential partitions. It is important to emphasize that without complete physical destruction of the drives, the risk of data recovery is not 100% guaranteed. Below, you will find a detailed explanation of each script along with their respective potential data recovery percentages as indicated by a shield.io badge.

Additionally, within this folder, there is a 'suicide' folder containing scripts of even higher risk, with capabilities extending to system-level data eradication. Please refer to the specific warnings and guidelines detailed in the folder's README before even considering their use.

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


## Recommendations

1. Be certain of the target drive before running these scripts to avoid unintended data loss.
2. These scripts should only be used on partitions containing confidential information that needs to be securely erased.
3. For an absolute secure data disposal, physical destruction of the storage medium is recommended.
4. Always back up important data before proceeding with any form of data wiping.

## License

These scripts are provided "AS IS" without warranty of any kind, use them at your own risk. By using these scripts, you agree to take full responsibility for any consequences resulted from the usage.
