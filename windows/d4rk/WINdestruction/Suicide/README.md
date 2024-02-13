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

#### Preferred Method: Using Linux for Data Destruction
For a thorough and controlled disk wipe, using a command in a Linux environment is recommended. Here's the typical command used:

#### Unix/Linux Command:
```batch
dd if=/dev/zero of=/dev/sdX bs=1M
```

#### Operations Explained (Unix/Linux):
- `dd`: A disk copying tool used in Unix/Linux for converting and copying files.
- `if=/dev/zero`: Sets the input file to `/dev/zero`, which effectively writes zeros.
- `of=/dev/sdX`: Sets the output file to the target disk (replace `/dev/sdX` with the appropriate disk identifier, like `/dev/sda`).
- `bs=1M`: Sets the block size to 1 megabyte, determining the size of each chunk of zeros written.

This command overwrites the entire target disk with zeros, ensuring a comprehensive data wipe. For guidance on installing Linux and executing this command, you can refer to my detailed tutorial in French here: [Installing Linux Tutorial](https://github.com/SECRET-GUEST/LINUX), or find numerous online resources for Linux installation guides.

#### Using suicide.bat on Windows
The `suicide.bat` script is a Windows alternative but is less predictable compared to the Linux method. It requires administrative privileges and attempts to fill the disk with zeros, intermittently deleting files and system processes to make space.

**Execution Requirements and Risks:**
- Administrative privileges are required, and the script will prompt for elevation if not run as an administrator.
- Extremely destructive, potentially rendering the OS and data irrecoverable.
- The process is aggressive and unpredictable, with potential for system failure before complete data eradication.


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
