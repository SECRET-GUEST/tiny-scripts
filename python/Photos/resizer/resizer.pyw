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
                
#       |                            This tool provides an intuitive GUI to 

#                           resize individual or bulk images, allowing users to            |                                           |               |                                           |               |                                           |                    |                                           |
                
#                     select single files, entire folders, or folders with subfolders.
#                          /                      |    v    |                    \
                
#                https://github.com/SECRET-GUEST/tiny-scripts/tree/ALL/python/Photos/resizer |                                |                                          |      |                                |                                          |      |                                |                                          |           |                                |  
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
        

import os,sys
from PIL import Image
from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout, QPushButton, QSpinBox, QFileDialog, QLabel, QComboBox, QMessageBox



#___  ____ _ _ _ ____ ____    ___  _    ____ _  _ ___
#|__] |  | | | | |___ |__/    |__] |    |__| |\ |  |
#|    |__| |_|_| |___ |  \    |    |___ |  | | \|  |
                
#OPENING | https://www.youtube.com/watch?v=_85LaeTCtV8 :3


class ImageProcessor:
    def __init__(self, folder_path, input_type, width, height):
        # Initialize properties
        self.folder_path = folder_path
        self.input_type = input_type
        self.width = width
        self.height = height

    def resize_image(self, img_path, target_folder):
        # Open the image
        img = Image.open(img_path)
        # Resize the image
        resized_img = img.resize((self.width, self.height), Image.LANCZOS)

        # Determine target path
        if self.input_type == "Single File":
            target_path = target_folder
        else:
            relative_path = os.path.relpath(os.path.dirname(img_path), self.folder_path)
            target_path = os.path.join(target_folder, relative_path)

        # Create target directory if doesn't exist
        os.makedirs(target_path, exist_ok=True)

        # Create the full path for the output file
        output_path = os.path.join(target_path, os.path.basename(img_path))
        # Save the resized image
        resized_img.save(output_path)

    def process_images(self, target_folder, include_subfolders=False):
        # Process based on input type
        if self.input_type == "Single File":
            self.resize_image(self.folder_path, target_folder)
        elif self.input_type in ("Folder", "Folder and Subfolders"):
            self.resize_folder(self.folder_path, target_folder, include_subfolders=include_subfolders)

    def resize_folder(self, folder_path, target_folder, include_subfolders):
        # Walk through directory and resize each image
        for root, _, files in os.walk(folder_path):
            for file in files:
                if file.lower().endswith((".png", ".jpg", ".jpeg", ".gif", ".bmp")):
                    img_path = os.path.join(root, file)
                    self.resize_image(img_path, target_folder)

            # Break loop if not including subfolders
            if not include_subfolders:
                break




#___  ____ ____ ____ ____ ____ _  _ 
#|__] |__/ |  | | __ |__/ |__| |\/| 
#|    |  \ |__| |__] |  \ |  | |  | 


class ImageResizer(QWidget):
    def __init__(self):
        super().__init__()
        self.folder_path = None
        self.input_type = None
        self.GUI()

    def select_input(self):
        # Select input based on type (file or folder)
        self.input_type = self.selection_combo.currentText()
        if self.input_type == "Single File":
            self.folder_path, _ = QFileDialog.getOpenFileName(self, "Select File")
        else:
            self.folder_path = QFileDialog.getExistingDirectory(self, "Select Folder")

    def resize_images(self):
        # Determine if to include subfolders
        include_subfolders = self.input_type == "Folder and Subfolders"
        target_folder = QFileDialog.getExistingDirectory(self, "Select output folder")
        if not self.folder_path or not target_folder:
            return

        # Disable button during processing
        self.launch_button.setEnabled(False)
        try:
            # Create and run the processor
            image_processor = ImageProcessor(self.folder_path, self.input_type, self.width_spinbox.value(), self.height_spinbox.value())
            image_processor.process_images(target_folder, include_subfolders)
            self.show_success_message("Images resized successfully!")
        except Exception as e:
            # Show error message if exception occurs
            self.show_error_message(str(e))
        finally:
            # Enable button after processing
            self.launch_button.setEnabled(True)

    def show_error_message(self, message):
        # Show error message dialog
        msg = QMessageBox()
        msg.setIcon(QMessageBox.Critical)
        msg.setText("Error")
        msg.setInformativeText(message)
        msg.setWindowTitle("Error")
        msg.setStandardButtons(QMessageBox.Ok)
        msg.exec_()

    def show_success_message(self, message):
        # Show success message dialog
        msg = QMessageBox()
        msg.setIcon(QMessageBox.Information)
        msg.setText("Success")
        msg.setInformativeText(message)
        msg.setWindowTitle("Success")
        msg.setStandardButtons(QMessageBox.Ok)
        msg.exec_()



#____ ____ ____ ___  _  _ _ ____ ____ _       _  _ ____ ____ ____    _ _  _ ___ ____ ____ ____ ____ ____ ____ 
#| __ |__/ |__| |__] |__| | |    |__| |       |  | [__  |___ |__/    | |\ |  |  |___ |__/ |___ |__| |    |___ 
#|__] |  \ |  | |    |  | | |___ |  | |___    |__| ___] |___ |  \    | | \|  |  |___ |  \ |    |  | |___ |___ 
   

    def GUI(self):
        # Set window title
        self.setWindowTitle("Image Resizer")
    
        # Widgets
        width_label = QLabel("Width (px) :")
        self.width_spinbox = QSpinBox()
        self.width_spinbox.setRange(1, 10000)
        self.width_spinbox.setValue(800)
    
        height_label = QLabel("Height (px) :")
        self.height_spinbox = QSpinBox()
        self.height_spinbox.setRange(1, 10000)
        self.height_spinbox.setValue(600)

        self.selection_combo = QComboBox()
        self.selection_combo.addItems(["Single File", "Folder", "Folder and Subfolders"])
    
        select_input_button = QPushButton("Select input")
        select_input_button.clicked.connect(self.select_input)
    
        self.launch_button = QPushButton("GO")
        self.launch_button.clicked.connect(self.resize_images)
    
        # Layout
        self.resLay = QVBoxLayout()
        self.resLay.addWidget(width_label)
        self.resLay.addWidget(self.width_spinbox)
        self.resLay.addWidget(height_label)
        self.resLay.addWidget(self.height_spinbox)
        self.resLay.addWidget(self.selection_combo)
        self.resLay.addWidget(select_input_button)
        self.resLay.addWidget(self.launch_button)
        self.setLayout(self.resLay)


#____ ____ ____ _  _ ____ ___    _    ____ _  _ _  _ ____ _  _
#|__/ |  | |    |_/  |___  |     |    |__| |  | |\ | |    |__|
#|  \ |__| |___ | \_ |___  |     |___ |  | |__| | \| |___ |  |
                
#ENDING | https://www.youtube.com/watch?v=CgZVrvQZB6U&ab_channel=SECRETGUEST :3


if __name__ == "__main__":
    app = QApplication(sys.argv)
    image_resizer = ImageResizer()
    image_resizer.show()
    sys.exit(app.exec_())
