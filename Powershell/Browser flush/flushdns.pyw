import subprocess

# Chemin vers votre navigateur Brave
navigateur = r"C:YOUR_PATH\Firefox.exe"

# Lancer le navigateur Brave en mode privé
process = subprocess.Popen([navigateur, "--incognito"])

# Attendre que le navigateur soit fermé
process.wait()

# Exécuter la commande "ipconfig /flushdns"
subprocess.call(["ipconfig", "/flushdns"])


