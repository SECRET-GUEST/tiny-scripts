import os
import json
import shutil
from bs4 import BeautifulSoup
from PyQt5.QtWidgets import QApplication, QWidget, QPushButton, QVBoxLayout, QFileDialog

class MyApp(QWidget):
    def __init__(self):
        super().__init__()
        self.title = 'HTML-JSON Parser'
        self.initUI()
        
    def initUI(self):
        self.setWindowTitle(self.title)
        
        layout = QVBoxLayout()
        self.setLayout(layout)
        
        self.btn1 = QPushButton('Select Directory', self)
        self.btn1.clicked.connect(self.select_directory)
        layout.addWidget(self.btn1)
        
        self.btn2 = QPushButton('Parse Files', self)
        self.btn2.clicked.connect(self.parse_files)
        self.btn2.setEnabled(False)
        layout.addWidget(self.btn2)
        
        self.show()
        
    def select_directory(self):
        self.directory = QFileDialog.getExistingDirectory(self, 'Select Directory')
        self.btn2.setEnabled(True)
        
    def parse_files(self):
        html_files = [os.path.join(self.directory, f) for f in os.listdir(self.directory) if f.endswith('.html')]
        json_files = [os.path.join(self.directory, f) for f in os.listdir(self.directory) if f.endswith('.json')]

        if len(html_files) > 0:
            html_file = html_files[0]

            for json_file in json_files:
                new_html_file = os.path.join(self.directory, os.path.basename(json_file).replace('.json', '.html'))
                shutil.copy2(html_file, new_html_file)

                with open(json_file, 'r', encoding='utf-8') as jf:
                    data = json.load(jf)
                with open(new_html_file, 'r+', encoding='utf-8') as hf:
                    soup = BeautifulSoup(hf, 'html.parser')
                    for key, value in data.items():

                        span = soup.find('span', {'id': key})
                        if span:
                            span.replace_with(soup.new_string(value))
                    
                    hf.seek(0)
                    hf.truncate()
                    hf.write(str(soup))

# Create the application
app = QApplication([])
window = MyApp()
app.exec_()
