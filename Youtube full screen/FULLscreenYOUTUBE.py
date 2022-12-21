import webbrowser
import pyautogui
import time

#Open youtube
webbrowser.open(
    "https://www.youtube.com/channel/UCffuj1MEaD6Ga5beTRa525A"
    )

#Wait 3s (for loading)
time.sleep(3)

#then press F key to fullscreen
pyautogui.press('F')


