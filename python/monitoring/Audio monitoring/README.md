![PYTHON](https://img.shields.io/badge/Python-3.10+-blue)
![LINUX](https://img.shields.io/badge/LINUX-orange)
```
 █████╗ ██╗   ██╗██████╗ ██╗ ██████╗     ███╗   ███╗ ██████╗ ███╗   ██╗██╗████████╗ ██████╗ ██████╗ 
██╔══██╗██║   ██║██╔══██╗██║██╔═══██╗    ████╗ ████║██╔═══██╗████╗  ██║██║╚══██╔══╝██╔═══██╗██╔══██╗
███████║██║   ██║██║  ██║██║██║   ██║    ██╔████╔██║██║   ██║██╔██╗ ██║██║   ██║   ██║   ██║██████╔╝
██╔══██║██║   ██║██║  ██║██║██║   ██║    ██║╚██╔╝██║██║   ██║██║╚██╗██║██║   ██║   ██║   ██║██╔══██╗
██║  ██║╚██████╔╝██████╔╝██║╚██████╔╝    ██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██║   ██║   ╚██████╔╝██║  ██║
╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝     ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
```

## Introduction
The Audio Monitor is a simple Python application utilizing the Kivy framework for the graphical interface. It monitors a specified directory for new WAV audio files and plays them using the default audio player once they appear. The program checks for new files every 10 seconds.

## Prerequisites
- Python 3.x
- Kivy 2.0.0 or newer

## Installation and Running
1. Clone the repository or download the Python script file to your local machine.
2. Make sure you have Kivy installed. If not, install it using pip:
   ```bash
   pip install kivy
   ```
3. Open a terminal and navigate to the directory containing the Python script.
4. Run the script using the following command:
   ```bash
   python3 audio_listener.py
   ```
5. Click the "Démarrer" button to start monitoring for new WAV files in the `/tmp/` directory.

## Recommandation :

A different version written in C [can be found here ](https://github.com/SECRET-GUEST/tiny-scripts/tree/ALL/C/monitoring/sound%20monitoring)
