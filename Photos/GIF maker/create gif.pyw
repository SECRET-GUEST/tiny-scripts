#You have to download python first
#and maybe download PIL by running this in your CMD :


#     py -m pip install PIL

#Then just paste your images you want to turns into a gif
#in the directory you want, put this script in the directory
#Do left clic on the script then "open with", "python"

#The gif will be created in the same directory

#----/!\-----/!\-----/!\-----/!\-----/!\-----/!\----#
#                                                   #
#    DO NOT FORGET to change directories paths      #
#       at begining and end of this script          #
#                                                   #
#---------------------------------------------------#


import os
from PIL import Image


#Keep the r before and replace the directory by yours
pics_path = r"C:\Users\..."

# Take all PNG or JPEG in the directory
pics = [os.path.join(pics_path, filename) for filename in os.listdir(pics_path)
        if os.path.splitext(filename)[1].lower() in ('.png', '.jpg', '.jpeg')]

#Open all the image files and store the resulting Image objects in a list
images = [Image.open(path) for path in pics]

# Convert RGB to RGBA who supports transparency
alpha = [image.convert('RGBA') for image in images]

#Turns all into format pixel 'P'
converted = [image.convert('P', palette=Image.Palette.ADAPTIVE)
             for image in alpha]

#Now the output will be saved
converted[0].save(



#Now change the directory path by yours
#Then end with the name.gif you want for the output

    r"C:\Users\...\test.gif", 

    format='GIF',
    append_images=converted[1:],
    save_all=True,
    duration=10000,  # set duration of each frames in ms
    loop=500,  # 0 = infinite loop
    transparency=50  # 0 = transparency
)



# debugger
# It will print in the CMD 3 variables to find the problem with your files

#print(pics_path, "\n"*2, pics, "\n"*2, converted)
