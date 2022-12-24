# First install remove background by run this in your CMD
# pip install rembg

from rembg import remove
from PIL import Image


#You have to change path by yours, then also change 
# the input name and extension if needs.

input_path = r'YOUR_PATH/YOUR_INPUT.jpeg'
output_path = r'YOUR_PATH/output.png'

input = Image.open(input_path)
output = remove(input)

output.save(output_path)