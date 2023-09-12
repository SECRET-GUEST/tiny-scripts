import os
import shutil

# Liste des extensions de fichiers et noms de dossiers à supprimer
exts_to_delete = ['.pyc', '.pyo', '~']
dirs_to_delete = ['__pycache__']

for root, dirs, files in os.walk('.', topdown=False):
    for d in dirs:
        if d in dirs_to_delete:
            shutil.rmtree(os.path.join(root, d))
    for f in files:
        if any(f.endswith(ext) for ext in exts_to_delete):
            os.remove(os.path.join(root, f))
