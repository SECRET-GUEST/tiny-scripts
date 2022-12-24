
Python 3.11
```
██████╗ ██╗██╗  ██╗███████╗██╗     ██╗███████╗███████╗██████╗ 
██╔══██╗██║╚██╗██╔╝██╔════╝██║     ██║██╔════╝██╔════╝██╔══██╗
██████╔╝██║ ╚███╔╝ █████╗  ██║     ██║███████╗█████╗  ██████╔╝
██╔═══╝ ██║ ██╔██╗ ██╔══╝  ██║     ██║╚════██║██╔══╝  ██╔══██╗
██║     ██║██╔╝ ██╗███████╗███████╗██║███████║███████╗██║  ██║
╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚══════╝╚══════╝╚═╝  ╚═╝
```

This script will pixelate your pictures keeping the same size of the original one.

# Installation :

You may have to import PIL (not pillow) if case you don't have the library included in your python
So run in your CMD 

python -m pip install PIL

After this you have to set these things ;

  1. Change input path by yours
  2. Change pixel size
  3. Change ouput path, and name the file, choose extension.

# Examples :

It will turns your **RGBA** input ( like .png with **background Transparency**) into **RGB without Alpha / Transparency**

![1](https://user-images.githubusercontent.com/92639080/209363565-0c15b230-92ac-4619-994d-b0b42f80c7ed.jpg)

Also lesser the value of pixel_size is better the quality will approach the original input

**Here an example if pixel_size = 4**
![2](https://user-images.githubusercontent.com/92639080/209364023-fa3e5a07-3cc4-428d-aa62-d3eb34d05bcd.jpg)

**Here an example if pixel_size = 555**

![3](https://user-images.githubusercontent.com/92639080/209364043-36454438-e6ab-49e9-a37f-6decdd4b9231.jpg)
