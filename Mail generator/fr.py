import random

name0 = ["", "", "1", "2", "3", "4", "5", "6", "7", "8", "9", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]

name1 = ["d4rk", "sasuke", "sasuke", "sasuke", "sasuke", "naruto", "black", "black", "black", "black", "angel", "pepe", "pepe", "pepe", "pepe", "pepe", "4chan", "internet", "scar", "ed", "51568741", "666", "shadow", "theboss", "lol", "", "abel", "achille", "adam", "adolphe", "adrien", "aimable", "aimé", "alain", "alan", "alban", "albert", "albin", "alex", "alexandre", "alexis", "alfred", "aliaume", "alix", "aloïs", "alphonse", "amaury", "ambroise", "amédée", "amour", "ananie", "anastase", "anatole", "andré", "andréa", "ange", "anicet", "anselme", "antelme", "anthelme", "anthony", "antoine", "antonin", "apollinaire", "ariel", "aristide", "armand", "armel", "arnaud", "arsène", "arthur", "aubin", "auguste", "augustin", "aurélien", "axel", "aymard", "aymeric", "balthazar", "baptiste", "baptistin", "barnabé", "barnard", "barthélémy", "basile", "bastien", "baudouin", "benjamin", "benoît", "bérenger", "bernard", "bernardin", "bertrand", "bienvenu", "blaise", "boris", "briac", "brice", "bruno", "calixte", "camille", "casimir", "cédric", "céleste", "célestin", "césar", "charles", "charlie", "christian", "christophe", "claude", "clément", "clovis", "colin", "côme", "constant", "constantin", "corentin", "crépin", "cyprien", "cyril", "cyrille", "damien", "daniel", "dany", "david", "davy", "denis", "désiré", "didier", "dimitri", "dominique", "donald", "donatien", "dorian", "eden", "edgar", "edgard", "edmond", "edouard", "elias", "elie", "eloi", "emile", "emilien", "emmanuel", "eric", "ernest", "erwan", "erwann", "etienne", "eudes", "eugène", "evrard", "fabien", "fabrice", "faustin", "félicien", "félix", "ferdinand", "fernand", "fiacre", "fidèle", "firmin", "flavien", "florent", "florentin", "florian", "floribert", "fortuné", "francis", "franck", "françois", "frédéric", "fulbert", "gabin", "gabriel", "gaël", "gaétan", "gaëtan", "gaspard", "gaston", "gatien", "gauthier", "gautier", "geoffroy", "georges", "gérald", "gérard", "géraud", "germain", "gervais", "ghislain", "gilbert", "gildas", "gilles", "godefroy", "goeffrey", "gontran", "gonzague", "gratien", "grégoire", "gregory", "guénolé", "guilain", "guilem", "guillaume", "gustave", "guy", "guylain", "gwenaël", "gwendal", "habib", "hadrien", "hector", "henri", "herbert", "hercule", "hermann", "hervé", "hippolythe", "honoré", "honorin", "horace",
         "hubert", "hugo", "hugues", "hyacinthe", "ignace", "igor", "isidore", "ismaël", "jacky", "jacob", "jacques", "jean", "jérémie", "jérémy", "jérôme", "joachim", "jocelyn", "joël", "johan", "jonas", "jonathan", "jordan", "josé", "joseph", "joshua", "josselin", "josué", "judicaël", "jules", "julian", "julien", "juste", "justin", "kévin", "lambert", "lancelot", "landry", "laurent", "lazare", "léandre", "léger", "léo", "léon", "léonard", "léonce", "léopold", "lilian", "lionel", "loan", "loïc", "loïck", "loris", "louis", "louison", "loup", "luc", "luca", "lucas", "lucien", "ludovic", "maël", "mahé", "maixent", "malo", "manuel", "marc", "marceau", "marcel", "marcelin", "marcellin", "marin", "marius", "martial", "martin", "martinien", "matéo", "mathéo", "mathias", "mathieu", "mathis", "mathurin", "mathys", "mattéo", "matthias", "matthieu", "maurice", "maxence", "maxime", "maximilien", "médard", "melchior", "merlin", "michael", "michel", "milo", "modeste", "morgan", "naël", "narcisse", "nathan", "nathanaël", "nestor", "nicolas", "noa", "noah", "noé", "noël", "norbert", "octave", "octavien", "odilon", "olivier", "omer", "oscar", "pacôme", "parfait", "pascal", "patrice", "patrick", "paul", "paulin", "perceval", "philémon", "philibert", "philippe", "pierre", "pierrick", "prosper", "quentin", "rafaël", "raoul", "raphaël", "raymond", "réginald", "régis", "rémi", "rémy", "renaud", "rené", "reynald", "richard", "robert", "robin", "rodolphe", "rodrigue", "roger", "roland", "romain", "romaric", "roméo", "romuald", "ronan", "sacha", "salomon", "sam", "sami", "samson", "samuel", "samy", "sasha", "saturnin", "sébastien", "séraphin", "serge", "séverin", "sidoine", "siméon", "simon", "sixte", "stanislas", "stéphane", "sylvain", "sylvère", "sylvestre", "tancrède", "tanguy", "théo", "théodore", "théophane", "théophile", "thibaud", "thibaut", "thierry", "thilbault", "thomas", "tibère", "timéo", "timothé", "timothée", "titouan", "tristan", "tyméo", "ulrich", "ulysse", "vrbain", "vriel", "valentin", "valère", "valérien", "valéry", "valmont", "venceslas", "vianney", "victor", "victorien", "vincent", "virgile", "vivien", "wilfrid", "william", "xavier", "yaël", "yanis", "yann", "yannick", "yohan", "yves", "yvon", "yvonnick", "zacharie", "zéphirin"]

name2 = [".", ".", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", ".", ".", ".", ".", ".", ".", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]

name3 = [  "abyss","black", "gangbang", "mdr", "mdr", "mdr", "mdr", "mdr", "mdr", "délire", "trololo", "999", "777", "thewinner", "jaimelabite", "gamer", "gamer", "gamer", "gamer", "gamer", "hacker", "putin","martin","bernard","thomas","petit","robert","richard","durand","dubois","moreau","laurent","simon","michel","lefebvre","leroy","roux","david","bertrand","morel","fournier","girard","bonnet","dupont","lambert","fontaine","rousseau","vincent","muller","lefevre","faure","andre","mercier","blanc","guerin","boyer","garnier","chevalier","francois","legrand","gauthier","garcia","perrin","robin","clement","morin","nicolas","henry","roussel","mathieu","gautier","masson","marchand","duval","denis","dumont","marie","lemaire","noel","meyer","dufour","meunier","brun","blanchard","giraud","joly","riviere","lucas","brunet","gaillard","barbier","arnaud","martinez","gerard","roche","renard","schmitt","roy","leroux","colin","vidal","caron","picard","roger","fabre","aubert","lemoine","renaud","dumas","lacroix","olivier","philippe","bourgeois","pierre","benoit","rey","leclerc","payet","rolland","leclercq","guillaume","lecomte","lopez","jean","dupuy","guillot","hubert","berger","carpentier","sanchez","dupuis","moulin","louis","deschamps","huet","vasseur","perez","boucher","fleury","royer","klein","jacquet","adam","paris","poirier","marty","aubry","guyot","carre","charles","renault","charpentier","menard","maillard","baron","bertin","bailly","herve","schneider","fernandez","le","gall","collet","leger","bouvier","julien","prevost","millet","perrot","daniel","le","roux","cousin","germain","breton","besson","langlois","remy","le","goff","pelletier","leveque","perrier","leblanc","barre","lebrun","marchal","weber","mallet","hamon","boulanger","jacob","monnier","michaud","rodriguez","guichard","gillet","etienne","grondin","poulain","tessier","chevallier","collin","chauvin","da","silva","bouchet","gay","lemaitre","benard","marechal","humbert","reynaud","antoine","hoarau","perret","barthelemy","cordier","pichon","lejeune","gilbert","lamy","delaunay","pasquier","carlier","laporte"]

name4 = ["", "", "1", "2", "3", "4", "5", "6", "7", "8", "9", "", "", "", "", ""]


email = random.sample(name0, 1)[0] + random.sample(name0, 1)[0] + random.sample(name0, 1)[0] + random.sample(name1, 1)[0] + random.sample(name2, 1)[0] + random.sample(name3, 1)[0] + random.sample(
    name4, 1)[0] + random.sample(name4, 1)[0] + random.sample(name4, 1)[0] + random.sample(name4, 1)[0]+'@gmail.com'

print(email)































































#__________████████_____██████
#_________█░░░░░░░░██_██░░░░░░█
#________█░░░░░░░░░░░█░░░░░░░░░█
#_______█░░░░░░░███░░░█░░░░░░░░░█
#_______█░░░░███░░░███░█░░░████░█
#______█░░░██░░░░░░░░███░██░░░░██
#_____█░░░░░░░░░░░░░░░░░█░░░░░░░░███
#____█░░░░░░░░░░░░░██████░░░░░████░░█
#____█░░░░░░░░░█████░░░████░░██░░██░░█
#___██░░░░░░░███░░░░░░░░░░█░░░░░░░░███
#__█░░░░░░░░░░░░░░█████████░░█████████
#_█░░░░░░░░░░█████_████___████_█████_█
#_█░░░░░░░░░░█______█_███__█___███_█_█
#█░░░░░░░░░░░░█___████_████____██_████
#░░░░░░░░░░░░░█████████░░░████████░░░█
#░░░░░░░░░░░░░░░░█░░░░░█░░░░░░░░░░░░█
#░░░░░░░░░░░░░░░░░░░░██░░░░█░░░░░░██
#░░░░░░░░░░░░░░░░░░██░░░░░░░███████
#░░░░░░░░░░░░░░░░██░░░░░░░░░░█░░░░░█
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
#░░░░░░░░░░░█████████░░░░░░░░░░░░░░██
#░░░░░░░░░░█▒▒▒▒▒▒▒▒███████████████▒▒█
#░░░░░░░░░█▒▒███████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█            ___       ___       ___       ___
#░░░░░░░░░█▒▒▒█▓▓▓▓██████████████████            /\  \     /\__\     /\  \     /\  \
#░░░░░░░░░██▒▒█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█               /::\  \   /:/ _/_   /::\  \   /::\  \
#░░░░░░░░░░█▒▒█▓█████████████████ ████         /\:\:\__\ /:/_/\__\ /:/\:\__\ /::\:\__\
#░░░░░░░░░░█▒▒██▓▓▒▓▒▓▒▓▒▒▒▒▒▒▒▒▓█▓▒▒▒█        \:\:\/__/ \:\/:/  / \:\ \/__/ \:\:\/  /
#░░░░░░░░░█▒▒████████▓▒███▓██▒▒▒▒▒▒▒▒▒█         \::/  /   \::/  /   \:\__\    \:\/  /
#░░░░░░░░░█▒▒▒▒▒▒▒▒▒█████████████▓█▓██           \/__/     \/__/     \/__/     \/__/
#░░░░░░░░░░████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█
#░░░░░░░░░░░░░░░░░░██████████████████
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
#██░░░░░░░░░░░░░░░░░░░░░░░░░░░██
#▓██░░░░░░░░░░░░░░░░░░░░░░░░██
#▓▓▓███░░░░░░░░░░░░░░░░░░░░█
#▓▓▓▓▓▓███░░░░░░░░░░░░░░░██
#▓▓▓▓▓▓▓▓▓███████████████▓▓█
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█
#______________________________
#___________________________
#________________________
