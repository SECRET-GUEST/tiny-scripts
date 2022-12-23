# You have to first intall pike pdf and tqdm libraries by running in your cmd :

#pip install pikepdf tqdm 

# Then you will have to get a password list like wordlist or rockyou from kali Linux
# So you will just have to change paths and input files and you can run the script in your cmd by

# python pikepdf.py

import pikepdf
from tqdm import tqdm

#Import password possibilities from rockyou.txt
password =[line.strip() for line in open(r'\YOUR_PATH\rockyou.txt')]

#The script will returns you in your CMD the password of the file
for password in tqdm (password, "decrypting PDF"):
    try:
        with pikepdf.open(r'\YOUR_PATH\YOUR_PDF', password=password) as pdf:            
            print("\n[+] Password found :", password)
            break

 #Bruteforce by continuing until you've tried the good password
    except pikepdf._qpdf.PasswordError as e:
        continue