[![Python 3.x](https://img.shields.io/badge/python-3.x-blue.svg)](https://www.python.org/) 
```
██████╗  ██████╗     ██████╗ ███████╗███╗   ███╗ ██████╗ ██╗   ██╗███████╗██████╗ 
██╔══██╗██╔════╝     ██╔══██╗██╔════╝████╗ ████║██╔═══██╗██║   ██║██╔════╝██╔══██╗
██████╔╝██║  ███╗    ██████╔╝█████╗  ██╔████╔██║██║   ██║██║   ██║█████╗  ██████╔╝
██╔══██╗██║   ██║    ██╔══██╗██╔══╝  ██║╚██╔╝██║██║   ██║╚██╗ ██╔╝██╔══╝  ██╔══██╗
██████╔╝╚██████╔╝    ██║  ██║███████╗██║ ╚═╝ ██║╚██████╔╝ ╚████╔╝ ███████╗██║  ██║
╚═════╝  ╚═════╝     ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝ ╚═════╝   ╚═══╝  ╚══════╝╚═╝  ╚═╝
                                                                                  
```

# Description

[![rembg](https://img.shields.io/badge/rembg-1.0.28-blue)](https://pypi.org/project/rembg/) [![PIL](https://img.shields.io/badge/PIL-8.3.2-blue)](https://pypi.org/project/Pillow/) [![PyQt5](https://img.shields.io/badge/PyQt5-5.15.4-blue)](https://pypi.org/project/PyQt5/) [![numpy](https://img.shields.io/badge/numpy-1.21.2-blue)](https://pypi.org/project/numpy/)

Background Remover is a GUI-based application crafted to remove the background from images (both PNG and JPG formats) within a user-selected folder. It offers customization options, including background color replacement, random pastel coloring, or transparent background.

## Main Features

- **Background Removal**: Utilizes the `rembg` library to remove the background from selected images efficiently.
- **Color Replacement**: Allows users to select a specific color for the background or opt for a random pastel color.
- **Include Subfolders**: The option to include all subfolders for processing, maintaining the same folder structure in the output directory.
- **Progress Tracking**: Integrated progress bar to track the processing of the images.
- **Error Handling**: In-built error handling to prevent users from selecting an output folder that is a subfolder of the input, ensuring smooth operation.

## How to Use

1. **Select Folder**: Choose the input folder containing the images.
2. **Choose Output Folder**: Select the desired output folder for processed images.
3. **Set Background Options**: Pick the background color, select random pastel color, or choose a transparent background.
4. **Include Subfolders**: Optionally include all subfolders for processing.
5. **Start Processing**: Click the 'Launch' button to begin background removal.

The application is user-friendly, allowing even non-tech-savvy individuals to easily remove backgrounds from images.

### Usage and Dependencies

Ensure you have the required libraries installed:

- `PyQt5` for the GUI.
- `rembg` for background removal.
- `PIL` (Pillow) for image processing.
- `numpy` for numerical operations.

You can install the dependencies using the following command:

```bash
pip install PyQt5 rembg Pillow numpy
```

Run the application by executing the main script:

```bash
python remBackBatch.py
```

## Complete Version

Image Converter is also encompassed within a more comprehensive program called Metamorphix, offering additional options and extended functionalities. You can find the complete version here: Metamorphix GitHub Repository.





# Example :

![5](https://user-images.githubusercontent.com/92639080/209292936-f272c072-9235-4a17-93dc-a3bb426d529a.jpg)
![6](https://user-images.githubusercontent.com/92639080/209292946-19d0faa9-382e-4ec4-86ff-e239b12ab574.jpg)
![7](https://user-images.githubusercontent.com/92639080/209292951-8c433d3c-b788-4ea8-b7a4-3480d4055b44.jpg)
