#Create a simple wordlist "1.png,....,500.png"

fichier = open("data.txt", "w+")
i = 1
extension = ".png,"

while i < 500:
   i = i + 1

   fichier.write(f"{i}{extension}")
