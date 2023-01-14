netstat -no > connexions.txt
findstr /v "127.0.0.1" connexions.txt > distantes.txt
for /f "tokens=2 delims=:" %%a in (distantes.txt) do (
    for /f "tokens=2" %%b in ("%%a") do (
        nslookup %%b >> données.txt
        for /f "tokens=*" %%c in ('whois %%b') do echo %%c >> données.txt
    )
)
set "file=resultat_%date%.txt"
copy connexions.txt+distantes.txt+données.txt %file%
del connexions.txt
del distantes.txt
del données.txt

