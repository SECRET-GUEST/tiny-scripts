IS NOT STABLE


Python version 3.11 | batch script = Windows 10
```
██╗    ██╗██╗  ██╗ ██████╗     ██╗███████╗    ██╗    ██╗██╗  ██╗ ██████╗     ██████╗ 
██║    ██║██║  ██║██╔═══██╗    ██║██╔════╝    ██║    ██║██║  ██║██╔═══██╗    ╚════██╗
██║ █╗ ██║███████║██║   ██║    ██║███████╗    ██║ █╗ ██║███████║██║   ██║      ▄███╔╝
██║███╗██║██╔══██║██║   ██║    ██║╚════██║    ██║███╗██║██╔══██║██║   ██║      ▀▀══╝ 
╚███╔███╔╝██║  ██║╚██████╔╝    ██║███████║    ╚███╔███╔╝██║  ██║╚██████╔╝      ██╗   
 ╚══╝╚══╝ ╚═╝  ╚═╝ ╚═════╝     ╚═╝╚══════╝     ╚══╝╚══╝ ╚═╝  ╚═╝ ╚═════╝       ╚═╝   
 ```
 ![who is who](https://user-images.githubusercontent.com/92639080/212443523-50a251f5-27e4-40e4-9434-c17760fe5c97.jpg)

## Surveillance ?

# Ce fichier est inutile, utiliser du batch rends le résultat trop aléatoire, a chaque fois que je le lance il se passe un truc bizzare, le résultat change, d'un coups ca fonctionne 9/10, puis sans rien changer ca ne fonctionne plus,  la connexion saute, il me réécrit 700 echo du script complet...

# Bref je le laisse la a des fin éducatives et parceque c'est drole, mais je vais sans doutes refaire de 0 en partant sur du C, et ca ne sera pas pour tout de suite.

.

.

.

.

.

.

.

.

.

.

.

.
Ce batch script sert à repérer d'éventuelles menaces sur votre réseau de par ses fonctions ;

- [] lancer un scan du pc avec la commande "netstat -no" afin de lister les IP avec lesquelles votre PC communique.
- [] Récupération des adresses IP distantes puis affiche d'ou ces IP proviennent.

Parceque Feur.

## Bref

Ce programme utilise nslookup et whois, qui auront sans doutes besoin d'etre installé avant (ns est présent dans windows depuis la version 8, sauf si vous l'avez craqué)

Whois a besoin d'etre téléchargé et d'etre ajouté au PATH ( vous allez dans modifier les environnements variables, demandez à Cortana, variables d'environnement, path dans la section du bas, ajouter, et la vous copiez coller l'adresse du dossier whois que vous venez de télécharger et **déplacé la ou il ne bougera plus** , puis redémarrez le pc)

 Whois est disponible ici : https://learn.microsoft.com/fr-fr/sysinternals/downloads/whois

sinon, pour aller plus loin ;

```
pip install nmap 
```