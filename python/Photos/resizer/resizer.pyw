import sys
import os
from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout, QPushButton, QSpinBox, QFileDialog, QLabel
from PIL import Image

class ImageResizer(QWidget):
    def __init__(self):
        super().__init__()

        self.GUI()

    def GUI(self):
        self.setWindowTitle("Image Resizer")

        layout = QVBoxLayout()

        self.width_spinbox = QSpinBox()
        self.width_spinbox.setRange(1, 10000)
        self.width_spinbox.setValue(800)
        layout.addWidget(QLabel("Width (px) :"))
        layout.addWidget(self.width_spinbox)

        self.height_spinbox = QSpinBox()
        self.height_spinbox.setRange(1, 10000)
        self.height_spinbox.setValue(600)
        layout.addWidget(QLabel("Height (px) :"))
        layout.addWidget(self.height_spinbox)

        select_folder_button = QPushButton("Select input")
        select_folder_button.clicked.connect(self.select_folder)
        layout.addWidget(select_folder_button)

        self.launch_button = QPushButton("GO")
        self.launch_button.clicked.connect(self.resize_images)
        layout.addWidget(self.launch_button)

        self.setLayout(layout)

    def select_folder(self):
        self.folder_path = QFileDialog.getExistingDirectory(self, "Select output")
        print(f"Dossier sélectionné : {self.folder_path}")

    def resize_images(self):
        target_folder = QFileDialog.getExistingDirectory(self, "Select output folder")
        if not self.folder_path or not target_folder:
            return

        for root, _, files in os.walk(self.folder_path):
            for file in files:
                if file.lower().endswith((".png", ".jpg", ".jpeg", ".gif", ".bmp")):
                    img_path = os.path.join(root, file)
                    img = Image.open(img_path)

                    new_width = self.width_spinbox.value()
                    new_height = self.height_spinbox.value()
                    resized_img = img.resize((new_width, new_height), Image.ANTIALIAS)

                    relative_path = os.path.relpath(root, self.folder_path)
                    target_path = os.path.join(target_folder, relative_path)

                    os.makedirs(target_path, exist_ok=True)

                    output_path = os.path.join(target_path, file)
                    resized_img.save(output_path)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    image_resizer = ImageResizer()
    image_resizer.show()
    sys.exit(app.exec_())
