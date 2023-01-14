netstat -a > connexions.txt
for /F "tokens=2 delims=:" %%i in ('findstr /R "^  [^ ]" connexions.txt') do @echo %%i
for /F "tokens=2 delims=:" %%i in ('findstr /R "^  [^ ]" connexions.txt') do whois %%i >> resultat.txt
