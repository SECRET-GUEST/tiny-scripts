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
                
#       |                            resize your images without significant           |                                           |               |                                           |               |                                           |                    |                                           |
                
#                        quality loss, potentially freeing up storage on your device    
#                          /                      |    v    |                    \
                
#                https://github.com/SECRET-GUEST/tiny-scripts/tree/ALL/python/Photos/Qrusher |                                |                                          |      |                                |                                          |      |                                |                                          |           |                                |  
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
        

import glob
from PIL import Image
from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout, QPushButton, QFileDialog, QSlider, QProgressBar, QCheckBox, QMessageBox, QLabel, QDialog, QVBoxLayout
from PyQt5.QtCore import Qt, QThread, pyqtSignal




#___  ____ _ _ _ ____ ____    ___  _    ____ _  _ ___
#|__] |  | | | | |___ |__/    |__] |    |__| |\ |  |
#|    |__| |_|_| |___ |  \    |    |___ |  | | \|  |
                
#OPENING | https://www.youtube.com/watch?v=_85LaeTCtV8 :3




class ResizeThread(QThread):
    progress = pyqtSignal(int)

    def __init__(self, files, quality, convert_to_jpg):
        super().__init__()
        # List of files to be resized
        self.files = files
        # Quality setting for the image resizing (1-100)
        self.quality = quality
        # Whether to convert PNG images to JPG
        self.convert_to_jpg = convert_to_jpg

    def run(self):
        for i, file in enumerate(self.files):
            img = Image.open(file)
            # Convert RGBA images to RGB if converting to JPG
            if self.convert_to_jpg and img.mode == "RGBA":
                img = img.convert("RGB")
            # If converting to JPG, change the file extension from .png to .jpg
            if self.convert_to_jpg and file.lower().endswith('.png'):
                file = file[:-4] + '.jpg'  # Slice off the last 4 characters (.png) and append .jpg
            # Save the image with optimization and the specified quality
            img.save(file, optimize=True, quality=self.quality)
            # Emit a progress signal to update the progress bar
            self.progress.emit(int((i+1) / len(self.files) * 100))


class ProgressPopup(QDialog):
    def __init__(self):
        super().__init__()
        self.setWindowTitle('Processing...')
        self.layout = QVBoxLayout()
        self.setLayout(self.layout)
        # Progress bar to show progress during resizing
        self.progress = QProgressBar(self)
        self.layout.addWidget(self.progress)


#___  ____ ____ ____ ____ ____ _  _ 
#|__] |__/ |  | | __ |__/ |__| |\/| 
#|    |  \ |__| |__] |  \ |  | |  | 




class ImageResizer(QWidget):
    def __init__(self):
        super().__init__()
        self.GUI()

    def select_folder(self):
        # Prompt the user to select a folder and update the folder label
        self.folder_path = QFileDialog.getExistingDirectory(self, 'Select a folder:')
        if self.folder_path:
            self.folder_label.setText('Selected folder: ' + self.folder_path)

    def resize_images(self):
        # Disable the resize button to prevent multiple clicks during processing
        self.resize_button.setDisabled(True)

        if self.folder_path:
            # Collect all PNG and JPG files from the selected folder (including subdirectories)
            files = glob.glob(self.folder_path + '/**/*.png', recursive=True)
            files.extend(glob.glob(self.folder_path + '/**/*.jpg', recursive=True))
            # Create and start the resize thread with selected files, quality, and conversion option
            self.resize_thread = ResizeThread(files, self.slider.value(), self.convert_to_jpg.isChecked())
            self.resize_thread.progress.connect(self.progress_popup.progress.setValue)
            self.resize_thread.finished.connect(self.show_finished_dialog)
            self.resize_thread.start()
            self.progress_popup.show()
        else:
            # Show a warning if no folder is selected and re-enable the button
            QMessageBox.warning(self, 'No Folder Selected', 'Please select a folder before resizing.')
            self.resize_button.setDisabled(False)

    def show_finished_dialog(self):
        # Re-enable the resize button when resizing is complete and show a finished dialog
        self.resize_button.setDisabled(False)
        self.progress_popup.hide()
        QMessageBox.information(self, 'Finished', 'All images have been resized.')



#____ ____ ____ ___  _  _ _ ____ ____ _       _  _ ____ ____ ____    _ _  _ ___ ____ ____ ____ ____ ____ ____ 
#| __ |__/ |__| |__] |__| | |    |__| |       |  | [__  |___ |__/    | |\ |  |  |___ |__/ |___ |__| |    |___ 
#|__] |  \ |  | |    |  | | |___ |  | |___    |__| ___] |___ |  \    | | \|  |  |___ |  \ |    |  | |___ |___ 
   

    def GUI(self):
        self.setWindowTitle('Image Resizer')

        # Widget Creation
        self.folder_label = QLabel(self)

        self.select_button = QPushButton('Select Folder', self)
        self.select_button.clicked.connect(self.select_folder)

        self.slider = QSlider(Qt.Horizontal, self)
        self.slider.setMinimum(10)
        self.slider.setMaximum(100)
        self.slider.setValue(80)

        self.convert_to_jpg = QCheckBox('Convert PNG to JPG', self)
        self.convert_to_jpg.setChecked(True)
        self.resize_button = QPushButton('Resize Images', self)
        self.resize_button.clicked.connect(self.resize_images)


        # Layout Configuration
        self.VLayoutResizer = QVBoxLayout()
        self.VLayoutResizer.addWidget(self.folder_label)
        self.VLayoutResizer.addWidget(self.select_button)
        self.VLayoutResizer.addWidget(self.slider)
        self.VLayoutResizer.addWidget(self.convert_to_jpg)
        self.VLayoutResizer.addWidget(self.resize_button)
        self.setLayout(self.VLayoutResizer)

        self.folder_path = None

        self.progress_popup = ProgressPopup()


#____ ____ ____ _  _ ____ ___    _    ____ _  _ _  _ ____ _  _
#|__/ |  | |    |_/  |___  |     |    |__| |  | |\ | |    |__|
#|  \ |__| |___ | \_ |___  |     |___ |  | |__| | \| |___ |  |
                
#ENDING | https://www.youtube.com/watch?v=CgZVrvQZB6U&ab_channel=SECRETGUEST :3

if __name__ == '__main__':
    app = QApplication([])
    resizer = ImageResizer()
    resizer.show()
    app.exec_()
