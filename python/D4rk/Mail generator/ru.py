import random

# My really first python program, it's very simple to use ;
# There are different dictionnaries to include all parts of an mail like "9","8","brian","3","@gmail.com" 
# then email will merge the all randomly so print the result in your cmd.


name0 = ["", "", "1", "2", "3", "4", "5", "6", "7", "8", "9", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]

name1 = ["Елена", "Ольга", "Оксана", "Ирина", "Иванна", "Маша", "Милана", "Наташа", "Таша", "Екатерина", "Юлия", "Светлана", "Елизавета", "Соня",
         "Татьяна", "Никита", "Николай", "Борис", "Владимир", "Пётр", "Андрей", "Дмитрий", "Сергей", "Алексей", "Юрий", "Артём", "Игорь", "Павел"]



name2 = [".", ".", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", ".", ".", ".", ".", ".", ".", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]

name3 = ["Абакумов", "Абалышев", "Абарников", "Абдулов", "Абдуллин", "Абрамов", "Абрамович", "Авандеев", "Авдеев", "Авдонин", "Аверин", "Аверьянов", "Авилов", "Автухов", "Агапов", "Агафонов", "Агейкин", "Аглиуллин", "Адаксин", "Ажикелямов", "Ажищенков", "Азаров", "Аксаков", "Аксёнов", "Аксенчук", "Акулов", "Алеев", "Александров", "Алексеев", "Аленин", "Алфёров", "Алёхин", "Алиев", "Алистратов", "Аллилуев", "Алогрин", "Амалиев", "Амелин", "Аминев", "Ананьев", "Анасенко", "Андреев", "Андреюшкин", "Андроников", "Андропов", "Андрюхин", "Аниканов", "Аникин",
         "Анисимов", "Анишин", "Анников", "Аносов", "Анохин", "Аношкин", "Анреп", "Антипин", "Антипов", "Антонов", "Антонович", "Апалков", "Аптекарь", "Арданкин", "Арефьев", "Арзамасцев", "Аристархов", "Аристов", "Арсеньев" "Артамонов", "Артемьев", "Артёмов", "Архипов", "Аршавин", "Асланов", "Аслаханов", "Асмик", "Аспидов", "Астанков", "Астафьев", "Астахов", "Атюшов", "Афанасьев", "Афонин", "Ахременко", "Аюшиев", "Бабанин", "Бабатьев", "Бабиков", "Бабичев", "Бабкин", "Бабурин", "Бабыкин", "Башкиров", "Бадюков", "Багров", "Бажанов", "Баженов", "Базанов", "Базаров", "Базин", "Бакрылов", "Балабанов", "Балакин", "Баландин", "Балахнов", "Балашов", "Балтабев", "Бальсунов", "Банин", "Баранов", "Барановский", "Барболин", "Баренцев", "Баринов", "Барков", "Барндык", "Барсуков", "Барышев", "Барышников", "Батищев", "Батрутдинов", "Бебнев", "Бебчук", "Белоусов", "Безбородов", "Безродный", "Безруков", "Безукладников", "Белевич", "Белибердиев", "Беликов", "Белинский", "Белов", "Белорусов", "Белоглазов", "Беломестин", "Беломестнов", "Беломестов", "Беломестный", "Беломестных", "Белочкин", "Беляков", "Бендлин" "Бенедиктов", "Бережной", "Березин", "Берия", "Бершов", "Бескрёстнов", "Беспалов", "Бессонов", "Бесфамильный", "Бехтерев", "Бирюков", "Блаженов", "Блантер", "Блатов", "Блинов", "Блоков", "Блохин", "Бобков", "Бобр", "Бобрик", "Бобров" "Богатырёв", "Богачёв", "Богданов", "Боголепов", "Боголюбов", "Богомазов", "Богомолов", "Богров", "Богун", "Бодров", "Бойдало", "Бойков", "Бойцов" "Бокарёв", "Болдаев", "Болотников", "Болтоногов", "Большаков", "Большов", "Бондарев", "Бондарчук", "Бореев", "Борзилов", "Борисюк", "Бородин", "Бортник", "Борцов", "Бочаров", "Бояров", "Брагин", "Брантов", "Брежнев", "Бугаев", "Бугайчук", "Бугаков", "Бумагин", "Бузинский", "Будаев", "Буданов", "Будников", "Будылин", "Букавицкий", "Букин", "Букирь", "Буклин", "Буков", "Булгаков", "Булыгин", "Бунин", "Буравчиков", "Бурдуковский", "Буре", "Бурков", "Бурмакин", "Буров", "Бурцов", "Бурый", "Буряков", "Бутусов", "Бутылин", "Бухало", "Быков", "Былинкин", "Бычков", "Вавилов", "Вагин", "Вазов", "Валевач", "Ванзин", "Варенников", "Варламов", "Васильев", "Васильевых", "Васин", "Васнев", "Васнецов", "Вахров", "Вахрушев", "Венедиктов", "Веденеев", "Веденин", "Ведерников", "Вергунов", "Верещагин", "Вершинин", "Веселов", "Веселовский" "Веточкин", "Ветров",
         "Викашев", "Виноградов", "Винокуров", "Витаев", "Витвинин", "Вицин", "Вихров", "Водоватов", "Водолеев", "Водянов", "Войнов", "Воликов", "Волков", "Володин", "Волошенко", "Волошин", "Волосенков", "Волченков", "Волчков", "Вольваков", "Воробьёв", "Воронин", "Воронов", "Воронков", "Воронцов", "Воскобойников", "Вотяков", "Востриков", "Вырыпаев", "Вьялицын", "Вязьмикин", "Вышедкевич", "Гавриков", "Гаврилов", "Гавриленков", "Гагарин", "Гаголин", "Галдин", "Галиаскаров", "Галимов", "Галкин", "Галыгин", "Гандельман", "Гаранин", "Гарин", "Гарифуллин", "Гачев", "Генкин", "Герасимов", "Гибазов", "Гилёв", "Глаголев", "Глазачёв", "Глазков", "Глебов", "Глинка", "Глинин", "Глоба", "Глухов", "Голов", "Головаха", "Голованов", "Головин", "Головкин", "Головченко" "Голодяев", "Голубев", "Голубкин", "Голубов", "Голубцов", "Голумбовский",
         "Гончар", "Гончаров", "Горбачёв", "Горбунков", "Горбунов", "Горев", "Горелов", "Горемыкин", "Гориславский", "Горохин", "Горохов", "Горшков", "Горюнов", "Грачёв", "Графов", "Гребенщиков", "Гремпель", "Гретченко", "Гречко", "Грешнев", "Грибанов", "Грибков", "Грибов", "Грибоедов", "Григолюк", "Григорьев", "Гринин", "Гришин", "Громов", "Громыко", "Груздев", "Грузинский", "Грушанин", "Губанов", "Гулин", "Гунин", "Гурковский", "Гуров", "Гурьев", "Гурьянов", "Гусаров", "Гусев", "Гусин", "Гусляков", "Гуськов", "Гущин", "Гелашвили", "Даньшов", "Дацюк",
         "Дорофеев", "Давыдкин", "Давыдов", "Данильцин", "Двойнев", "Дворников", "Дедов", "Деменок", "Дементьев", "Демидов", "Деникин", "Денисов",
         "Дёгтин", "Дегтярев", "Дежнёв", "Делов", "Дёмин", "Державин", "Дернов", "Десятков", "Дмитриев", "Добролюбов", "Добронравов" "Добрынин",
         "Долгоруков", "Должиков", "Домашев", "Дорохин", "Дорохов", "Достовалов", "Драгомиров", "Дресвянин", "Дрёмов", "Другаль", "Друганин", "Другов", "Дрягин", "Дубинин", "Дубинкин", "Дубов", "Дуболазов", "Дубровский", "Дудин", "Дудко", "Дудник", "Дульцев", "Думановский", "Дураничев", "Дуров", "Дурченко", "Дырбов", "Дыховичный", "Дюженков", "Дятлов", "Евдокимов", "Евсеев", "Евстигнеев", "Евтушенко", "Евтушенков", "Егоров", "Едемский", "Ежов", "Елагин", "Елешев", "Елизаров", "Елисеев", "Ельцин", "Ельцов", "Ельчуков", "Емелин", "Емельяненко", "Емельянов", "Енин", "Енотин", "Енотов", "Ерёмин", "Ерзов", "Еркулаев", "Ермаков", "Ермилов", "Ермушин", "Еромеев", "Ерофеев", "Ерохин", "Ерхов", "Ершов", "Есаулов", "Есиков", "Есипов", "Ефимов", "Ефремов", "Ешевский", "Ёжиков", "Ёжин", "Ёжов", "Ёлкин", "Ёлков", "Жабин" "Жарков", "Жарыхин", "Жвиков", "Ждан", "Жданов", "Жеглов", "Железкин", "Железнов", "Жердев", "Жернаков", "Жестакова", "Жжёнов", "Живенков", "Жиглов", "Жигунов", "Жидков", "Жикин", "Жилин", "Жилов", "Жиренков", "Жиров", "Жмакин", "Жолдин", "Жуков" "Жутов", "Журавлёв", "Журов", "Заболотный", "Заврагин", "Завражин", "Завражнов", "Завражный", "Завразин", "Завьялов", "Задорнов", "Задорожный", "Зайцев", "Закревский", "Закрятин", "Запорожец", "Заславский", "Захаров", "Захарьин", "Зарубин", "Зверев", "Зворыкин", "Звягин", "Звягинцев", "Зеленин", "Зефиров", "Зёмин", "Зимин", "Злобин", "Золин", "Золотов", "Зонов", "Зорин", "Зубарев", "Зубков", "Зубов", "Зуев", "Зуйков", "Зимняков", "Зинченко", "Зыкин", "Зыков", "Зырянов", "Зюганов", "Ибрагимов", "Иоффе", "Ивазов", "Ивакин", "Иванков", "Иванов", "Ивашин", "Ивашов", "Ивкин", "Иволгин", "Игнаткович", "Игнатьев", "Игошин", "Игумнов", "Ижутин", "Измайлов", "Изюмов", "Изотов", "Иканов", "Икашев", "Ильин", "Ильюшин", "Ильясов", "Илюхин", "Илюшкин", "Иноземцев", "Иньшов", "Ипатьев", "Исаев", "Исаков" "Элефтеров", "Элькин", "Эльмпт", "Эмануиль", "Эмин", "Эмский", "Эмских", "Энгалычев", "Энгельгардт", "Энговатов", "Энтин", "Энтский", "Эпингер", "Эрдели", "Эристов", "Эрнет", "Эсце", "Эсмонд", "Эссен", "Этуш", "Эшман", "Юбкин", "Юшкевич", "Юганцев", "Югов", "Юдачёв", "Юдашкин", "Юдин", "Юдицкий", "Юматов", "Юмашев", "Юнге", "Юневич", "Юнкин", "Юракин", "Юрасов", "Юренев", "Юрков", "Юрлов", "Юрнаев", "Юрьев", "Юсупов", "Ютилов", "Юферев", "Юханцев", "Юхтриц", "Юшаков", "Юшков", "Ювелев", "Яблоков", "Яблонев", "Яблонский", "Яговкин", "Язов", "Яйцев", "Якименко", "Якимов", "Яковлев", "Якубов", "Якубович", "Якунин", "Якушев", "Якушин", "Якупов", "Ямских", "Янаев", "Янков", "Янковский", "Янукович", "Ярмольник", "Яромеев", "Ярославский", "Ярославцев", "Ярцев", "Ярцин", "Ясенев", "Яснеев", "Яшин", "Яшкин" "Шверник", "Шевелёк", "Шелагин", "Шелепов", "Шеломов", "Шепкин", "Шеповалов", "Шереметьев", "Шерков", "Шерстов", "Шибалов", "Шигаев", "Шигин", "Шикалов", "Шинский", "Ширинов", "Ширманов",
         "Шихранов", "Шишканов", "Шишкин", "Шишлов", "Шишов", "Шипачёв", "Шкуратов", "Шлыков", "Шмагин", "Шмаков", "Шмелев", "Шпак", "Шпикалов",
         "Шубин", "Шубкин", "Шувалов", "Шугуров", "Шуйский", "Шукшин", "Шулёв", "Шуличенко", "Шульга", "Шульгин", "Шульдешов", "Шульц", "Шурупин", "Шурупов", "Шурша", "Шуршалин", "Шурыгин", "Шустелёв", "Шушалев", "Щавельский", "Щавлев", "Щегельский", "Щеглов", "Щеголев", "Щеголихин", "Щеголяев", "Щедрин", "Щедров", "Щекочихин", "Щепкин", "Щербаков", "Щербатых", "Щербина", "Щетинин", "Щеткин", "Щитт", "Щукин", "Щуров", "Эйбоженко", "Экель" "Цветков", "Цветаев", "Цвиленев", "Цедлиц", "Цейдлерин", "Цейдлиц", "Целиковский", "Цельнер", "Церетели", "Цехановецкий", "Циглер", "Циммерман", "Циолковский", "Цирюльников", "Цитников", "Цицианов", "Цуканов", "Цулукидзе", "Цыганов", "Цызырев", "Цыркунов", "Цыринский", "Чаадаев", "Чадов", "Чазов", "Чайка", "Чалый", "Чапаев", "Чеботарёв", "Чебыкин", "Чежеков", "Чекудаев", "Чекмарёв", "Челомеев", "Челомей", "Челомцев", "Челпанов", "Чемерис", "Чендев", "Чепурин", "Черенчиков", "Черепанов", "Черкасов", "Черкашин", "Чернаков",
         "Чернецкий", "Черников", "Чернобровин", "Чернов", "Черномырдин", "Чёрных", "Чернышёв", "Чернявский", "Чесноков", "Чехов", "Чиграков", "Чижиков", "Чилаев", "Чиркаш", "Чистяков", "Чистов", "Чичиков", "Чичканов", "Чкалов", "Чмыхов", "Чубаров", "Чудинов", "Чугунов", "Чудов", "Чужинов", "Чукчов", "Чукреев", "Чумаков", "Чупалов", "Чупахин", "Чупов", "Чупраков", "Чуприн", "Чупров", "Чурилов", "Чуркин", "Чучанов", "Чучумашев", "Шабалин", "Шабунин", "Шафигулин", "Шагидзянов", "Шакмаков", "Шаломенцев", "Шаляпин", "Шаповалов", "Шапошников", "Шапиро", "Шарапов", "Шаров", "Шаронов", "Шаршин", "Шастин", "Шаталов", "Шашлов", "Шведовв" "Тихвинский", "Тихомиров", "Тихоненко", "Тихонов", "Тихоход", "Ткачёв", "Ткаченко", "Токарев", "Токмаков", "Толбанов", "Толкачёв", "Толмачёв", "Толоконский", "Толстобров", "Толстокожев", "Толстой",
         "Топоров", "Топорков", "Торопов", "Торчинович", "Травкин", "Травников", "Трактирников", "Трапезников", "Тредиаковский", "Третьяков", "Трифонов", "Трофимов", "Трусов", "Трутнев", "Труфанов", "Трухин", "Трындин", "Тупицын", "Туполев", "Турбин", "Тургенев", "Туров", "Турфанов", "Тычкин", "Тюшняков", "Тюрин", "Тянников", "Убыш", "Убейсобакин", "Уваров", "Углов", "Углицкий", "Угличинин", "Уголев", "Угольников", "Удом", "Уицкий", "Уланов", "Улицкий", "Ульянин", "Ульянов", "Ульяшин", "Умаметев", "Уманов", "Умский", "Унгерн", "Унковский", "Унтилов", "Ураков", "Урбановский", "Урусов", "Усатов", "Усачёв", "Усенко", "Усилов", "Усов", "Усоев", "Успенский", "Устимович", "Устинов", "Устюжанин", "Уттеркло", "Утёсов", "Утюжин", "Ухов", "Ухтомский", "Ушаков", "Фаммус" "Строганов", "Субботин", "Суботин", "Суворин", "Суворкин", "Суворов", "Судленков", "Сунгатулин", "Сукачёв", "Сукин", "Султанов", "Супрунов", "Суриков", "Сурков", "Сурнин", "Сусоев", "Сусляков", "Суснин", "Сутулин", "Суханов", "Сухарников", "Сухих", "Сухоруков", "Сучков", "Счастливцев", "Сысоев", "Сытников", "Сычёв", "Сычкин", "Сьянов", "Сюкосев", "Табаков", "Табернакулов", "Таланов", "Талалихин", "Тамаркин", "Тамахин", "Танков", "Тарасов", "Тарновецкий", "Татаринов", "Татаринцев", "Татаров", "Татауров", "Таттар", "Таушев", "Твардовский", "Телицын", "Тёмкин", "Теплов", "Теребов", "Терехов", "Терещенко", "Терёшин", "Тетерев", "Тимофеев", "Тимошкин", "Типалов", "Титов" "Силаев", "Силиванов", "Силин", "Сильвестров", "Симакин", "Симаков", "Ситников", "Сиякаев", "Сиялов", "Сиян", "Сиянгулов", "Сиянин", "Сияница", "Сиянкин", "Сиянко", "Сиянков", "Сиянковский", "Сиянов", "Сиянович", "Сияносов", "Сиянский", "Сиянских", "Сиянцев", "Сиянчук", "Сиясинов", "Скворцов", "Скрябин", "Скоробогатов", "Скороходов", "Скуратов", "Славский", "Слепынин", "Слобожанин", "Случевский", "Смагин", "Смирнитский", "Смирнов", "Сметанин", "Смехов", "Смешной", "Смолин", "Смолянинов", "Смотров", "Снаткин", "Снегирёв", "Снетков", "Собаков", "Собачкин", "Соболев", "Соболевский", "Собчак", "Соколов", "Солдатов", "Соловьёв", "Солодников", "Солодских", "Соломахин", "Соломин", "Соломонов", "Сомов", "Сонин", "Сопов", "Сорокин", "Сочинский", "Спанов", "Справцев", "Сталин", "Стариков", "Старцев", "Староверов", "Староволков", "Стародубов", "Стародубцев", "Статник", "Стеблев", "Стегнов", "Степанов",
         "Степанков", "Степашин", "Степнов", "Стрекалов", "Стрелков", "Стрельников", "Стрельцов" "Русаков", "Русанов", "Руских", "Руснак", "Русских", "Ручкин", "Рощин", "Рыбаков", "Рыбалкин", "Рыжанов", "Рыжков", "Рыжов", "Рыков", "Рытин", "Рыченков", "Рюриков", "Рябкин", "Рябков", "Рябов", "Рябцев", "Ряхин", "Сабанцев", "Сабитов", "Савасин", "Савватимов", "Саввин", "Савинков", "Савенков", "Саврасов", "Сагадеев", "Садовский", "Садыков", "Сазонов", "Саитов", "Сай", "Сайтахметов", "Салагин", "Салко", "Салтанов", "Сальков", "Сальников", "Самарин", "Самойлов", "Самохин", "Самсонов", "Санников", "Сапалёв", "Сапогов", "Сапожников", "Сапрыкин", "Сарнычев", "Сафиюлин", "Сафронов", "Сахаров", "Саян", "Саянкин", "Саянков", "Саянов", "Саянович", "Саянский", "Свалов", "Северинов", "Северов", "Севостьянов", "Седельников", "Седов", "Селезнёв", "Селидов", "Селиванов", "Селуянов", "Семериков", "Семёнов", "Семичаевский", "Семянин", "Сенотрусов", "Сенькин", "Сергеев", "Серебров", "Серебряков", "Серёгин", "Серов", "Серпионов", "Сеченов", "Сёмин", "Сиваков", "Сигаев", "Сигачёв", "Сидоров", "Сизов", "Сизый" "Прибылов", "Привалов", "Примаков", "Приходько", "Пронин", "Проничев", "Протасов", "Прохоров", "Проскуряков", "Пугачёв", "Пугин", "Пудин", "Пузаков", "Пузанов", "Путилин", "Путилов", "Путин", "Путинов", "Путятин", "Пушкарёв", "Пушкин", "Пушной", "Пшеничников", "Пыжалов", "Пырьев", "Пьяных", "Пятосин", "Рабинович", "Радостин", "Разин", "Разуваев", "Райт", "Рамазанов", "Распопов", "Распутин", "Рассказов", "Расторгуев", "Ревягин", "Ревякин", "Ремизов", "Репин", "Ретюнских", "Решетилов", "Решетников", "Рязанцев", "Ржевский", "Рогачёв", "Рогов", "Рогозин", "Родзянко", "Родин", "Рожков", "Розанов", "Рокоссовский", "Романов", "Ростов", "Ростовцев", "Рубашкин", "Ругов", "Рудавин", "Рудин",
         "Рудов", "Рудников", "Румянцев", "Рунов" "Огородников", "Огурцов", "Озеров", "Оленев", "Ольховский", "Онегин", "Онипченко", "Опокин", "Опринчук", "Орлов", "Осенных", "Осин", "Осинов", "Осинцев", "Осминин", "Осокин", "Осолодкин", "Остальцев", "Остапюк", "Островерхов", "Островский", "Ошурков", "Павленко", "Павлов", "Палюлин", "Панарин", "Панин", "Панкин", "Панков", "Панкратов", "Панфилов", "Папанов", "Парамонов", "Паршиков", "Паршин", "Пастух", "Пасхин", "Патрушев", "Паулкин", "Пахомов", "Пашин", "Пашков", "Пелевин", "Пелёвин", "Пенкин", "Первак", "Перевалов", "Переверзев", "Перевёртов", "Пересторонин", "Пережогин", "Перехваткин", "Перминов", "Пермяков", "Перов", "Перфильев", "Первышин", "Пестунов", "Пестов", "Петров", "Петрухин", "Петухов", "Печеников", "Печкин", "Печурский", "Пивоваров", "Пименов", "Пирогов", "Пирожков", "Питосин", "Пичугин", "Пичушкин", "Пищальников", "Плаксин", "Платонов", "Плеханов", "Племянников", "Плотников", "Погодин", "Погодов", "Погребнов", "Пода", "Подшивалов", "Пожарский", "Поздняков", "Покровский", "Поливанов", "Поличев", "Полищук", "Половцев", "Полотенцев", "Полтанов", "Полторак", "Полунин", "Полушин", "Поляков", "Помелов", "Помельников", "Пондяков", "Поникаров", "Пономарёв", "Пончиков", "Попов", "Попырин", "Портнов", "Посохов", "Потапов", "Потёмкин", "Потрепалов", "Праздников", "Преображенскийв" "Михалицин", "Михалицын", "Михеев", "Мишнев", "Мишутин", "Можаев", "Моисеев", "Молчанов", "Моня", "Мордвинов", "Моренов", "Морозов", "Морошкин", "Моряков", "Мосалев", "Мосин", "Москвин", "Мосяков", "Мохов", "Муравьёв", "Муратов", "Мурогов", "Муханов", "Мухин", "Мухов", "Мухоморов", "Мухортов", "Мышелов", "Мышкин", "Мягков", "Мясников", "Мятлев", "Мяукин", "Набатов", "Назаров", "Нардин", "Насонов", "Науменко", "Наумов", "Невзоров", "Неделяев", "Нежданов", "Некрестьянов", "Немцев", "Немцов", "Ненашев", "Непеин", "Нестеров", "Нечаев", "Низамутдинов", "Никитин", "Никифоров", "Никишин", "Николаев", "Никонов", "Никулин", "Некрасов", "Нуртдинов", "Новиков", "Новичков", "Новокшонов", "Новосельцев", "Ноздрёв", "Ноздрин", "Норин", "Носачёв", "Носков", "Носов", "Нуриев", "Оболенский", "Оборин", "Образцова", "Обухов", "Овечкин" "Лягушкин", "Лягушов", "Лялюшкин", "Лямин", "Ляпин", "Лясин", "Мадулин", "Мажулин", "Майсак", "Макаров", "Маклаков", "Максимов", "Максимушкин", "Максудов", "Максутов", "Малахов", "Маленьких", "Маликов", "Малинин", "Малинов", "Малкин", "Малышев", "Малыхин", "Мальчиков", "Малюгин", "Мамин", "Мамонов", "Мамыкин", "Манин", "Манторов", "Манякин", "Марин", "Маринин", "Маринкин", "Маринов", "Маркин", "Марков", "Мартынов", "Мартюшев", "Маслак", "Маслов", "Масмех", "Масмехов", "Матвеев", "Махмудов", "Машарин", "Машир", "Медведев", "Медведков", "Медников", "Меледин", "Мелехов", "Меликов", "Мельников", "Меншиков", "Менщиков", "Меркушев", "Меркулов", "Месяц", "Механтьев", "Мещеряков", "Мишарин", "Мигунов", "Мизенов",
         "Милехин", "Милорадов", "Милюков", "Милютин", "Минаев", "Минеев", "Минин", "Минкин", "Мирнов", "Миров", "Миронов", "Мирохин", "Мисалов", "Митин", "Митрофанов", "Михайлов", "Михалев" "Кутиков", "Кваша", "Кутяков", "Кутузов", "Кварталнов", "Лаврентьев", "Лавров", "Лагошин", "Лагранский", "Лагутов", "Лазарев", "Ланцов", "Лапаев", "Лапидус", "Лапин", "Лапотников", "Лаптев", "Лапунов", "Лапухов", "Ларин", "Ларионов", "Ласкутин", "Лачинов", "Лачков", "Лебедев", "Лебединский", "Лебединцев", "Левин", "Левкин", "Легкодимов", "Ледовской", "Лелух", "Лель", "Леонидов", "Леонов", "Лепёхин", "Лесков", "Лесничий", "Летов", "Лешев", "Лещёв", "Лёвкин", "Лидин", "Лилов", "Лимонов", "Липин",
         "Липов", "Лисицын", "Лисов", "Листунов", "Лихачёв", "Лобан", "Лобанов", "Лобачёв", "Лобов", "Ловзанский", "Логинов", "Логиновский", "Локтев", "Локтионов", "Ломовцев", "Ломоносов", "Ломтев", "Лопатин", "Лосев", "Лосевский", "Лоскутников", "Лоскутов", "Лощилов", "Лубашев", "Лужков", "Лукин", "Луков", "Лукьяненко", "Лукьянов", "Лызлов", "Лыткин", "Львов", "Любимов", "Любимцев", "Любов", "Лютенков", "Лютов" "Курьянов", "Краев", "Краевский", "Краснов", "Красноперов", "Красоткин", "Кривков", "Кривов", "Кривоухов", "Кропанин", "Кругликов", "Круглов", "Крупин", "Крупнов", "Крутиков", "Крутин", "Крутов", "Крутой", "Кручинкин", "Крылов", "Крымов", "Крысанов", "Крысов", "Крюков", "Крючков", "Кубланов", "Кубышкин", "Куваев", "Кудашов", "Кудрин", "Кудрявцев", "Кудряшов", "Куляш", "Кулёмин", "Кузнецов", "Кузубов", "Кузькин", "Кузьмин", "Кузьмич", "Куимов", "Куклачёв", "Куклев", "Куклин", "Куклов", "Кулагин", "Кулаков", "Кулибин", "Куликов", "Купцов", "Куракин", "Курбатов", "Курганов", "Курдин", "Курепин", "Курицын", "Курочкин", "Курпатов", "Курсалин", "Курташкин", "Кучин", "Курчин", "Кутепов" "Кицын", "Кирьянов", "Клепахов", "Климов", "Климушин", "Климцов", "Клоков", "Князев", "Ковалевский", "Коваленко", "Ковалёв", "Ковров", "Ковшевников", "Ковшутин", "Кожуров", "Кожухов", "Козаков", "Козарь", "Козлов", "Козловский", "Козырев", "Койчев", "Колесников", "Коллеров", "Колобков", "Коломников", "Колонтаев", "Колосов", "Кольцов", "Комаров", "Комзин", "Комиссаров", "Комолов", "Кондратьев", "Кондуров", "Кондюрин", "Конев", "Конников", "Коновалов", "Коньяков", "Коняшев", "Копейкин", "Копцев", "Кораблёв", "Кораблин", "Коренев", "Коренёв", "Коржаков", "Коржев", "Корнев", "Корнеев", "Корнилов", "Коровин", "Королёв", "Коротаев", "Короткин", "Кортнев", "Корчагин", "Корявин", "Корявов", "Косарёв", "Косков", "Косма", "Косомов", "Косоруков", "Костин", "Костомаров", "Косяк", "Котов", "Коченков", "Кочерёжкин", "Кошелев", "Кошечкин", "Кошкин", "Кошков", "Кравчук" "Исмайлов", "Истомин", "Ишутин", "Кабанов", "Кабинов", "Каблуков", "Кайгородов", "Каверин", "Кадников", "Кадцын", "Казаков", "Казанцев", "Казаньков", "Казарезов", "Калагин", "Калашник", "Калганов", "Калимулин", "Калинин", "Калугин",
         "Калягин", "Каменский", "Каменских", "Камкин", "Канадин", "Канадов", "Канадцев", "Каналин", "Кандинский", "Капица", "Капралов", "Каприянов", "Капустин", "Капустов", "Капылюшный", "Караваев", "Карамнов", "Карандашов", "Карантиров", "Караулин", "Караулов", "Карбаинов", "Каргин",
         "Карев", "Каретников", "Каржов", "Кариев", "Карнаухов", "Карташёв", "Карташов", "Карчагин", "Карявин", "Касатый", "Касьяненко", "Касьянов", "Катаев", "Катериночкин", "Катин", "Качусов", "Кашарин", "Каширин", "Кашканов", "Кашников", "Кедров", "Кетов", "Килессо", "Киприянов", "Кирдань", "Киреев", "Кирилишен", "Кириллов", "Кирилловский", "Кирилов", "Кирсанов"]


name4 = ["", "", "1", "2", "3", "4", "5", "6", "7", "8", "9", "", "", "", "", ""]


email = random.sample(name0, 1)[0] + random.sample(name0, 1)[0] + random.sample(name0, 1)[0] + random.sample(name1, 1)[0] + random.sample(name2, 1)[0] + random.sample(name3, 1)[0] + random.sample(
    name4, 1)[0] + random.sample(name4, 1)[0] + random.sample(name4, 1)[0] + random.sample(name4, 1)[0]+'@bk.ru'

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
