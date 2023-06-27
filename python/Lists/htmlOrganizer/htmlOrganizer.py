import os
import shutil
import json
from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout, QPushButton, QFileDialog
from PyQt5.QtCore import Qt

class MyApp(QWidget):
    def __init__(self):
        super().__init__()

        self.initUI()

    def initUI(self):
        self.setWindowTitle('HTML File Organizer')
        self.setGeometry(300, 300, 300, 200)

        vbox = QVBoxLayout()
        self.setLayout(vbox)

        self.btn1 = QPushButton('Open Directory', self)
        self.btn1.clicked.connect(self.openDialog)
        vbox.addWidget(self.btn1)

        self.btn2 = QPushButton('Organize HTML Files', self)
        self.btn2.clicked.connect(self.organizeFiles)
        vbox.addWidget(self.btn2)

    def openDialog(self):
        self.folder_path = QFileDialog.getExistingDirectory(self, 'Open Directory')

    def organizeFiles(self):
        for filename in os.listdir(self.folder_path):
            if filename.endswith(".html"):
                new_folder_name = os.path.splitext(filename)[0]
                new_folder_path = os.path.join(self.folder_path, new_folder_name)

                if not os.path.exists(new_folder_path):
                    os.mkdir(new_folder_path)
                
                json_file_path = os.path.join(new_folder_path, new_folder_name + '.json')
                with open(json_file_path, 'w') as json_file:
                    json.dump({}, json_file)

                # Moving the HTML file to the new directory
                shutil.move(os.path.join(self.folder_path, filename), new_folder_path)

if __name__ == "__main__":
    app = QApplication([])
    ex = MyApp()
    ex.show()
    app.exec_()
