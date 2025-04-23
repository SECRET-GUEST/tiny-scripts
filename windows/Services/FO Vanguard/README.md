
![Batch Script](https://img.shields.io/badge/script-batch-DDFF00)
```
 ██████╗██╗   ██╗████████╗    ██╗   ██╗ █████╗ ███╗   ██╗ ██████╗ ██╗   ██╗ █████╗ ██████╗ ██████╗ 
██╔════╝██║   ██║╚══██╔══╝    ██║   ██║██╔══██╗████╗  ██║██╔════╝ ██║   ██║██╔══██╗██╔══██╗██╔══██╗
██║     ██║   ██║   ██║       ██║   ██║███████║██╔██╗ ██║██║  ███╗██║   ██║███████║██████╔╝██║  ██║
██║     ██║   ██║   ██║       ╚██╗ ██╔╝██╔══██║██║╚██╗██║██║   ██║██║   ██║██╔══██║██╔══██╗██║  ██║
╚██████╗╚██████╔╝   ██║        ╚████╔╝ ██║  ██║██║ ╚████║╚██████╔╝╚██████╔╝██║  ██║██║  ██║██████╔╝
 ╚═════╝ ╚═════╝    ╚═╝         ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ 
```

[![English](https://upload.wikimedia.org/wikipedia/commons/a/a4/Flag_of_the_United_Kingdom.svg)](https://github.com/SECRET-GUEST/tiny-scripts/blob/ALL/windows/Services/FO%20Vanguard/EN_README.md) This page is also available in English.


# Gestionnaire Riot Vanguard

## Description
Ce script batch fournit une interface simple pour gérer Riot Vanguard, le système anti-triche utilisé par Riot Games pour des jeux comme Valorant. Il permet aux utilisateurs d'activer ou de désactiver facilement Riot Vanguard sans avoir à ajuster manuellement les services système.

## Fonctionnalités
- Activer Riot Vanguard
- Désactiver Riot Vanguard
- Demande automatique des privilèges administrateur

## Prérequis
- Système d'exploitation Windows
- Privilèges administrateur (le script tentera d'élever les privilèges s'il n'est pas exécuté en tant qu'administrateur)

## Utilisation
1. Exécutez le fichier `FO_vanguard.bat`.
2. Si le script n'est pas exécuté en tant qu'administrateur, il tentera d'élever les privilèges.
3. Choisissez dans le menu :
   - Appuyez sur 1 pour activer Riot Vanguard
   - Appuyez sur 2 pour désactiver Riot Vanguard

## Fonctionnement
- Activation : Configure les services Vanguard (vgc et vgk) pour qu'ils démarrent automatiquement et les démarre.
- Désactivation : Arrête les services Vanguard et les configure comme désactivés.

## Note
Ce script modifie les services système. Utilisez-le de manière responsable et uniquement si vous comprenez les implications de l'activation ou de la désactivation de Riot Vanguard.

## Avertissement
Cet outil n'est ni affilié ni approuvé par Riot Games. Utilisez-le à vos propres risques.
