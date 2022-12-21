#Need pygame module :

# py -m pip install pygame -U

import pygame

pygame.init()

# display window in choosen size (needs 2 () to avoid errors)

screen = pygame.display.set_mode((400, 300))

# Game start
run = True

while run:
    for event in pygame.event.get():
        
        #If you quit, no more records.
        if event.type == pygame.QUIT:
            run = False

        elif event.type == pygame.KEYDOWN:

            # Returns pressed q w e r t y keys (you have to add yours)

            if event.key in [pygame.K_q, pygame.K_w, pygame.K_e, pygame.K_r, pygame.K_t, pygame.K_y]:

                # Display the "note" in your cmd
                print("note played ;", event.key)


pygame.quit()
