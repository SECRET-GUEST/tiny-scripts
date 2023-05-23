# You may have to import PIL (not pillow) if case 
# you don't have the library included in your python

# python -m pip install PIL

#This script is a simple PIXELISER to make it works you have ;
#  1. Change input path by yours
#  1. Change pixel size
#  1. Change ouput path by yours

from PIL import Image

# This is your INPUT image, change it for yours
image = Image.open(r'C:\YOUR_PATH\YOUR_FILE.png')

#Turn image to RGB mode
rgb = image.convert('RGB')

# Create a same sized canvas for the output
canvas = Image.new('RGB', image.size)

#Here change the pixels size ; 0 = original to 512+ = Piet Mondrian tiers
pixel_size = 16 

# Pixels size can't outclass the canvas
pixel_size = min(pixel_size, image.size[0])
pixel_size = min(pixel_size, image.size[1])

#Iterate over pixels blocks of the original image
for i in range(0, image.size[0], pixel_size):
    for j in range(0, image.size[1], pixel_size):
        if i < image.size[0] and j < image.size[1]:

# Get pixels color (at top-left corner)
            pixel = rgb.getpixel((i, j))

#Fill with same color
            for k in range(i, i + pixel_size):
                for l in range(j, j + pixel_size):
                    if k < canvas.size[0] and l < canvas.size[1]:
                        canvas.putpixel((k, l), pixel)


# Then save the Outbut => Replace the path by yours
canvas.save(r'C:\YOUR_PATH\YOUR_OUTPUT.png')
