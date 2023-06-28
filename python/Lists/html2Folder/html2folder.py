import os
import shutil
from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout, QPushButton, QFileDialog

class MyApp(QWidget):
    def __init__(self):
        super().__init__()

        self.initUI()

    def initUI(self):
        self.setWindowTitle('HTML Extractor')

        vbox = QVBoxLayout()
        self.setLayout(vbox)

        self.btn_select_folder = QPushButton('Select Folder', self)
        self.btn_select_folder.clicked.connect(self.select_folder)
        vbox.addWidget(self.btn_select_folder)

        self.btn_run = QPushButton('Run Script', self)
        self.btn_run.clicked.connect(self.run_script)
        vbox.addWidget(self.btn_run)

        self.selected_folder = None

    def select_folder(self):
        self.selected_folder = QFileDialog.getExistingDirectory(self, 'Select Folder')

    def run_script(self):
        if self.selected_folder:
            for dirpath, dirnames, filenames in os.walk(self.selected_folder):
                for filename in filenames:
                    if filename.endswith('.html'):
                        src = os.path.join(dirpath, filename)
                        dst = os.path.join(self.selected_folder, filename)
                        shutil.move(src, dst)
                        print(f'Moved {src} to {dst}')
        else:
            print('No folder selected.')

if __name__ == '__main__':
    import sys

    app = QApplication(sys.argv)

    window = MyApp()
    window.show()

    sys.exit(app.exec_())
