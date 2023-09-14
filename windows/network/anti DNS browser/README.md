[![OS](https://img.shields.io/badge/OS-Windows-blue)](https://img.shields.io/badge/OS-Windows-blue)
```
██╗███╗   ██╗ ██████╗ ██████╗  ██████╗ ███╗   ██╗██╗████████╗ ██████╗ 
██║████╗  ██║██╔════╝██╔═══██╗██╔════╝ ████╗  ██║██║╚══██╔══╝██╔═══██╗
██║██╔██╗ ██║██║     ██║   ██║██║  ███╗██╔██╗ ██║██║   ██║   ██║   ██║
██║██║╚██╗██║██║     ██║   ██║██║   ██║██║╚██╗██║██║   ██║   ██║   ██║
██║██║ ╚████║╚██████╗╚██████╔╝╚██████╔╝██║ ╚████║██║   ██║   ╚██████╔╝
╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═╝   ╚═╝    ╚═════╝ 
                                                                      
```

# Flush DNS and Launch Browser in Incognito Mode Script

This script performs two main tasks:

1. It launches your web browser in incognito mode.
2. After the browser is closed, it clears your DNS cache to remove any traces of the websites you visited.

The script uses Python and Batch scripting and is specifically designed for Windows.

## Usage

1. Download both the Python script (`flushdns.pyw`) and the Batch script.

2. Place both scripts in the same directory.

3. Open the Python script and replace `"C:YOUR_PATH\Firefox.exe"` with the actual path to your web browser's executable file. Make sure to use double backslashes (`\\`) to escape the backslashes in the file path. 

    Example: `r"C:\\Program Files\\Mozilla Firefox\\firefox.exe"`

4. Open the Batch script and replace `"C:YOUR_PATH\flushdns.pyw"` with the actual path to the Python script. Use double backslashes to escape the backslashes in the file path.

5. To run the script, simply double-click on the Batch file. This will launch your browser in incognito mode and clear your DNS cache after you close the browser.

## Security Note

This script modifies your DNS cache, which can affect your computer's network connections. Make sure you understand the implications before running this script. Also, remember that incognito mode and clearing your DNS cache do not make you completely anonymous on the internet. Your internet service provider (ISP) and the websites you visit can still track your activity.

