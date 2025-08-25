[![Ubuntu 22.04](https://img.shields.io/badge/Ubuntu-22.04%20LTS-E95420?logo=ubuntu\&logoColor=white\&style=for-the-badge)](https://releases.ubuntu.com/jammy/)
[![Ubuntu 24.04](https://img.shields.io/badge/Ubuntu-24.04%20LTS-E95420?logo=ubuntu\&logoColor=white\&style=for-the-badge)](https://releases.ubuntu.com/noble/)

```
 █████╗ ██╗      ██████╗██╗  ██╗ ██████╗  █████╗ ██╗  ██╗    ███████╗██╗██╗  ██╗
██╔══██╗██║     ██╔════╝██║  ██║██╔═████╗██╔══██╗╚██╗██╔╝    ██╔════╝██║╚██╗██╔╝
███████║██║     ██║     ███████║██║██╔██║╚█████╔╝ ╚███╔╝     █████╗  ██║ ╚███╔╝ 
██╔══██║██║     ██║     ╚════██║████╔╝██║██╔══██╗ ██╔██╗     ██╔══╝  ██║ ██╔██╗ 
██║  ██║███████╗╚██████╗     ██║╚██████╔╝╚█████╔╝██╔╝ ██╗    ██║     ██║██╔╝ ██╗
╚═╝  ╚═╝╚══════╝ ╚═════╝     ╚═╝ ╚═════╝  ╚════╝ ╚═╝  ╚═╝    ╚═╝     ╚═╝╚═╝  ╚═╝
```

# Corriger l’absence de son sur cartes ASUS Z690/Z790 (ALC408x “USB Audio”)

**Ubuntu 22.04 HWE / 24.04 LTS — PipeWire ou PulseAudio**

---

## 🚀 Correctif rapide (copier-coller)

### 1. Identifier la carte USB “Audio” (souvent `card 1`)

```bash
aplay -l
```

### 2. Tester chaque PCM jusqu’à entendre « Front Center »

```bash
for d in 0 1 2 3; do
  echo "Test de plughw:Audio,$d"
  aplay -D plughw:Audio,$d /usr/share/sounds/alsa/Front_Center.wav || true
done
```

➡️ Note le numéro qui **produit réellement du son** (exemple : `1`).

### 3. Forcer ce PCM par défaut

```bash
sudo tee /etc/asound.conf >/dev/null <<'EOF'
pcm.!default { type plug slave.pcm "hw:Audio,1" }
ctl.!default { type hw card "Audio" }
EOF
```

### 4. Redémarrer l’audio et définir le sink par défaut

```bash
systemctl --user restart wireplumber pipewire pipewire-pulse 2>/dev/null || true
pactl list short sinks
pactl set-default-sink "alsa_output.usb-Generic_USB_Audio-00.HiFi__hw_Audio__sink"
paplay /usr/share/sounds/alsa/Front_Center.wav
```

✅ Si tu entends le son → problème résolu.

---

## 🔍 Pourquoi ça arrive

* Les cartes mères récentes ASUS (Z690/Z790) intègrent des **codecs Realtek ALC4080/4082 reliés en USB** (et non plus en HDA classique).
* ALSA expose alors une carte **USB Audio** avec plusieurs sous-périphériques PCM :

  * `hw:Audio,0` → souvent SPDIF / muet
  * `hw:Audio,1` → généralement les enceintes / casque analogique
  * `hw:Audio,2/3` → autres sorties
* PipeWire/Pulse choisit parfois le mauvais PCM → tout semble correct, mais **aucun son ne sort**.

---

## 🛠️ Comment le correctif fonctionne

1. On teste chaque PCM (`aplay -D plughw:Audio,<n>`) jusqu’à trouver celui qui sort du son.
2. On force ALSA à toujours utiliser ce PCM dans `/etc/asound.conf`.
3. On redémarre PipeWire/Pulse pour que toutes les applis respectent ce réglage.
4. On fixe éventuellement le sink PipeWire avec `pactl`.

---

## 🔎 Commandes utiles

```bash
# Voir les cartes détectées
aplay -l
cat /proc/asound/cards

# Voir les sinks disponibles
pactl list short sinks
pactl list short cards

# Identifier le codec USB (souvent ALC408x, VID:PID 0b05:1a27)
cat /proc/asound/card*/usbid
```

---

## ❌ Revenir en arrière

```bash
sudo rm -f /etc/asound.conf
systemctl --user restart wireplumber pipewire pipewire-pulse 2>/dev/null || true
```

---

## 📝 Notes

* Fonctionne sur **Ubuntu 22.04 HWE (kernel 6.8.x)** et **Ubuntu 24.04 (kernel 6.14.x)**.
* Compatible **PipeWire** et **PulseAudio**.
* Ne concerne que les codecs **ALC408x câblés en USB** (ASUS, certaines MSI, etc.).
* Si plusieurs cartes audio USB sont branchées, toujours vérifier avec `aplay -l` quelle carte est `"Audio"`.

---

## ✅ Infos à inclure dans un rapport de bug

* Distro & version : Ubuntu 22.04 / 24.04
* Kernel : `uname -r`
* Codec USB : Realtek ALC408x (VID\:PID `0b05:1a27`)
* PCM fonctionnel : `plughw:Audio,1` (exemple)
* Fix utilisé : `/etc/asound.conf` pointant vers le bon PCM

---

## 💎 Recommandations  

Si vous recherchez d’autres outils pour améliorer votre productivité sur desktop, voici quelques dépôts supplémentaires à explorer :

- [Linux](https://github.com/SECRET-GUEST/LINUX) — Tutoriels pas à pas pour installer un système Linux de manière simple et sécurisée (Ubuntu conseillé pour débuter).  

- [LNK Reader](https://github.com/SECRET-GUEST/windows_link_reader) — Un outil pratique pour les utilisateurs en dual-boot Linux qui ont besoin d’ouvrir et d’utiliser les raccourcis Windows (`.lnk`).  
