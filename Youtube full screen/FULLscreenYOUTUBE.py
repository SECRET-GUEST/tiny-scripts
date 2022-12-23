import webbrowser
import pyautogui
import time

#Open youtube
webbrowser.open(
    "https://www.youtube.com/channel/UCffuj1MEaD6Ga5beTRa525A"
    )

#Wait 3s (for the page's loading) => Change by your own value
time.sleep(3)

#then press F key to fullscreen
pyautogui.press('F')


