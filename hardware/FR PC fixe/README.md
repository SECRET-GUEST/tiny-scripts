```
 ██████╗ ██╗   ██╗██╗██████╗ ███████╗    ███╗   ███╗ ██████╗ ███╗   ██╗████████╗ █████╗  ██████╗ ███████╗
██╔════╝ ██║   ██║██║██╔══██╗██╔════╝    ████╗ ████║██╔═══██╗████╗  ██║╚══██╔══╝██╔══██╗██╔════╝ ██╔════╝
██║  ███╗██║   ██║██║██║  ██║█████╗      ██╔████╔██║██║   ██║██╔██╗ ██║   ██║   ███████║██║  ███╗█████╗  
██║   ██║██║   ██║██║██║  ██║██╔══╝      ██║╚██╔╝██║██║   ██║██║╚██╗██║   ██║   ██╔══██║██║   ██║██╔══╝  
╚██████╔╝╚██████╔╝██║██████╔╝███████╗    ██║ ╚═╝ ██║╚██████╔╝██║ ╚████║   ██║   ██║  ██║╚██████╔╝███████╗
 ╚═════╝  ╚═════╝ ╚═╝╚═════╝ ╚══════╝    ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚══════╝
```

# Tutoriel de Montage PC

Le montage d'un PC nécessite une compréhension des composants et de leur compatibilité. Ce guide vous aidera à choisir les bons composants et à les assembler correctement.

## Planification Virtuelle

Avant de commencer l'assemblage physique, vous pouvez planifier et tester virtuellement votre configuration PC sur [PCPartPicker](https://pcpartpicker.com/builds/). Cet outil vous aidera à vérifier la compatibilité des composants et à estimer le budget.

Pour une expérience interactive d'apprentissage, essayez le jeu [PC Building Simulator](https://store.epicgames.com/fr/p/pc-building-simulator), qui offre une simulation réaliste du processus de montage d'un PC.

![ff4799a177443da9048223dda3999f7c9168095e73718956d8d0baf51636cf4a](https://github.com/SECRET-GUEST/tiny-scripts/assets/92639080/329d3bd6-9f8c-4a35-b8a2-6cc15201c2ce)

## Choix des Composants

### PCI Express
- **Article sur les PCI Express** : [PCIe 5 vs 4 vs 3](https://www.faceofit.com/pcie-5-vs-4-vs-3-pci-express)
  - La différence de performances entre PCIe 5 et PCIe 3 est d'environ 1%, mais le choix de la carte peut affecter la performance de vos SSD NVMe.

### RAM et CPU
- **Outils pour calculer l'alimentation nécessaire** : [What PSU](https://www.whatpsu.com/.../gpu/NVIDIA-GeForce-RTX-3070-Ti)
  - Vérifiez la compatibilité du socket de la carte mère avec votre CPU (par exemple, LGA1200 et socket 1700 ne sont pas compatibles).
  - **Attention** : Vérifiez l'absence de pins tordues/pliées dans le socket du CPU sur une nouvelle carte mère lors de l'achat !

### Refroidissement
- **Options de refroidissement** : Corsair ou Thermaltake.
  - Watercooling personnalisé à partir de 400€. [Configurateur Corsair](https://www.corsair.com/fr/fr/custom-cooling-configurator/)

## Assemblage

### Bottleneck des Composants
- **Calculateur de Bottleneck** : [PC Builds Bottleneck Calculator](https://pc-builds.com/bottleneck-calculator/)

  - un bottleneck de 30% indique un ralentissement potentiel de 30% sur votre machine = vous aurez une vielle machine pour le prix d'une neuve.
    vous pouvez avoir un processeur plus puissant que votre GPU, surtout si vous voulez ajouter plusieurs GPU, mais l'inverse n'est vraiment pas recommandé (10%     grand max, apres vous risquez de gros ralentissements en + de flinguer le CPU rapidement) !
    Par contre vous pouvez jouer avec le bottleneck et l'overclock pour avoir une machine pas cher et ultra performante (mais qui durera moins longtemps)

## Installation du Système d'Exploitation

Après avoir assemblé votre PC, vous pouvez installer un système d'exploitation. Pour une installation facile de Linux, [consultez ce guide](https://github.com/SECRET-GUEST/LINUX).

## Tests et Optimisation

### Performance des Cartes Graphiques
- **Vidéo démontrant l'impact de multiples cartes graphiques sur la performance** : [GPU Cluster vs CPU Rendering](https://youtu.be/UzSZvWHDB0E)

  On remarque que chaque carte du meme type double la puissance / divise par 2 le temps de rendu.

  Autre remarque, si vous achetez un GPU d'occasion, veillez à que les ventilo fonctionnent correctement !

![image](https://github.com/SECRET-GUEST/tiny-scripts/assets/92639080/ac576994-5fd0-49ea-bdf8-eff4c82553c7)
