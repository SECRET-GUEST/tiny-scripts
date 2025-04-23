[![OS](https://img.shields.io/badge/WINDOWS-blue)](https://www.microsoft.com/windows)
```
██╗   ██╗██╗██████╗ ███████╗ ██████╗      ██████╗ ██████╗ ███╗   ██╗██╗   ██╗███████╗██████╗ ████████╗███████╗██████╗ 
██║   ██║██║██╔══██╗██╔════╝██╔═══██╗    ██╔════╝██╔═══██╗████╗  ██║██║   ██║██╔════╝██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
██║   ██║██║██║  ██║█████╗  ██║   ██║    ██║     ██║   ██║██╔██╗ ██║██║   ██║█████╗  ██████╔╝   ██║   █████╗  ██████╔╝
╚██╗ ██╔╝██║██║  ██║██╔══╝  ██║   ██║    ██║     ██║   ██║██║╚██╗██║╚██╗ ██╔╝██╔══╝  ██╔══██╗   ██║   ██╔══╝  ██╔══██╗
 ╚████╔╝ ██║██████╔╝███████╗╚██████╔╝    ╚██████╗╚██████╔╝██║ ╚████║ ╚████╔╝ ███████╗██║  ██║   ██║   ███████╗██║  ██║
  ╚═══╝  ╚═╝╚═════╝ ╚══════╝ ╚═════╝      ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
```
# Video Converter

This PowerShell script is designed to automate the process of converting video files into various formats (MP4, WebM, MOV, etc.) using **FFmpeg**. It supports both individual file conversions and batch processing, and allows for customization in the conversion quality, resolution, and output format.

## Features:
- Convert video files in multiple formats (MP4, WebM, MOV, etc.)
- Customize video quality using the CRF (Constant Rate Factor) value
- Resize videos (optional)
- Batch convert multiple files in a folder (recursive option)
- Prevent overwriting of existing files by appending a counter to the output file name
- Automatically creates necessary directories for output files

## Prerequisites:
Before using this script, you need to have **FFmpeg** installed and accessible from your system's PATH. FFmpeg is a free and open-source software suite for handling video, audio, and other multimedia files and streams.

### Installing FFmpeg on Windows:
1. Download FFmpeg from the official website: [FFmpeg Download](https://ffmpeg.org/download.html).
   
2. Once downloaded, extract the ZIP file to a folder (e.g., `C:\ffmpeg`).

3. Add FFmpeg to the system PATH:
   - Open the **Start Menu** and search for **Environment Variables**.
   - Click on **Edit the system environment variables**.
   - In the **System Properties** window, click the **Environment Variables** button.
   - Under **System Variables**, find and select the `Path` variable, then click **Edit**.
   - Click **New** and add the path to the `bin` directory inside the folder where you extracted FFmpeg (e.g., `C:\ffmpeg\bin`).
   - Click **OK** to save the changes.

4. Verify the installation by opening a **Command Prompt** and typing:
   ```bash
   ffmpeg -version
   ```
   You should see the FFmpeg version information if it's installed correctly.

## How to Use the Script:

1. **Clone this repository** or download the script files to your local machine.

2. **Open PowerShell** and navigate to the folder containing the script.

3. **Run the script** with the required parameters. For example:
   ```powershell
   .\convert-video.ps1 -InputPath "C:\videos" -OutputPath "C:\converted_videos" -OutputExtension "mp4" -Quality 23 -Recursive $true
   ```
   This will convert all video files in the `C:\videos` directory and subdirectories to MP4 format with a CRF value of 23, and save them to `C:\converted_videos`.

### Script Parameters:
- **InputPath** (string): The path to the input directory containing the video files. You can specify a single file or a directory.
- **OutputPath** (string): The path where converted videos will be saved.
- **OutputExtension** (string): The desired output format (e.g., "mp4", "webm", "mov").
- **Quality** (integer): The CRF value for video quality. Lower values mean better quality (default is 10).
- **Recursive** (boolean): Set to `$true` to process all videos in subdirectories as well.
- **Resize** (boolean): Set to `$true` if you want to resize the videos (you can also specify the width and height).
- **Width** (integer): The width for resizing (optional).
- **Height** (integer): The height for resizing (optional).

### Example Usage:
Convert all `.avi` files in a folder to MP4 format with a CRF value of 23, recursively processing subdirectories:
```powershell
.\convert-video.ps1 -InputPath "C:\videos" -OutputPath "C:\converted_videos" -OutputExtension "mp4" -Quality 23 -Recursive $true
```

### Converting to Different Formats:
You can easily switch between different output formats by changing the **OutputExtension** parameter. For example, to convert to WebM:
```powershell
.\convert-video.ps1 -InputPath "C:\videos" -OutputPath "C:\converted_videos" -OutputExtension "webm" -Quality 30
```
