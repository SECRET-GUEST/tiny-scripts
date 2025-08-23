[![WinDdos](https://img.shields.io/badge/WinDdos-blue)](https://www.microsoft.com/en-us/windows)
[![Batch Script](https://img.shields.io/badge/script-batch-DDFF00)](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands)

```
██████╗ ███████╗███████╗███████╗████████╗    ██╗    ██╗██╗███╗   ██╗██████╗ ██████╗  ██████╗ ███████╗    ██╗   ██╗██████╗ ██████╗  █████╗ ████████╗███████╗
██╔══██╗██╔════╝██╔════╝██╔════╝╚══██╔══╝    ██║    ██║██║████╗  ██║██╔══██╗██╔══██╗██╔═══██╗██╔════╝    ██║   ██║██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔════╝
██████╔╝█████╗  ███████╗█████╗     ██║       ██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║  ██║██║   ██║███████╗    ██║   ██║██████╔╝██║  ██║███████║   ██║   █████╗  
██╔══██╗██╔══╝  ╚════██║██╔══╝     ██║       ██║███╗██║██║██║╚██╗██║██║  ██║██║  ██║██║   ██║╚════██║    ██║   ██║██╔═══╝ ██║  ██║██╔══██║   ██║   ██╔══╝  
██║  ██║███████╗███████║███████╗   ██║       ╚███╔███╔╝██║██║ ╚████║██████╔╝██████╔╝╚██████╔╝███████║    ╚██████╔╝██║     ██████╔╝██║  ██║   ██║   ███████╗
╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝   ╚═╝        ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝     ╚═════╝ ╚═╝     ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝
```

# Désactiver les mises à jour Windows (Batch en mode sans échec)

Petit script batch permettant de **désactiver les mises à jour Windows** de manière fiable en stoppant les services liés, en bloquant leur redémarrage, en désactivant l’optimisation de livraison et en appliquant des clés de registre.
⚠️ Ce script doit être exécuté depuis le **mode sans échec** (Safe Mode), car certains services se relancent immédiatement en mode normal.

> ⚠️ Avertissement : cet outil est destiné aux utilisateurs avancés. Désactiver les mises à jour signifie ne plus recevoir de correctifs de sécurité. À utiliser en connaissance de cause et avec des sauvegardes hors ligne.

---

## Pourquoi ce script existe

Sur de nombreuses machines, *winddos* (écrit volontairement ainsi) est devenu **extrêmement instable** avec les récentes mises à jour.
Les retours d’utilisateurs font état d’échecs d’upgrade, de SSD non détectés, de gels sous Chrome/Edge, de pertes de FPS dans certains jeux, et de bugs récurrents depuis les versions **23H2** et **24H2**.
Microsoft a reconnu certains de ces problèmes, mais les correctifs tardent souvent.

---

## Fonctionnalités du script

* **Stoppe et désactive** les services liés aux mises à jour :

  * `wuauserv` (Windows Update)
  * `bits` (Background Intelligent Transfer)
  * `dosvc` (Delivery Optimization)
  * `UsoSvc` (Update Orchestrator)
  * `WaaSMedicSvc` (Update Medic)

* **Ajoute des clés de registre** de stratégie pour bloquer les mises à jour automatiques :

  * `NoAutoUpdate=1`
  * `AUOptions=2` (notification seulement, optionnel)

* **Désactive les tâches planifiées** de mise à jour (Update Orchestrator, scans planifiés, etc.).

* **Affiche un résumé** pour vérifier que les modifications ont bien été appliquées.

---

## Prérequis

* Compte administrateur.
* **Démarrer en mode sans échec** (Safe Mode) obligatoire.
* Compatible Windows 10 et Windows 11.

---

## Activer le mode sans échec avec `msconfig`

1. Appuyer sur **Win+R**, taper `msconfig`, valider.
2. Onglet **Démarrer** → cocher **Démarrage sécurisé** → choisir **Minimal** → OK.
3. Redémarrer.
4. Se connecter (en mode sans échec).
5. **Exécuter le script batch en tant qu’administrateur** (clic droit → *Exécuter en tant qu’administrateur*).
6. Une fois terminé, relancer `msconfig` et **décocher** Démarrage sécurisé → OK → Redémarrer en mode normal.

---

## Utilisation

1. Télécharger `disable-windows-update.bat`.
2. Démarrer en **mode sans échec**.
3. Clic droit → **Exécuter en tant qu’administrateur**.
4. Redémarrer en mode normal.
5. (Optionnel) Vérifier l’état des services via la commande `sc query`.

---

## Commandes manuelles (pour utilisateurs avancés)

À exécuter dans **Invite de commandes (Admin)**, en mode sans échec.

### 1) Stopper et désactiver les services

```bat
sc config wuauserv start= disabled
net stop wuauserv

sc config bits start= disabled
net stop bits

sc config dosvc start= disabled
net stop dosvc

sc config usosvc start= disabled
net stop usosvc

sc config WaaSMedicSvc start= disabled
net stop WaaSMedicSvc
```

### 2) Clés de registre de stratégie

```bat
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f
rem Optionnel : notifier avant de télécharger/installer
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 2 /f
```

### 3) Désactiver les tâches planifiées

```bat
schtasks /Change /TN "\Microsoft\Windows\WindowsUpdate\Scheduled Start" /Disable
schtasks /Change /TN "\Microsoft\Windows\WindowsUpdate\AUFirmwareInstall" /Disable
schtasks /Change /TN "\Microsoft\Windows\WindowsUpdate\Automatic App Update" /Disable
schtasks /Change /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan" /Disable
schtasks /Change /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Retry Scan" /Disable
schtasks /Change /TN "\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker" /Disable
```

---

## Réactiver les mises à jour (si besoin)

```bat
sc config wuauserv start= demand
sc config bits start= demand
sc config dosvc start= demand
sc config usosvc start= demand
sc config WaaSMedicSvc start= demand

net start wuauserv
net start bits
net start dosvc
net start usosvc
net start WaaSMedicSvc

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 0 /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /f
```

---

## Stabilité de *winddos* (rapports utilisateurs)

| Version             | Stabilité perçue | Problèmes rapportés par la communauté                                                                                                 |
| ------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| **Windows 10 22H2** | Haute            | Peu de bugs, version jugée “finale” et stable.                                                                                        |
| **Windows 11 22H2** | Moyenne/Haute    | Version la plus “fiable” de Windows 11 selon les retours.                                                                             |
| **Windows 11 23H2** | Moyenne/Basse    | Mises à jour qui échouent, crashs fréquents, erreurs type `0x8007007F`.                                                               |
| **Windows 11 24H2** | Basse            | Bugs SSD (disques invisibles), freezes sur apps Chromium, incompatibilités de jeux. Correctifs partiels mais instabilité persistante. |

---

## FAQ

**Pourquoi le mode sans échec ?**
Parce que certains services comme **WaaSMedicSvc** se réactivent automatiquement en mode normal. En mode sans échec, ils restent désactivés.

**Vais-je rater des correctifs de sécurité ?**
Oui. Une solution consiste à réactiver les updates manuellement 1x/mois, installer les correctifs, puis désactiver à nouveau.

**Existe-t-il une alternative plus douce ?**
Oui : utiliser la stratégie de groupe “Notifier avant téléchargement/installation” plutôt qu’un blocage complet.

## Crédits

* Retours utilisateurs et enquêtes sur le comportement de Windows 11 23H2/24H2, ainsi que la documentation officielle Microsoft “Release health”.  
([Microsoft Learn][1], [Windows Central][2], [Tom's Hardware][3], [PC Gamer][10], [Reddit][4])

---

[1]: https://learn.microsoft.com/en-us/windows/release-health/status-windows-11-23h2?utm_source=chatgpt.com "Windows 11, version 23H2 - problèmes connus et notifications"
[2]: https://www.windowscentral.com/microsoft/windows-11/windows-24h2-update-nuking-ssds-what-to-do?utm_source=chatgpt.com "La mise à jour Windows 11 24H2 pourrait endommager certains SSD"
[3]: https://www.tomshardware.com/pc-components/ssds/latest-windows-11-security-patch-might-be-breaking-ssds-under-heavy-workloads-users-report-disappearing-drives-following-file-transfers-including-some-that-cannot-be-recovered-after-a-reboot?utm_source=chatgpt.com "Un patch de sécurité Windows 11 pourrait casser les SSD sous forte charge"
[4]: https://www.reddit.com/r/nvidia/comments/1kgxdno/psa_windows_11_24h2_microsoft_issue_causing/?utm_source=chatgpt.com "PSA: Windows 11 24H2 – problème Microsoft causant des crashs"
[5]: https://learn.microsoft.com/en-us/answers/questions/2818263/disable-updates?utm_source=chatgpt.com "Désactiver les mises à jour – Microsoft Q&A"
[6]: https://support.microsoft.com/en-us/windows/windows-update-delivery-optimization-and-privacy-bf86a244-8f26-a3c7-a137-a43bfbe688e8?utm_source=chatgpt.com "Windows Update Delivery Optimization et confidentialité"
[7]: https://rmm.datto.com/help/de/Content/Troubleshooting/TechnicalInformation/KB360021628031.htm?utm_source=chatgpt.com "Valeurs de registre pour activer/désactiver Windows Update automatique"
[8]: https://www.reddit.com/r/Windows10/comments/8la7uw/how_to_disable_windows_update_medic_center/?utm_source=chatgpt.com "Comment désactiver Windows Update Medic Center"
[9]: https://learn.microsoft.com/en-us/windows/deployment/do/waas-delivery-optimization-reference?utm_source=chatgpt.com "Référence sur Delivery Optimization"
[10]: https://www.pcgamer.com/software/windows/a-new-report-claims-windows-11-update-is-breaking-ssds-and-hdds-but-this-could-just-be-routine-hardware-failures/?utm_source=chatgpt.com "Windows 11 : certaines mises à jour cassent des SSD et HDD"
[11]: https://learn.microsoft.com/en-us/windows/release-health/status-windows-11-24h2?utm_source=chatgpt.com "Windows 11, version 24H2 - problèmes connus et notifications"
[12]: https://superuser.com/questions/946957/stopping-all-automatic-updates-windows-10?utm_source=chatgpt.com "Arrêter toutes les mises à jour automatiques Windows 10"
[13]: https://learn.microsoft.com/en-us/windows/deployment/update/waas-wu-settings?utm_source=chatgpt.com "Gérer les paramètres Windows Update"
