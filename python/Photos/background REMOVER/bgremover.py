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
                
#       |                               Remove the background from images 

#                                  within a folder, allowing options for color  

#                              replacement, random coloring, or no background. You 
                        
#             |          can choose to process a single folder or include all subfolders.                         |               |                                           |               |                                           |                    |                                           |
#                          /                      |    v    |                    \
                
#          https://github.com/SECRET-GUEST/tiny-scripts/tree/ALL/python/Photos/background%20REMOVER |                                |                                          |      |                                |                                          |      |                                |                                          |           |                                |  
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
        


import os
from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout, QHBoxLayout, QPushButton, QCheckBox, QColorDialog, QLabel, QFileDialog, QProgressBar, QMessageBox
from PyQt5.QtGui import QColor
from PyQt5.QtCore import Qt, QThread, pyqtSignal
from rembg import remove
from PIL import Image
from io import BytesIO
import numpy as np



#___  ____ _ _ _ ____ ____    ___  _    ____ _  _ ___
#|__] |  | | | | |___ |__/    |__] |    |__| |\ |  |
#|    |__| |_|_| |___ |  \    |    |___ |  | | \|  |
                
#OPENING | https://www.youtube.com/watch?v=_85LaeTCtV8 :3

# Processing class
class RemoveBgThread(QThread):
    progress = pyqtSignal(int)
    finished = pyqtSignal(str)

    def __init__(self, input_folder, output_folder, color, include_subfolders, random_color):
        super().__init__()
        self.input_folder = input_folder
        self.output_folder = output_folder
        self.color = color
        self.include_subfolders = include_subfolders
        self.random_color = random_color


    def get_images(self, folder, include_subfolders):
        if include_subfolders:
            for dirpath, _, filenames in os.walk(folder):
                for filename in filenames:
                    if filename.endswith('.png') or filename.endswith('.jpg'):
                        yield os.path.join(dirpath, filename)
        else:
            for filename in os.listdir(folder):
                if filename.endswith('.png') or filename.endswith('.jpg'):
                    yield os.path.join(folder, filename)

    def run(self):
        filepaths = list(self.get_images(self.input_folder, self.include_subfolders))

        for i, filepath in enumerate(filepaths):
            with open(filepath, 'rb') as img_file:
                img_bytes = img_file.read()
                output_img_bytes = remove(img_bytes)

                if self.color is not None or self.random_color:
                    output_img = Image.open(BytesIO(output_img_bytes))
                    if self.random_color:
                        # Generate a random color
                        color_tuple = (np.random.randint(256), np.random.randint(256), np.random.randint(256), 255)
                    else:
                        # Convert QColor to a tuple (R, G, B, A)
                        color_tuple = (self.color.red(), self.color.green(), self.color.blue(), self.color.alpha())
                    colored_img = Image.new('RGBA', output_img.size, color_tuple)
                    colored_img.paste(output_img, (0, 0), output_img)
                    output_img_bytes_io = BytesIO()
                    colored_img.save(output_img_bytes_io, format='PNG')
                    output_img_bytes = output_img_bytes_io.getvalue()

                output_filepath = os.path.join(self.output_folder, os.path.relpath(filepath, self.input_folder))
                os.makedirs(os.path.dirname(output_filepath), exist_ok=True)
                with open(output_filepath, 'wb') as output_img_file:
                    output_img_file.write(output_img_bytes)

            self.progress.emit((i + 1) * 100 // len(filepaths))

        self.finished.emit('Finished processing images.')





#___  ____ ____ ____ ____ ____ _  _ 
#|__] |__/ |  | | __ |__/ |__| |\/| 
#|    |  \ |__| |__] |  \ |  | |  | 


class remBackBatch(QWidget):
    def __init__(self):
        super().__init__()
        self.GUI()

    def open_folder(self):
        self.folder_path = QFileDialog.getExistingDirectory(self, 'Select Folder')
        if self.folder_path:
            self.include_subfolders_checkbox.setHidden(False)
            self.check_box.setHidden(False)
            self.output_folder_button.setHidden(False)

    def state_changed(self, state):
        if state == Qt.Checked:
            self.color_label.setHidden(True)
            self.color_square.setHidden(True)
            self.random_color_checkbox.setHidden(True)  # Show the random color checkbox when 'No background' is checked
        else:
            self.color_label.setHidden(False)
            self.color_square.setHidden(False)
            self.random_color_checkbox.setHidden(False)  # Hide the random color checkbox when 'No background' is unchecked
            self.color = QColor('white')
            self.color_square.setStyleSheet(f'background-color: {self.color.name()}')   


    def color_square_clicked(self, event):
        self.color = QColorDialog.getColor()
        if self.color.isValid():
            self.color_square.setStyleSheet(f'background-color: {self.color.name()}')


    def select_output_folder(self):
        self.output_folder = QFileDialog.getExistingDirectory(self, 'Select Output Folder')
        if self.output_folder.startswith(self.folder_path):
            QMessageBox.warning(self, "Invalid Output Folder", "Please choose an output folder that is not a subfolder of the input folder to avoid errors.")
        else:
            self.launch_button.setHidden(False)


    def launch(self):
        color = self.color if not self.check_box.isChecked() and not self.random_color_checkbox.isChecked() else None
        random_color = self.random_color_checkbox.isChecked()
        include_subfolders = self.include_subfolders_checkbox.isChecked()

        self.progress_bar.setHidden(False)
        self.launch_button.setDisabled(True)

        self.thread = RemoveBgThread(self.folder_path, self.output_folder, color, include_subfolders, self.random_color_checkbox.isChecked())

        self.thread.progress.connect(self.progress_bar.setValue)
        self.thread.finished.connect(self.finished)
        self.thread.start()


    def finished(self, message):
        self.launch_button.setDisabled(False)
        self.progress_bar.setHidden(True)
        QMessageBox.information(self, "Finished", message)



    def random_color_state_changed(self, state):
        if state == Qt.Checked:
            self.color_label.setHidden(True)
            self.color_square.setHidden(True)
        else:
            self.color_label.setHidden(False)
            self.color_square.setHidden(False)
            self.color = self.generate_pastel_color()
            self.color_square.setStyleSheet(f'background-color: {self.color.name()}')



    def generate_pastel_color(self):

        r, g, b = np.random.choice(range(256), size=3)  # Generate random RGB values
        r += 127  # Adding 127 to make the colors pastel (lighter)
        g += 127
        b += 127
        r, g, b = [min(c, 255) for c in (r, g, b)]  # Making sure the color values are not more than 255
        return QColor(r, g, b)





#____ ____ ____ ___  _  _ _ ____ ____ _       _  _ ____ ____ ____    _ _  _ ___ ____ ____ ____ ____ ____ ____ 
#| __ |__/ |__| |__] |__| | |    |__| |       |  | [__  |___ |__/    | |\ |  |  |___ |__/ |___ |__| |    |___ 
#|__] |  \ |  | |    |  | | |___ |  | |___    |__| ___] |___ |  \    | | \|  |  |___ |  \ |    |  | |___ |___ 
   



    def GUI(self):
        # Input Folder Button
        self.folder_button = QPushButton('Open Folder', self)
        self.folder_button.clicked.connect(self.open_folder)

        # Include Subfolders Checkbox
        self.include_subfolders_checkbox = QCheckBox('Include Subfolders', self)
        self.include_subfolders_checkbox.setHidden(True)

        # No Background Checkbox
        self.check_box = QCheckBox('No background', self)
        self.check_box.setHidden(True)
        self.check_box.stateChanged.connect(self.state_changed)

        # Color label and color square
        self.color_label = QLabel('Color:', self)
        self.color_label.setHidden(True)
        self.color_square = QLabel(self)
        self.color_square.setHidden(True)
        self.color_square.setFixedSize(20, 20)
        self.color_square.mousePressEvent = self.color_square_clicked

        # Random color checkbox
        self.random_color_checkbox = QCheckBox('Random color', self)
        self.random_color_checkbox.setHidden(True)
        self.random_color_checkbox.stateChanged.connect(self.random_color_state_changed)


        # Output Folder Button
        self.output_folder_button = QPushButton('Select Output Folder', self)
        self.output_folder_button.clicked.connect(self.select_output_folder)
        self.output_folder_button.setHidden(True)

        # Launch Button
        self.launch_button = QPushButton('Launch', self)
        self.launch_button.clicked.connect(self.launch)
        self.launch_button.setHidden(True)

        # Progress Bar
        self.progress_bar = QProgressBar(self)
        self.progress_bar.setHidden(True)

        self.check_box.setChecked(True)

        # Layouts
        self.main_layout = QVBoxLayout(self)
        self.main_layout.addWidget(self.folder_button)
        self.main_layout.addWidget(self.include_subfolders_checkbox)


        self.main_layout.addWidget(self.check_box)

        self.no_background_layout = QHBoxLayout()
        self.no_background_layout.addWidget(self.color_label)
        self.no_background_layout.addWidget(self.color_square)

        self.main_layout.addWidget(self.random_color_checkbox)

        self.main_layout.addLayout(self.no_background_layout)

        self.main_layout.addWidget(self.output_folder_button)
        self.main_layout.addWidget(self.launch_button)
        self.main_layout.addWidget(self.progress_bar)

        self.setLayout(self.main_layout)


#____ ____ ____ _  _ ____ ___    _    ____ _  _ _  _ ____ _  _
#|__/ |  | |    |_/  |___  |     |    |__| |  | |\ | |    |__|
#|  \ |__| |___ | \_ |___  |     |___ |  | |__| | \| |___ |  |
                
#ENDING | https://www.youtube.com/watch?v=CgZVrvQZB6U&ab_channel=SECRETGUEST :3

if __name__ == '__main__':
    app = QApplication([])
    ex = remBackBatch()  
    ex.show()
    app.exec_()
