import subprocess

#############################Résout les problemes d'encodages (merci GPT-3)
import chardet


def detect_encoding(file):
    with open(file, 'rb') as f:
        resultat = chardet.detect(f.read())
    return resultat['encoding']


encoding = detect_encoding("connexions.txt")
with open("connexions.txt", "r", encoding=encoding) as f:
    contenu = f.readlines()
####################################Vous pouvez commenter/supprimer si ca sert à rien



#Exécution de la commande netstat -a et enregistrement des résultats dans connexions.txt
with open("connexions.txt", "w") as f:
    resultat = subprocess.run(["netstat", "-a"], stdout=f)

#lecture du fichier connexions.txt
with open("connexions.txt", "r") as f:
    contenu = f.readlines()

#Ecrire dans le fichier resultat.txt 
with open("resultatat.txt", "w") as f:

    for line in contenu:
        ip = line.split()[-1] # On extrait l'ip pour chaque lignes

#On trie IP distante et locale, vu que ce sont les distantes qui nous interessent (donc ciao tout qui commence par ;)
        if "127.0.0" in ip or "192.168" in ip or "10." in ip or "172." in ip:
            continue

#On recherche les info avec nslookup (on peut changer ca par whois -v ou encore, mais moins légalement : nmap -sS -p)
        resultat = subprocess.run(["nslookup", ip], stdout=subprocess.PIPE)

#On enregistre tout dans resultat.txt
        f.write(resultat.stdout.decode())