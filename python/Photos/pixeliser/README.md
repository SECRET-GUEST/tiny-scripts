
Python 3.11
```
██████╗ ██╗██╗  ██╗███████╗██╗     ██╗███████╗███████╗██████╗ 
██╔══██╗██║╚██╗██╔╝██╔════╝██║     ██║██╔════╝██╔════╝██╔══██╗
██████╔╝██║ ╚███╔╝ █████╗  ██║     ██║███████╗█████╗  ██████╔╝
██╔═══╝ ██║ ██╔██╗ ██╔══╝  ██║     ██║╚════██║██╔══╝  ██╔══██╗
██║     ██║██╔╝ ██╗███████╗███████╗██║███████║███████╗██║  ██║
╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚══════╝╚══════╝╚═╝  ╚═╝
```

[![PIL](https://img.shields.io/badge/PIL-8.3.1-green.svg)](https://pypi.org/project/PIL/)
[![Python](https://img.shields.io/badge/Python-3.11-blue.svg)](https://www.python.org/downloads/release/python-311/)

This script will pixelate your pictures, keeping the same size as the original one.

# Version 1

The first version of Pixeliser is a simple command-line script that pixelates an image. You can change the size of the pixels and the paths for input and output files directly within the code.

## Installation for Version 1:

You may have to import PIL (not pillow) if you don't have the library included in your Python environment.
So run in your CMD 

```bash
python -m pip install PIL
```

After this, you have to set these things:

  1. Change the input path to yours
  2. Change the pixel size
  3. Change the output path, and name the file, choose the extension.


# Version 2 (Pixeliser v2)

Version 2 introduces a GUI using PyQt5, enabling users to select input/output folders or single files, and apply pixelization with a click. It provides options to pixelize a single image or a complete folder, allowing a more user-friendly experience.

## Installation for Version 2:

Follow the same installation process as Version 1, and make sure you have PyQt5 installed:

```bash
python -m pip install PyQt5
```

### Usage:

  1. Run the script
  2. Select Input (either a Folder or an individual image)
  3. Select Output Folder
  4. Choose the Pixel Size
  5. Click "Launch pixelizer"

**Note:** Version 2 is used in a more comprehensive program, Metamorphix. Check it out [Macara GitHub Repository.](https://github.com/SECRET-GUEST/Macara)!


# Examples :

It will turns your **RGBA** input ( like .png with **background Transparency**) into **RGB without Alpha / Transparency**

![1](https://user-images.githubusercontent.com/92639080/209363565-0c15b230-92ac-4619-994d-b0b42f80c7ed.jpg)

Also lesser the value of pixel_size is better the quality will approach the original input

**Here an example if pixel_size = 4**
![2](https://user-images.githubusercontent.com/92639080/209364023-fa3e5a07-3cc4-428d-aa62-d3eb34d05bcd.jpg)

**Here an example if pixel_size = 555**

![3](https://user-images.githubusercontent.com/92639080/209364043-36454438-e6ab-49e9-a37f-6decdd4b9231.jpg)
