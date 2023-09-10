import os
import shutil

for root, dirs, files in os.walk('.'):
    if '__pycache__' in dirs:
        shutil.rmtree(os.path.join(root, '__pycache__'))


# Can be used in cmd with : 
# find . -type d -name __pycache__ -exec rm -r {} +
