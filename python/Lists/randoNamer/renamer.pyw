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
                
#       |                          Drag, drop, edit, and randomly rename files          |                                           |               |                                           |               |                                           |                    |                                           |
                
#                          a tool designed to make file organization fun and unique   
#                          /                      |    v    |                    \
                
#                https://github.com/SECRET-GUEST/tiny-scripts/tree/ALL/python/Lists/randoNamer  |                                |                                          |      |                                |                                          |      |                                |                                          |           |                                |  
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
import random
from PyQt5.QtWidgets import QFileDialog, QMessageBox, QApplication, QVBoxLayout, QPushButton, QWidget, QTextEdit, QProgressDialog


#___  ____ _ _ _ ____ ____    ___  _    ____ _  _ ___
#|__] |  | | | | |___ |__/    |__] |    |__| |\ |  |
#|    |__| |_|_| |___ |  \    |    |___ |  | | \|  |
                
#OPENING | https://www.youtube.com/watch?v=_85LaeTCtV8 :3


class Randonamers(QWidget):
    def __init__(self):
        super().__init__()
        self.folder_path = None
        self.GUI()



    def open_file(self):
        # Opens a file dialog to select a .txt file and reads its contents into the textbox
        try:
            self.file_path, _ = QFileDialog.getOpenFileName(self, 'Open file', filter='*.txt')
            if self.file_path:
                with open(self.file_path, 'r', encoding='utf-8') as file:
                    self.textbox.setPlainText(file.read())
        except Exception as e:
            self.show_error_message(str(e))



    def dragEnterEvent(self, event):
        # Allows dragging and dropping of URLs into the widget
        if event.mimeData().hasUrls():
            event.accept()
        else:
            event.ignore()



    def dropEvent(self, event):
        # Handles drop event for .txt files, reads their contents into the textbox
        try:
            urls = event.mimeData().urls()
            for url in urls:
                file_path = url.toLocalFile()
                if file_path.endswith('.txt'):
                    with open(file_path, 'r', encoding='utf-8') as file:
                        self.textbox.setPlainText(file.read())
        except Exception as e:
            self.show_error_message(str(e))



    def remove_duplicates(self):
        # Removes duplicate lines from the textbox
        lines = self.textbox.toPlainText().split("\n")
        unique_lines = list(set(lines))
        self.textbox.setPlainText("\n".join(unique_lines))



    def select_folder(self):
        # Opens a folder dialog to select a directory
        self.folder_path = QFileDialog.getExistingDirectory(self, 'Select folder')



    def rename_files(self):
        # Renames files in the selected folder using lines from the textbox as new names
        try:
            if not self.folder_path or not self.textbox.toPlainText().strip():
                self.show_error_message('Please select a folder and load a file')
                return

            lines = self.textbox.toPlainText().split("\n")
            lines = [line.strip() for line in lines if line.strip() != ""]
            if len(lines) < len(os.listdir(self.folder_path)):
                self.show_error_message('There are more files than available names.')
                return

            self.show_progress_dialog('Processing...')
        except Exception as e:
            self.show_error_message(str(e))



    def show_error_message(self, message):
        # Displays an error message box
        msg = QMessageBox()
        msg.setIcon(QMessageBox.Critical)
        msg.setText("Error")
        msg.setInformativeText(message)
        msg.setWindowTitle("Error")
        msg.setStandardButtons(QMessageBox.Ok)
        msg.exec_()



    def show_progress_dialog(self, message):
        # Displays a progress dialog while renaming files
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
        # Displays a success message box
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
        self.setWindowTitle('Rename files')

        # Widgets
        self.textbox = QTextEdit(self)
        self.textbox.setAcceptDrops(False)

        self.open_button = QPushButton('Open file .txt', self)
        self.open_button.clicked.connect(self.open_file)
        
        self.remove_button = QPushButton('Delete clones', self)
        self.remove_button.clicked.connect(self.remove_duplicates)
        
        self.folder_btn = QPushButton('Select folder', self)
        self.folder_btn.clicked.connect(self.select_folder)
        
        self.start_btn = QPushButton('Start', self)
        self.start_btn.clicked.connect(self.rename_files)

        self.setAcceptDrops(True)


        # Layout
        self.VLayRandoname = QVBoxLayout()
        self.setLayout(self.VLayRandoname)

        self.VLayRandoname.addWidget(self.textbox)
        self.VLayRandoname.addWidget(self.open_button)
        self.VLayRandoname.addWidget(self.remove_button)
        self.VLayRandoname.addWidget(self.folder_btn)
        self.VLayRandoname.addWidget(self.start_btn)



#____ ____ ____ _  _ ____ ___    _    ____ _  _ _  _ ____ _  _
#|__/ |  | |    |_/  |___  |     |    |__| |  | |\ | |    |__|
#|  \ |__| |___ | \_ |___  |     |___ |  | |__| | \| |___ |  |
                
#ENDING | https://www.youtube.com/watch?v=CgZVrvQZB6U&ab_channel=SECRETGUEST :3

if __name__ == '__main__':
    app = QApplication([])
    ex = Randonamers()
    ex.show()
    app.exec_()

