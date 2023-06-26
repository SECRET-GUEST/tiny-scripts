import os
from PyQt5.QtWidgets import QApplication, QWidget, QPushButton, QVBoxLayout, QFileDialog, QLineEdit, QLabel

class MyApp(QWidget):
    def __init__(self):
        super().__init__()
        self.title = 'JSON Word Replacer'
        self.initUI()
        
    def initUI(self):
        self.setWindowTitle(self.title)
        
        layout = QVBoxLayout()
        self.setLayout(layout)
        
        self.btn1 = QPushButton('Open Directory', self)
        self.btn1.clicked.connect(self.open_directory)
        layout.addWidget(self.btn1)
        
        self.word_label = QLabel('Words', self)
        layout.addWidget(self.word_label)
        
        self.word_entry = QLineEdit(self)
        layout.addWidget(self.word_entry)
        
        self.replace_label = QLabel('Replace by', self)
        layout.addWidget(self.replace_label)
        
        self.replace_entry = QLineEdit(self)
        layout.addWidget(self.replace_entry)
        
        self.btn2 = QPushButton('Launch', self)
        self.btn2.clicked.connect(self.launch)
        self.btn2.setEnabled(False)
        layout.addWidget(self.btn2)
        
        self.show()
        
    def open_directory(self):
        self.directory = QFileDialog.getExistingDirectory(self, 'Open Directory')
        self.btn2.setEnabled(True)
        
    def launch(self):
        word_to_replace = self.word_entry.text()
        replacement_word = self.replace_entry.text()
        
        json_files = [os.path.join(self.directory, f) for f in os.listdir(self.directory) if f.endswith('.json')]
        for json_file in json_files:
            with open(json_file, 'r', encoding='utf-8') as jf:
                lines = jf.readlines()
            
            new_lines = []
            for line in lines:
                if word_to_replace in line:
                    line = replacement_word + "\n"
                new_lines.append(line)
            
            with open(json_file, 'w', encoding='utf-8') as jf:
                jf.writelines(new_lines)

# Create the application
app = QApplication([])
window = MyApp()
app.exec_()
