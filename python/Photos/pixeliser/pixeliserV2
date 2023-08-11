#     |               |                                 |
                
#                 |                                                |            |                                   |                               |                           |                               |                           |                               |                                |                               |
#          |                                  |                                     |
                
#                 |                     |                                                     |                                   |                               |     |                                   |                               |     |                                   |                               |          |                                   |                               |
#  |                          |                       |                    |
#          |                                    |                                         |     |                    |                                    | |     |                    |                                    | |     |                    |                                    |      |     |                                                        |
#     |                        |                                 |      |                                |                       |                    |                |                       |                    |                |                       |                    |                     |                       |                    |
                
#                     |                                                |      |                                   |                               |                         |                               |                         |                               |                              |                               |
#          |                                   |                               |                   |                                |                       |                    |          |                                |                       |                    |          |                                |                       |                    |               |                                |                                        |
                
#                 |                     |
#  |                                |                       |                    |            |                                |                       |                    |     |                                |                       |                    |     |                                |                       |                              |                                |
#          |                               |                                         |                              |                       |                    |                           |                       |                    |                           |                       |                    |                                |                       |                    |
                
#  |         |                                   PRESENTATION                                                |                                |                    |   |                                |                    |   |                                |                    |        |                                |                    |
#                                                                                                                              |                               |     |                                   |                               |     |                                   |                               |          |                                   |                               |
#               |                             /                 \                          |                                                                              |                               |     |                                   |                               |     |                                   |                               |          |                                   |                               |
                
#       |                          allows users to apply a pixelation effect               |                                           |               |                                           |               |                                           |                    |                                           |
                
#                        to images, either in a selected folder or to a single image.  
#                          /                      |    v    |                    \
                
#                https://github.com/SECRET-GUEST/tiny-scripts/blob/ALL/python/Photos/pixeliser |                                |                                          |      |                                |                                          |      |                                |                                          |           |                                |  
#     |                  !      |                                   |     |                                |                       |                    |                |                       |                    |                |                       |                    |                    |                                           |
#                               |                                   |     |                  
#                  |            |                   Anyway          !                        |                                         |                                |                       |                    |                |                       |                    |                |                       |                    |                    |
                
#             |                      |                 have                                                 |                        |                                         |                                |                       |                    |                |                       |                    |                |                       |                    |                     |                                           |
                

#                |                                  FUN         |                        |                                         |                                |                       |                    |                |                       |                    |                |                       |                    |                    |                                                                      |
                
#                                                        =)
                
#
#                               |                      or                                       |                                                            |                    |                |                       |                    |                |                       |                    |                    |                                           |
                

#             |                              |       DIE ! ! !        |                       |                            |                |                       |                    |                |                       |                    |                    |                                           |#     |                        |                                         |                                |
                
#
#                                                    !                                       |                                |                    |  |                                |                    |  |                                |                    |       |                                |                    |
                
#     |               |                                 !
                
#                 |                                                |            |                                   |                               |                           |                               |                           |                               |                                |                               |
#          |                                  !                                     |
                
#                 |                     |                                                     |                                   |                               |     |                                   |                               |     |                                   |                               |          |                                   |                               |
#  |                          |                       |                    !
#          |                                    |                                         |     |                    |                                    | |     |                    |                                    | |     |                    |                                    |      |     |                    |                                    |
#     |                        |                                 |      |                                |                       |                    |                |                       |                    |                |                       |                    |                    |                                           |
                
#                     |                                                |      |                                   |                               |                         |                               |                         |                               |                              |                               |
#          |                                   |                               |                   |                                |                       |                    |          |                                |                       |                    |          |                                |                       |                    |               |                                                                |
              
#_ _  _ ____ ___ ____ _    _    ____ ___ _ ____ _  _
#| |\ | [__   |  |__| |    |    |__|  |  | |  | |\ |
#| | \| ___]  |  |  | |___ |___ |  |  |  | |__| | \|
        


import os, sys
from PyQt5.QtWidgets import QWidget, QVBoxLayout, QPushButton, QFileDialog, QSpinBox, QLabel, QMessageBox, QComboBox, QApplication
from PIL import Image


#___  ____ _ _ _ ____ ____    ___  _    ____ _  _ ___
#|__] |  | | | | |___ |__/    |__] |    |__| |\ |  |
#|    |__| |_|_| |___ |  \    |    |___ |  | | \|  |
                
#OPENING | https://www.youtube.com/watch?v=_85LaeTCtV8 :3

class pixelize(QWidget):
    def __init__(self):
        super().__init__()

        self.input_folder = None
        self.output_folder = None

        self.GUI()



    def select_input(self):
        if self.mode_combo.currentText() == "Folder":
            self.input_folder = QFileDialog.getExistingDirectory(self, 'Select Input Folder')
        else:
            self.input_folder, _ = QFileDialog.getOpenFileName(self, 'Select Input Image')



    def select_output_folder(self):
        self.output_folder = QFileDialog.getExistingDirectory(self, 'Select Output Folder')




    def launch_pixelizer(self):

        # Process the selected input based on mode and apply pixelization. 
        # Disable the launch button during processing and enable it again after completion.
        # Handle special cases and warnings, like ensuring the output directory is not inside the input directory.
    
        self.launch_button.setEnabled(False)
        self.output_folder = QFileDialog.getExistingDirectory(self, 'Select Output Folder') 

        if self.input_folder is None or self.output_folder is None:
            QMessageBox.warning(self, 'Warning', 'Both input and output must be selected')
            self.launch_button.setEnabled(True)
            return
        if self.mode_combo.currentText() == "Folder" and os.path.commonpath([self.input_folder, self.output_folder]) == self.input_folder:
            QMessageBox.warning(self, 'Warning', 'Output folder must not be inside the input folder')
            self.launch_button.setEnabled(True)
            return  

        pixel_size = self.pixel_size_spinbox.value()
        if self.mode_combo.currentText() == "Folder":
            self.pixelize_images(self.input_folder, self.output_folder, pixel_size)
        else:
            output_path = os.path.join(self.output_folder, os.path.basename(self.input_folder))
            self.pixelize_image(self.input_folder, output_path, pixel_size) 

        self.launch_button.setEnabled(True) 


    @staticmethod
    def pixelize_images(input_folder, output_folder, pixel_size):
        
        # Process all the images within the input folder and apply pixelization to them.
        # This method iterates through all files in the directory and calls pixelize_image method for each valid image file.

        for root, _, files in os.walk(input_folder):
            for file in files:
                if file.lower().endswith(('.png', '.jpg', '.jpeg')):
                    input_path = os.path.join(root, file)
                    output_path = os.path.join(output_folder, file)
                    pixelize.pixelize_image(input_path, output_path, pixel_size)



    @staticmethod
    def pixelize_image(input_path, output_path, pixel_size):

        # Apply pixelization effect to a single image.
        # The pixel size parameter determines the granularity of the pixelization.
        # Reads the input image, applies the pixelization algorithm and saves the resulting image to the output path.

        image = Image.open(input_path)
        rgb = image.convert('RGB')
        canvas = Image.new('RGB', image.size)

        pixel_size = min(pixel_size, image.size[0], image.size[1])

        for i in range(0, image.size[0], pixel_size):
            for j in range(0, image.size[1], pixel_size):
                if i < image.size[0] and j < image.size[1]:
                    pixel = rgb.getpixel((i, j))
                    for k in range(i, min(i + pixel_size, canvas.size[0])):
                        for l in range(j, min(j + pixel_size, canvas.size[1])):
                            canvas.putpixel((k, l), pixel)

        canvas.save(output_path)




#____ ____ ____ ___  _  _ _ ____ ____ _       _  _ ____ ____ ____    _ _  _ ___ ____ ____ ____ ____ ____ ____ 
#| __ |__/ |__| |__] |__| | |    |__| |       |  | [__  |___ |__/    | |\ |  |  |___ |__/ |___ |__| |    |___ 
#|__] |  \ |  | |    |  | | |___ |  | |___    |__| ___] |___ |  \    | | \|  |  |___ |  \ |    |  | |___ |___ 
   

    def GUI(self):

        #Widgets
        self.mode_combo = QComboBox()
        self.mode_combo.addItems(["Folder", "Single Image"])
        
        self.input_button = QPushButton('Select Input')
        self.input_button.clicked.connect(self.select_input)

        self.pixel_size_spinbox = QSpinBox()
        self.pixel_size_spinbox.setRange(1, 512)
        self.pixel_size_spinbox.setValue(12)

        self.launch_button = QPushButton('Launch pixelizer')
        self.launch_button.clicked.connect(self.launch_pixelizer)


        #Layout
        self.VLayPixel = QVBoxLayout()

        self.VLayPixel.addWidget(self.mode_combo)
        self.VLayPixel.addWidget(self.input_button)
        self.VLayPixel.addWidget(QLabel("Pixel Size"))
        self.VLayPixel.addWidget(self.pixel_size_spinbox)
        self.VLayPixel.addWidget(self.launch_button)

        self.setLayout(self.VLayPixel)



#____ ____ ____ _  _ ____ ___    _    ____ _  _ _  _ ____ _  _
#|__/ |  | |    |_/  |___  |     |    |__| |  | |\ | |    |__|
#|  \ |__| |___ | \_ |___  |     |___ |  | |__| | \| |___ |  |
                
#ENDING | https://www.youtube.com/watch?v=CgZVrvQZB6U&ab_channel=SECRETGUEST :3

if __name__ == '__main__':
    app = QApplication(sys.argv)
    main_window = pixelize()
    main_window.show()
    sys.exit(app.exec_())
