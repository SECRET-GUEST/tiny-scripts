/[![Ubuntu 22.04](https://img.shields.io/badge/Ubuntu-22.04%20LTS-E95420?logo=ubuntu&logoColor=white&style=for-the-badge)](https://releases.ubuntu.com/jammy/)
[![Ubuntu 24.04](https://img.shields.io/badge/Ubuntu-24.04%20LTS-E95420?logo=ubuntu&logoColor=white&style=for-the-badge)](https://releases.ubuntu.com/noble/)

```
 █████╗ ██╗      ██████╗██╗  ██╗ ██████╗  █████╗ ██╗  ██╗    ███████╗██╗██╗  ██╗
██╔══██╗██║     ██╔════╝██║  ██║██╔═████╗██╔══██╗╚██╗██╔╝    ██╔════╝██║╚██╗██╔╝
███████║██║     ██║     ███████║██║██╔██║╚█████╔╝ ╚███╔╝     █████╗  ██║ ╚███╔╝ 
██╔══██║██║     ██║     ╚════██║████╔╝██║██╔══██╗ ██╔██╗     ██╔══╝  ██║ ██╔██╗ 
██║  ██║███████╗╚██████╗     ██║╚██████╔╝╚█████╔╝██╔╝ ██╗    ██║     ██║██╔╝ ██╗
╚═╝  ╚═╝╚══════╝ ╚═════╝     ╚═╝ ╚═════╝  ╚════╝ ╚═╝  ╚═╝    ╚═╝     ╚═╝╚═╝  ╚═╝
                                                                                
```
## [→ Une version Française de cette note est disponnible ici ←](https://github.com/SECRET-GUEST/tiny-scripts/blob/ALL/linux/Debug/fix%20alc408x/README_FR.md)


# Fix no audio on ASUS Z690/Z790 boards (ALC408x “USB Audio”)  
**Ubuntu 22.04 HWE / 24.04 LTS — PipeWire or PulseAudio**

---

## 🚀 Quick fix (copy & paste)


### 1. Identify your USB “Audio” card (usually card 1)
```bash
aplay -l
```

### 2. Test each PCM until you hear “Front Center”

```bash
for d in 0 1 2 3; do
  echo "Testing plughw:Audio,$d"
  aplay -D plughw:Audio,$d /usr/share/sounds/alsa/Front_Center.wav || true
done
```

##### Suppose sound works on plughw:Audio,1 → pin it as default:

```bash
sudo tee /etc/asound.conf >/dev/null <<'EOF'
pcm.!default { type plug slave.pcm "hw:Audio,1" }
ctl.!default { type hw card "Audio" }
EOF
```

### 3. Restart audio stack & set default sink

```bash
systemctl --user restart wireplumber pipewire pipewire-pulse 2>/dev/null || true
pactl list short sinks
pactl set-default-sink "alsa_output.usb-Generic_USB_Audio-00.HiFi__hw_Audio__sink"
paplay /usr/share/sounds/alsa/Front_Center.wav
````

✅ If you hear sound → you’re done.

---

## 🔍 Why this happens

* Many modern ASUS Z690/Z790 motherboards ship with **Realtek ALC4080/ALC4082 codecs wired via USB** (not legacy HDA).
* ALSA exposes this codec as a **USB card** (usually named `Audio`) with multiple **PCM devices**:

  * `hw:Audio,0` → often SPDIF / inactive
  * `hw:Audio,1` → usually analog speakers/headphones (the one you need)
  * `hw:Audio,2/3` → other endpoints
* PipeWire/Pulse relies on **UCM profiles** to map “Speakers / Headphones / SPDIF” → PCM, but sometimes it picks the wrong one.
* Result: everything *looks* correct (`pactl list sinks`, volumes OK) but **no sound comes out**.

---

## 🛠️ How the fix works

1. We use `aplay -D plughw:Audio,<n>` to **find which PCM really outputs sound**.
2. We force ALSA’s default device in `/etc/asound.conf` to always use that PCM.

   * This bypasses bad auto-detection.
   * Using the card **name** (`"Audio"`) is stable across reboots, unlike `card 1`.
3. We restart PipeWire/Pulse so apps respect the new default.
4. Optionally, we set the sink default in Pulse/PipeWire with `pactl`.

---

## 🔎 Useful checks

```bash
# See detected sound cards
aplay -l
cat /proc/asound/cards

# See available sinks
pactl list short sinks
pactl list short cards

# Confirm Realtek ALC408x USB codec (VID:PID often 0b05:1a27)
cat /proc/asound/card*/usbid
```

---

## ❌ How to undo

```bash
sudo rm -f /etc/asound.conf
systemctl --user restart wireplumber pipewire pipewire-pulse 2>/dev/null || true
```

---

## 📝 Notes

* Applies to **Ubuntu 22.04 HWE kernels (6.8.x)** and **Ubuntu 24.04 kernels (6.14.x)**.
* Works with both **PipeWire** and **PulseAudio**.
* Bug affects only **USB-wired ALC408x codecs** (ASUS, some MSI, etc.).
* If you have multiple USB audio devices, always check with `aplay -l` which card name is `"Audio"`.

---

## ✅ Checklist for bug reports

* Distro & version: Ubuntu 22.04 / 24.04
* Kernel: `uname -r`
* USB codec: Realtek ALC408x (VID\:PID `0b05:1a27`)
* Working PCM: `plughw:Audio,1` (example, may differ)
* Fix used: `/etc/asound.conf` pointing to correct PCM

---

## 💎 Recommendations  

If you are looking for more tools to enhance your desktop productivity, here are a few additional repositories worth exploring:

- [Linux](https://github.com/SECRET-GUEST/LINUX) — Step-by-step tutorials to safely and easily install a Linux OS (Ubuntu recommended for beginners).  

- [LNK Reader](https://github.com/SECRET-GUEST/windows_link_reader) — A handy tool for dual-boot Linux users who need to open and work with Windows `.lnk` shortcuts.  
