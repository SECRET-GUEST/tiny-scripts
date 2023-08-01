[![OS](https://img.shields.io/badge/OS-Windows-blue)](https://img.shields.io/badge/OS-Windows-blue)
```
██████╗ ███╗   ██╗███████╗    ███████╗██╗    ██╗██╗████████╗ ██████╗██╗  ██╗███████╗██████╗ 
██╔══██╗████╗  ██║██╔════╝    ██╔════╝██║    ██║██║╚══██╔══╝██╔════╝██║  ██║██╔════╝██╔══██╗
██║  ██║██╔██╗ ██║███████╗    ███████╗██║ █╗ ██║██║   ██║   ██║     ███████║█████╗  ██████╔╝
██║  ██║██║╚██╗██║╚════██║    ╚════██║██║███╗██║██║   ██║   ██║     ██╔══██║██╔══╝  ██╔══██╗
██████╔╝██║ ╚████║███████║    ███████║╚███╔███╔╝██║   ██║   ╚██████╗██║  ██║███████╗██║  ██║
╚═════╝ ╚═╝  ╚═══╝╚══════╝    ╚══════╝ ╚══╝╚══╝ ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
                                                                                            
```


# DNS Switcher Script for Windows



This PowerShell script allows a user to easily change the DNS server used by their computer. The script provides several secure and reliable DNS server options, including Google DNS, Cloudflare, Quad9, OpenDNS, DNS.WATCH, Comodo Secure DNS, and FreeDNS. The user can also choose to revert to automatic DNS settings.

## Usage


To run the script with a single click, you can create a shortcut that launches PowerShell as an administrator and runs the script:

1. Right-click on your desktop (or wherever you want to place the shortcut) and choose "New" > "Shortcut".

2. In the window that opens, enter the following command in the "Type the location of the item" field:

```
powershell.exe -Command "Start-Process PowerShell -ArgumentList '-ExecutionPolicy Bypass -File ""C:\Path\to\the\script\dns.ps1""' -Verb RunAs"
```


Or you can also : 

1. Download the script and place it in a location of your choice.

2. Open a PowerShell window as an administrator.

3. Navigate to the location of the script using the `cd` command.

4. Run the script with the command `.\dns.ps1`.

5. When the script runs, it will prompt you to choose a DNS server from the available options. Enter the number corresponding to your choice and press Enter.

6. The script will then change your computer's DNS settings to use the DNS server you chose.



Make sure to replace `"C:\Path\to\the\script\dns.ps1"` with the actual path to your script.

3. Click "Next", give your shortcut a name, then click "Finish".

Now, when you double-click on this shortcut, it will launch PowerShell as an administrator and run your script.

## Security Note

Modifying your DNS settings can affect how your computer interacts with the internet. Make sure you understand the implications before changing your DNS settings. This script requires administrator privileges to function.
