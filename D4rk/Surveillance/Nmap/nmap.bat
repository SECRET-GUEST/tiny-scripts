netstat -a > connexions.txt
for /F "tokens=2 delims=:" %%i in ('findstr /R "^  [^ ]" connexions.txt') do @nmap -sS -p- %%i >> resultat.txt
