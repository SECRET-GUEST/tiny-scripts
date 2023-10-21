# Audio Monitor

## Introduction
The Audio Monitor is a simple C application utilizing GTK+ for the graphical interface and pthread for threading. It monitors a specified directory for new WAV audio files and plays them using the default audio player once they appear. The program checks for new files every 10 seconds.

## Prerequisites
- GCC (GNU Compiler Collection)
- GTK+ 3.0 or newer
- pthread library

## Installation and Running
1. Clone the repository or download the `audio_listener.c` file to your local machine.
2. Open a terminal and navigate to the directory containing `audio_listener.c`.
3. Compile the program using the following command:
   ```bash
   gcc `pkg-config --cflags gtk+-3.0` -o monitor audio_listener.c `pkg-config --libs gtk+-3.0`
   ```
4. Run the compiled program:
   ```bash
   ./monitor
   ```
5. Click the "Démarrer" button to start monitoring for new WAV files in the `/tmp/` directory.

