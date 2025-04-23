[![PowerShell Badge](https://img.shields.io/badge/WviNdwoS-Powershell-Scripts-green)](https://docs.microsoft.com/en-us/powershell/)

```
 ██████╗███████╗██████╗ ████████╗    ███████╗ ██████╗ █████╗ ███╗   ██╗███╗   ██╗███████╗██████╗ 
██╔════╝██╔════╝██╔══██╗╚══██╔══╝    ██╔════╝██╔════╝██╔══██╗████╗  ██║████╗  ██║██╔════╝██╔══██╗
██║     █████╗  ██████╔╝   ██║       ███████╗██║     ███████║██╔██╗ ██║██╔██╗ ██║█████╗  ██████╔╝
██║     ██╔══╝  ██╔══██╗   ██║       ╚════██║██║     ██╔══██║██║╚██╗██║██║╚██╗██║██╔══╝  ██╔══██╗
╚██████╗███████╗██║  ██║   ██║       ███████║╚██████╗██║  ██║██║ ╚████║██║ ╚████║███████╗██║  ██║
 ╚═════╝╚══════╝╚═╝  ╚═╝   ╚═╝       ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
```

# Exportateur de Certificats

Un utilitaire PowerShell pour exporter en toute sécurité les informations de certificats à des fins d'analyse, conçu pour les utilisateurs soucieux de la sécurité.

## Aperçu

Ce script exporte une liste filtrée de certificats depuis vos magasins de certificats Windows, créant un fichier texte qui peut être analysé à des fins de sécurité. Il est spécifiquement conçu pour garantir qu'aucune information de clé privée n'est incluse dans l'export, ce qui permet de partager en toute sécurité le résultat avec des analystes de sécurité ou des assistants IA.

## Fonctionnalités

- Exporte les certificats depuis plusieurs magasins de certificats Windows :
  - Magasin racine de la machine locale
  - Magasin d'autorités de certification de la machine locale
  - Magasin personnel de l'utilisateur actuel
- Filtre automatiquement :
  - Les certificats contenant des clés privées
  - Les certificats dont les noms semblent être générés automatiquement ou des clés locales
  - Les noms de certificats non lisibles par un humain
- Formate clairement les dates d'expiration (AAAA-MM-JJ) sans information d'heure
- Crée un fichier de sortie prêt à l'emploi sur votre bureau
- Inclut des conseils utiles pour les destinataires analysant la liste de certificats
Voici la partie Utilisation revue en français et en anglais, adaptée pour refléter la façon dont les utilisateurs exécuteront réellement le script :

## Utilisation

1. Téléchargez le script `ExportateurDeCertificats.ps1`
2. Faites un clic droit sur le fichier et sélectionnez "Exécuter avec PowerShell"
   - Sur Windows 11, cette option est directement disponible dans le menu contextuel
   - Sur Windows 10, vous devrez peut-être choisir "Ouvrir avec" puis "PowerShell"
3. Le script s'exécutera automatiquement et générera le fichier `certificats_a_analyser.txt` sur votre bureau

Note : Pour analyser vos certificats, copiez le contenu du fichier généré et soumettez-le à votre assistant IA

## Fonctionnalités de Sécurité

Le script inclut plusieurs niveaux de filtrage de sécurité pour garantir que les informations sensibles ne sont jamais exportées :

- **Filtre HasPrivateKey** : Exclut tout certificat associé à du matériel de clé privée
- **Correspondance de Motifs** : Filtre les certificats avec des motifs couramment associés aux clés privées :
  - GUIDs et longues chaînes hexadécimales
  - Noms contenant des mots-clés comme "KEYID" ou "PRIVKEY"
  - Noms identifiant des certificats locaux ou personnels
- **Vérification de Lisibilité Humaine** : Inclut uniquement les certificats avec des noms qui semblent être des noms communs appropriés

## Exemple de Sortie

Le fichier de sortie comprend un en-tête formaté avec des instructions pour l'analyse, suivi d'une liste de certificats au format :

```
Nom du Certificat - Expire le : AAAA-MM-JJ
```

## Prérequis

- Système d'exploitation Windows
- PowerShell 3.0 ou supérieur
- Privilèges administratifs (pour accéder à certains magasins de certificats)

## Licence

[Licence MIT](LICENSE)

## Avertissement

Vérifiez toujours les données exportées avant de les partager pour vous assurer qu'aucune information sensible n'est incluse. Cet outil est fourni tel quel, sans garantie.
