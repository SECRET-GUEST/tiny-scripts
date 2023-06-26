import os
import json
from PyQt5.QtWidgets import QApplication, QFileDialog, QCheckBox, QVBoxLayout, QPushButton, QDialog, QLabel
from bs4 import BeautifulSoup

class HtmlTextExtractor(QDialog):
    def __init__(self):
        super().__init__()

        # Créer une boîte de dialogue pour choisir un dossier
        self.folder_dialog = QFileDialog()
        self.folder_dialog.setFileMode(QFileDialog.Directory)

        # Créer une boîte de dialogue pour choisir des fichiers
        self.file_dialog = QFileDialog()
        self.file_dialog.setFileMode(QFileDialog.ExistingFiles)

        # Créer une checkbox pour demander si les sous-dossiers doivent être inclus
        self.include_subfolders_checkbox = QCheckBox("Inclure les sous-dossiers?")

        # Créer un bouton pour démarrer l'extraction
        self.extract_button = QPushButton("Extraire les textes")
        self.extract_button.clicked.connect(self.extract_texts)

        # Créer un label pour afficher les messages
        self.message_label = QLabel()

        # Organiser les widgets dans un layout vertical
        self.layout = QVBoxLayout()
        self.layout.addWidget(self.folder_dialog)
        self.layout.addWidget(self.file_dialog)
        self.layout.addWidget(self.include_subfolders_checkbox)
        self.layout.addWidget(self.extract_button)
        self.layout.addWidget(self.message_label)
        self.setLayout(self.layout)

    def extract_texts(self):
        # Récupérer le dossier sélectionné et la liste des fichiers
        folder = self.folder_dialog.selectedFiles()[0]
        files = self.file_dialog.selectedFiles()

        # Vérifier si les sous-dossiers doivent être inclus
        include_subfolders = self.include_subfolders_checkbox.isChecked()

        # Parcourir tous les fichiers et sous-dossiers si nécessaire
        for root, dirs, filenames in os.walk(folder):
            for filename in filenames:
                if filename in files or include_subfolders:
                    file_path = os.path.join(root, filename)
                    with open(file_path, 'r', encoding='utf-8') as f:
                        html = f.read()

                    soup = BeautifulSoup(html, 'html.parser')
                    texts = {tag['id']: tag.get_text() for tag in soup.find_all(class_='text') if tag.get('id')}

                    # Écrire les textes extraits dans un fichier JSON
                    with open(f'textes_{filename}.json', 'w', encoding='utf-8') as f:
                        json.dump(texts, f, ensure_ascii=False, indent=4)

        self.message_label.setText("Extraction terminée")

if __name__ == "__main__":
    app = QApplication([])
    extractor = HtmlTextExtractor()
    extractor.show()
    app.exec_()
