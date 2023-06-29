import os
import random
from PyQt5.QtWidgets import QFileDialog, QMessageBox, QApplication, QVBoxLayout, QPushButton, QWidget, QTextEdit, QProgressDialog
from PyQt5.QtCore import Qt

class Randonamers(QWidget):
    def __init__(self):
        super().__init__()
        self.initUI()
    
    def initUI(self):
        self.setWindowTitle('Rename files')
        self.setGeometry(300, 300, 280, 300)
        
        layout = QVBoxLayout()
        self.setLayout(layout)
        
        self.textbox = QTextEdit(self)
        layout.addWidget(self.textbox)
        
        self.open_button = QPushButton('Open file .txt', self)
        self.open_button.clicked.connect(self.open_file)
        layout.addWidget(self.open_button)
        
        self.remove_button = QPushButton('Delete clones', self)
        self.remove_button.clicked.connect(self.remove_duplicates)
        layout.addWidget(self.remove_button)
        
        self.folder_btn = QPushButton('Select folder', self)
        self.folder_btn.clicked.connect(self.select_folder)
        layout.addWidget(self.folder_btn)
        
        self.start_btn = QPushButton('Start', self)
        self.start_btn.clicked.connect(self.rename_files)
        layout.addWidget(self.start_btn)
        
        self.folder_path = ''

    def open_file(self):
        self.file_path, _ = QFileDialog.getOpenFileName(self, 'Open file', filter='*.txt')
        if self.file_path:
            with open(self.file_path, 'r') as file:
                self.textbox.setPlainText(file.read())

    def remove_duplicates(self):
        lines = self.textbox.toPlainText().split("\n")
        unique_lines = list(set(lines))
        self.textbox.setPlainText("\n".join(unique_lines))
        
    def select_folder(self):
        self.folder_path = QFileDialog.getExistingDirectory(self, 'Select folder')
    
    def rename_files(self):
        if not self.folder_path or not self.textbox.toPlainText().strip():
            self.show_error_message('Please select a folder and load a file')
            return

        lines = self.textbox.toPlainText().split("\n")
        lines = [line.strip() for line in lines if line.strip() != ""]
        if len(lines) < len(os.listdir(self.folder_path)):
            self.show_error_message('There are more files than available names.')
            return

        self.show_progress_dialog('Processing...')
    
    def show_error_message(self, message):
        msg = QMessageBox()
        msg.setIcon(QMessageBox.Critical)
        msg.setText("Error")
        msg.setInformativeText(message)
        msg.setWindowTitle("Error")
        msg.setStandardButtons(QMessageBox.Ok)
        msg.exec_()

    def show_progress_dialog(self, message):
        progress = QProgressDialog(self)
        progress.setWindowTitle("Processing...")
        progress.setLabelText(message)
        progress.setCancelButton(None)
        progress.setModal(True)
        progress.setRange(0, len(os.listdir(self.folder_path)))

        lines = self.textbox.toPlainText().split("\n")
        used_names = []
        i = 0
        for filename in os.listdir(self.folder_path):
            file_path = os.path.join(self.folder_path, filename)
            if os.path.isfile(file_path):
                ext = os.path.splitext(filename)[1]
                new_name = random.choice(lines)
                while new_name in used_names:
                    new_name = random.choice(lines)
                used_names.append(new_name)
                os.rename(file_path, os.path.join(self.folder_path, new_name + ext))

                progress.setValue(i)
                QApplication.processEvents()
                i += 1

        progress.setValue(len(os.listdir(self.folder_path)))

        self.show_success_message('All files have been renamed.')

    def show_success_message(self, message):
        msg = QMessageBox()
        msg.setIcon(QMessageBox.Information)
        msg.setText("Success")
        msg.setInformativeText(message)
        msg.setWindowTitle("Success")
        msg.setStandardButtons(QMessageBox.Ok)
        msg.exec_()

def main():
    app = QApplication([])
    ex = Randonamers()
    ex.show()
    app.exec_()

if __name__ == '__main__':
    main()
