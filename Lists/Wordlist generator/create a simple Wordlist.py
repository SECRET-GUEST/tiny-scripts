#Create a simple wordlist "1.png,....,500.png"
#You have to change the path keeping the r before and finish par \YOURFILE.txt
# (And have to create the YOURFILE.txt also for some reason)

fichier = open(
    r"D:\...CHANGE THIS\data.txt", "w+")
i = 1
extension = ".png,"

while i < 500:
   i = i + 1

   fichier.write(f"{i}{extension}")
