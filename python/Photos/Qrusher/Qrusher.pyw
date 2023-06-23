import glob
import os
from PIL import Image
from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout, QPushButton, QFileDialog, QSlider, QProgressBar, QCheckBox, QMessageBox, QLabel, QDialog, QVBoxLayout
from PyQt5.QtCore import Qt, QThread, pyqtSignal

class ResizeThread(QThread):
    progress = pyqtSignal(int)

    def __init__(self, files, quality, convert_to_jpg):
        super().__init__()
        self.files = files
        self.quality = quality
        self.convert_to_jpg = convert_to_jpg

    def run(self):
        for i, file in enumerate(self.files):
            img = Image.open(file)
            if self.convert_to_jpg and img.mode == "RGBA":
                img = img.convert("RGB")
            if self.convert_to_jpg and file.lower().endswith('.png'):
                file = file[:-4] + '.jpg'
            img.save(file, optimize=True, quality=self.quality)
            self.progress.emit(int((i+1) / len(self.files) * 100))

class ProgressPopup(QDialog):
    def __init__(self):
        super().__init__()
        self.setWindowTitle('Processing...')
        self.layout = QVBoxLayout()
        self.setLayout(self.layout)
        self.progress = QProgressBar(self)
        self.layout.addWidget(self.progress)

class ImageResizer(QWidget):
    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        self.setWindowTitle('Image Resizer')

        self.layout = QVBoxLayout()
        self.setLayout(self.layout)

        self.folder_label = QLabel(self)
        self.layout.addWidget(self.folder_label)

        self.select_button = QPushButton('Select Folder', self)
        self.select_button.clicked.connect(self.select_folder)
        self.layout.addWidget(self.select_button)

        self.slider = QSlider(Qt.Horizontal, self)
        self.slider.setMinimum(10)
        self.slider.setMaximum(100)
        self.slider.setValue(80)
        self.layout.addWidget(self.slider)

        self.convert_to_jpg = QCheckBox('Convert PNG to JPG', self)
        self.convert_to_jpg.setChecked(True)
        self.layout.addWidget(self.convert_to_jpg)

        self.resize_button = QPushButton('Resize Images', self)
        self.resize_button.clicked.connect(self.resize_images)
        self.layout.addWidget(self.resize_button)

        self.folder_path = None

        self.progress_popup = ProgressPopup()

    def select_folder(self):
        self.folder_path = QFileDialog.getExistingDirectory(self, 'Select a folder:')
        if self.folder_path:
            self.folder_label.setText('Selected folder: ' + self.folder_path)

    def resize_images(self):
        if self.folder_path:
            files = glob.glob(self.folder_path + '/**/*.png', recursive=True)
            files.extend(glob.glob(self.folder_path + '/**/*.jpg', recursive=True))
            self.resize_thread = ResizeThread(files, self.slider.value(), self.convert_to_jpg.isChecked())
            self.resize_thread.progress.connect(self.progress_popup.progress.setValue)
            self.resize_thread.finished.connect(self.show_finished_dialog)
            self.resize_thread.start()
            self.progress_popup.show()
        else:
            QMessageBox.warning(self, 'No Folder Selected', 'Please select a folder before resizing.')

    def show_finished_dialog(self):
        self.progress_popup.hide()
        QMessageBox.information(self, 'Finished', 'All images have been resized.')

if __name__ == '__main__':
    app = QApplication([])
    resizer = ImageResizer()
    resizer.show()
    app.exec_()
