import subprocess

# Path to your browser
browser = r"C:YOUR_PATH\Firefox.exe"

# Launch in private mode
process = subprocess.Popen([browser, "--incognito"])

# Wait browser is closed
process.wait()

# Run "ipconfig /flushdns"
subprocess.call(["ipconfig", "/flushdns"])


