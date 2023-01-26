# https://www.youtube.com/watch?v=-uO496C6xYE&ab_channel=ArananSesEfektleri

import itertools

#Here we will define the password to find, in which characters he's been written
password =input("Enter a password to find: ")
characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

#And here's a variable  to close the loop.
password_found = False

#First we want to check if the password is not in our password list 
with open(r"CHANGE FOR YOUR PATH HERE \rockyou.txt", "r") as f:

    existing_passwords = f.read().splitlines() #we will read the list line by line

    if password in existing_passwords:
        print("Password found :", password)

#If it's not in our list :
    else:
        for length in range(1, 28): #we will try in a range of 1 to 29 characters :

            for combination in itertools.product(characters, repeat=length): #We create our loop to generate new combinations 

                tested = "".join(combination) 


# Those lines can be useful for debugging or check the tested combination, but it will slow the process,
#  python will write in a file all combinations tested, or generate combination in terminal, or both

#                print(combination)

#                with open(r"YOUR PATH HERE \ NAME YOUR LIST HERE.txt", "a") as f :
#                    f.write(f"{combination}\n")


                if tested == password: #if combination tested is the password, we close the programm displaying that we found the password

                    print("Password found :", tested)
                    password_found = True
                    break

            if password_found: #we close the program
                break
