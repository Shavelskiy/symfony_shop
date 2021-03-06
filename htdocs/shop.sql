-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: db    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `activity` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'ASUS',500,1),(2,'GIGABYTE',500,1),(3,'MSI',500,1),(4,'ASRock',500,1),(5,'Crucial',500,1),(6,'Kingston',500,1),(7,'AMD',500,1),(8,'Sapphire',500,1),(9,'Palit',500,1),(10,'Intel',500,1),(11,'Seagate',500,1),(12,'Western Digital',500,1),(13,'SanDisk',500,1),(14,'Samsung',500,1),(15,'Silicon Power',500,1),(16,'Toshiba',500,1);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `activity` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Материнские платы',200,1),(2,'Оперативная память',300,1),(3,'Видеокарты',400,1),(4,'Процессоры',100,1),(5,'Жёсткие диски и SSD',500,1),(10,'Вложенность',500,1),(11,'Уровень1_1',500,1),(13,'Уровень1_2',500,1),(14,'мат_платы',500,1),(15,'Уровень1_1_еще',500,1),(16,'Уровень1_1_еще_2',500,1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration_versions` (
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_versions`
--

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
INSERT INTO `migration_versions` VALUES ('20181120084824');
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `activity` tinyint(1) NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preview_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`),
  KEY `IDX_D34A04AD44F5D008` (`brand_id`),
  CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_D34A04AD44F5D008` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,4,'ASRock H81M-VG4 R2.0',2750,500,1,'1542800014.jpeg','Материнская плата Asrock H81M-VG4 R2.0 оснащена надежными компонентами и поддерживает процессоры Intel для сокета LGA 1150. Она имеет 2 сокета под DDR3-память частотой до 1600 МГц. Устройство оснащено различными интерфейсами, среди которых PCI-Еx16 и PCI-Еx1 2.0.','Материнская плата Asrock H81M-VG4 R2.0 оснащена надежными компонентами и поддерживает процессоры Intel для сокета LGA 1150. Она имеет 2 сокета под DDR3-память частотой до 1600 МГц. Устройство оснащено различными интерфейсами, среди которых PCI-Еx16 и PCI-Еx1 2.0.\r\nМодель Asrock H81M-VG4 R2.0 поддерживает аудио 5.1 HD, что обеспечивается аудиокодеком ALC662. Также на плате установлен сетевой контроллер Realtek Gigabit LAN. Благодаря технологии Full Spike Protection она обладает надежной защитой компонентов от скачков напряжения.',6729612),(2,1,4,'ASRock H81M-VG4 R2.0',2750,500,0,'1542800591.jpeg','Материнская плата Asrock H81M-VG4 R2.0 оснащена надежными компонентами и поддерживает процессоры Intel для сокета LGA 1150. Она имеет 2 сокета под DDR3-память частотой до 1600 МГц.','Материнская плата Asrock H81M-VG4 R2.0 оснащена надежными компонентами и поддерживает процессоры Intel для сокета LGA 1150. Она имеет 2 сокета под DDR3-память частотой до 1600 МГц. Устройство оснащено различными интерфейсами, среди которых PCI-Еx16 и PCI-Еx1 2.0.\r\nМодель Asrock H81M-VG4 R2.0 поддерживает аудио 5.1 HD, что обеспечивается аудиокодеком ALC662. Также на плате установлен сетевой контроллер Realtek Gigabit LAN. Благодаря технологии Full Spike Protection она обладает надежной защитой компонентов от скачков напряжения.',6729612),(3,1,2,'GIGABYTE GA-F2A68HM-S1',2850,500,1,'1542800595.jpeg','Материнская плата GIGABYTE GA-F2A68HM-S1 – модель типоразмера Micro-ATX, созданная на основе многообещающего чипсета А68Н и процессорного сокета FM2+. Плата обладает нативной поддержкой интерфейсов USB 3.0 и SATA 3.0, а также поддержкой SATA RAID.','Материнская плата GIGABYTE GA-F2A68HM-S1 – модель типоразмера Micro-ATX, созданная на основе многообещающего чипсета А68Н и процессорного сокета FM2+. Плата обладает нативной поддержкой интерфейсов USB 3.0 и SATA 3.0, а также поддержкой SATA RAID. На борту платы имеются 2 DIMM-разъема для памяти DDRIII, слоты расширения PCI, PCI-Ex16, PCI-Ex1 и разъемы питания. Панель ввода/вывода на задней стороне платы располагает видеовыходом D-SUB, парой портов PS/2, аудиовыходами, гнездом RJ-45, а также портами USB-2 и USB-3. \r\nМодель GA-F2A68HM-S1 также поддерживает ряд дополнений от производителя, таких как многофункциональная защита от статики, перепадов напряжения и влажности, технологию ускоренной зарядки устройств через USB-порт и утилиту Q-Flash для обновления прошивки BIOS. Высокую производительность устройству обеспечивают долговечные твердотельные конденсаторы с повышенным сроком службы.',1007211),(4,1,3,'MSI A68HM-E33 V2',2850,500,1,'1542800599.jpeg','Материнская плата MSI A68HM-E33 V2 – это модель форм-фактора microАТХ, который определяет ее габариты и, как следствие, подходящие для установки компьютерные устройства. Устройство предназначено для взаимодействия с процессорами AMD.','Материнская плата MSI A68HM-E33 V2 – это модель форм-фактора microАТХ, который определяет ее габариты и, как следствие, подходящие для установки компьютерные устройства. Устройство предназначено для взаимодействия с процессорами AMD. Имеется UEFI BIOS, который расширяет возможности платы благодаря поддержке жестких дисков объемом свыше двух терабайт, наличию графического интерфейса и пр. Два слота для памяти типа DDR3 позволяют обеспечить быстродействие ПК. 8 USB-портов на плате дают возможность подключить сразу несколько внешних устройств.\r\nИмеется порт Ethernet, который способствует проводному выходу в локальную сеть или Интернет. Особенностью материнской платы MSI A68HM-E33 V2 является высокая степень безопасной работы прибора. Конструкция содержит защиту от влажности и электромагнитных помех. Благодаря разъему для вентилятора 4-pin происходит самостоятельное управление скоростью охлаждения, которая зависит от температуры внутри системного блока.',1028286),(5,1,3,'MSI A68HM-P33 V2',2950,500,1,'1542800603.jpeg','Плата MSI Socket-FM2+ A68HM-P33 V2 продолжает традиции серии на базе чипсета AMD A68H. Устройство несет на себе 2 слота памяти DDR3, работающей в двухканальном режиме. Чипсет обеспечивает поддержку центральных процессоров производства AMD под управлением сокета FM2 и FM2+. Интерфейс SATA 3.0 с 4 разъемами для подключения носителей информации с их последующим объединением в RAID создан для работы с информацией на высокой скорости доступа.','Плата MSI Socket-FM2+ A68HM-P33 V2 продолжает традиции серии на базе чипсета AMD A68H. Устройство несет на себе 2 слота памяти DDR3, работающей в двухканальном режиме. Чипсет обеспечивает поддержку центральных процессоров производства AMD под управлением сокета FM2 и FM2+. Интерфейс SATA 3.0 с 4 разъемами для подключения носителей информации с их последующим объединением в RAID создан для работы с информацией на высокой скорости доступа.\r\nИнтегрированный 8-канальный HDA кодек Realtek ALC887 позволит подключить к плате гарнитуру или наушники. Коммуникацию MSI Socket-FM2+ A68HM-P33 V2 с сетью обеспечит Gbit-контроллер Realtek RTL8111G. Плата оборудуется пассивным охлаждением чипа BIOS для предотвращения повреждения комплекта микропрограмм.',1028287),(6,1,2,'GIGABYTE GA-H61M-S2PV',4950,500,1,'1542803410.jpeg','Материнская плата GIGABYTE GA-H61M-S2PV H61 предназначена преимущественно для установки на офисных компьютерах, так как имеет модель чипсета H61. Благодаря сокету LGA 1155 поддерживаются многие серии процессоров Intel 3-го поколения.','Материнская плата GIGABYTE GA-H61M-S2PV H61 предназначена преимущественно для установки на офисных компьютерах, так как имеет модель чипсета H61. Благодаря сокету LGA 1155 поддерживаются многие серии процессоров Intel 3-го поколения. Слоты памяти DDR3 имеют максимальную частоту до 1333 МГц и объем 16 ГБ, чего вполне достаточно для комфортной работы. Поддержка технологии GIGABYTE On/Off Charge обеспечивает быстрый заряд смартфонов.\r\nGIGABYTE GA-H61M-S2PV H61 оснащена 4 портами SATA. Также имеется отдельный интерфейс LPT, используемый в основном для подключения принтера или сканера. Для установки видеокарты производители позаботились об оснащении платы слотом PCI-E x16. На задней панели также расположились порты видеовыхода D-Sub и DVI-D. Встроенная звуковая карта поддерживает все 8 основных каналов звучания. Форм-фактор microATX обусловил габариты 244х200 мм.',143524),(7,1,4,'ASRock Fatal1ty B250 Gaming K4',8299,500,1,'1542803638.jpeg','Материнская плата ASRock Fatal1ty B250 Gaming K4 для процессоров Intel с сокетом LGA 1151 подарит улучшенные характеристики производительности вашему ПК.','Материнская плата ASRock Fatal1ty B250 Gaming K4 для процессоров Intel с сокетом LGA 1151 подарит улучшенные характеристики производительности вашему ПК. Основанная на чипсете Intel B250, плата поддерживает интерфейс BIOS UEFI, позволяющий упростить настройку параметров. Модель поддерживает память DDR4-2400 МГц, для модулей которой отведено четыре слота. Для улучшения сетевого соединения используется сетевой модуль Intel LAN: он гарантирует повышение стабильности низкий показатель загрузки CPU, улучшенную скорость.\r\nASRock Fatal1ty B250 Gaming K4 оборудована двумя разъемами PCI-Ex16, укрепленными сталью, что способствует исключению интерференции сигнала подключенных видеокарт. Даже тяжелые видеокарты будут максимально надежно в них установлены. Для подключения SSD плата три разъема M.2. Модель относится к форм-фактору Standard-ATX и поддерживает звуковую схему аудио 7.1.',1108215),(8,1,4,'ASRock H310M-G/M.2',4699,500,1,'1542803743.jpeg','Материнская плата ASROCK H310M-G/M.2 оптимальна для использования в производительной рабочей станции.','Материнская плата ASROCK H310M-G/M.2 оптимальна для использования в производительной рабочей станции. Благодаря соответствию форм-фактору Micro-ATX, модель может быть установлена в компактный корпус. Материнская плата изготовлена на базе чипсета Intel H310, и предназначена для установки процессоров Intel (LGA 1151v2). Вы сможете установить до 32 ГБ памяти DDR4 с частотой до 2400 МГц. Также плата оснащена слотом M.2.',1232371),(9,2,5,'Crucial CT8G4DFS824A',5180,500,1,'1542804447.jpeg','Увеличьте объем оперативной памяти вашего персонального компьютера с помощью модуля памяти CT8G4DFS824A от компании Crucial.','Увеличьте объем оперативной памяти вашего персонального компьютера с помощью модуля памяти CT8G4DFS824A от компании Crucial.',4356194),(10,2,7,'AMD R534G1601U1S-U(O)',1870,500,1,'1542804543.jpeg','Хорошая стабильная память. Широкая совместимость с платами разных производителей. Скорее всего хорошо оттестированная. Так что риск получить брак не большой. Не для разгона. Хорошо пойдет для систем на платформах AMD','Хорошая стабильная память. Широкая совместимость с платами разных производителей. Скорее всего хорошо оттестированная. Так что риск получить брак не большой. Не для разгона. Хорошо пойдет для систем на платформах AMD',481452),(11,2,6,'Kingston KVR24N17S6/4',2740,500,1,'1542804621.jpeg','Модули памяти Kingston проектируются, производятся и тщательно тестируются с учетом точных технических характеристик каждой конкретной брендированной компьютерной системы. Модули имеют гарантированную совместимость, пожизненную гарантию и отличаются легендарной надежностью Kingston.','Модули памяти Kingston проектируются, производятся и тщательно тестируются с учетом точных технических характеристик каждой конкретной брендированной компьютерной системы. Модули имеют гарантированную совместимость, пожизненную гарантию и отличаются легендарной надежностью Kingston.',4396735),(12,2,6,'Kingston HyperX Fury Black, HX426C16FB2/8',5380,500,1,'1542804698.jpeg','Разработанный и протестированный по высшему классу быстродействия, модуль памяти Kingston HyperX легко удовлетворяет самым жестким требованиям любого креативного профессионала, геймера или энтузиаста ПК.','Разработанный и протестированный по высшему классу быстродействия, модуль памяти Kingston HyperX легко удовлетворяет самым жестким требованиям любого креативного профессионала, геймера или энтузиаста ПК.',4244600),(13,2,5,'Crucial CT4G4DFS824A',2660,500,1,'1542804777.jpeg','Увеличьте объем оперативной памяти вашего персонального компьютера с помощью модуля памяти CT4G4DFS824A от компании Crucial.','Увеличьте объем оперативной памяти вашего персонального компьютера с помощью модуля памяти CT4G4DFS824A от компании Crucial.',4308793),(14,2,6,'Kingston HyperX Fury Black, HX426C16FB2K2/16',11190,500,1,'1542804847.jpeg','Разработанные и протестированные по высшему классу быстродействия, модули памяти Kingston HyperX легко удовлетворяют самым жестким требованиям любого креативного профессионала, геймера или энтузиаста ПК.','Разработанные и протестированные по высшему классу быстродействия, модули памяти Kingston HyperX легко удовлетворяют самым жестким требованиям любого креативного профессионала, геймера или энтузиаста ПК.',4214677),(15,2,6,'Kingston HyperX FURY black, HX316C10FB/8',4950,500,1,'1542804908.jpeg','Разработанные и протестированные по высшему классу быстродействия, модули памяти Kingston HyperX легко удовлетворяют самым жестким требованиям любого креативного профессионала, геймера или энтузиаста ПК.','Разработанные и протестированные по высшему классу быстродействия, модули памяти Kingston HyperX легко удовлетворяют самым жестким требованиям любого креативного профессионала, геймера или энтузиаста ПК.',767342),(16,3,1,'ASUS GeForce® GTX 1050 Ti, PH-GTX1050TI-4G, 4ГБ, GDDR5, Retail',12340,500,1,'1542805510.jpeg','Каждый заслуживает отличного игрового процесса. Вот почему ASUS создала видеокарту PH-GTX1050TI-4G.','Каждый заслуживает отличного игрового процесса. Вот почему ASUS создала видеокарту PH-GTX1050TI-4G. Теперь вы можете превратить свой ПК в игровой, на основе NVIDIA Pascal, самой технически продвинутой архитектуре GPU в истории. Видеокарты серии GeForce GTX 10 созданы на основе архитектуры Pascal и обеспечивают увеличение производительности до 3-х раз по сравнению с видеокартами предыдущего поколения, а также они поддерживают новые игровые технологии.',4101820),(17,3,2,'Gigabyte GeForce® GTX 1060, GV-N1060WF2OC-6GD, 6ГБ, GDDR5, Retail',20470,500,1,'1542805511.jpeg','Видеокарта Gigabyte GV-N1060WF2OC-6GD оснащена инновационными игровыми технологиями, что делает ее идеальном выбором для самых современных игр в высоком разрешении.','Видеокарта Gigabyte GV-N1060WF2OC-6GD оснащена инновационными игровыми технологиями, что делает ее идеальном выбором для самых современных игр в высоком разрешении. Видеокарта Gigabyte GV-N1060WF2OC-6GD создана на основе архитектуры NVIDIA Pascal, самой технически продвинутой архитектуры GPU из когда-либо созданных. Она обеспечивает высочайшую производительность, которая открывает дорогу к VR-играм и другим возможностям.',3949645),(18,3,9,'Palit GeForce GTX 1050 Ti, PA-GTX1050 Ti Dual OC 4G, 4ГБ, GDDR5, Retail',12370,500,1,'1542805520.jpeg','Каждый заслуживает отличного игрового процесса. Вот почему Palit создала видеокарту PA-GTX1050 Ti Dual OC 4G. Теперь вы можете превратить свой ПК в игровой, на основе NVIDIA Pascal, самой технически продвинутой архитектуре GPU в истории.','Каждый заслуживает отличного игрового процесса. Вот почему Palit создала видеокарту PA-GTX1050 Ti Dual OC 4G. Теперь вы можете превратить свой ПК в игровой, на основе NVIDIA Pascal, самой технически продвинутой архитектуре GPU в истории. Видеокарты серии GeForce GTX 10 созданы на основе архитектуры Pascal и обеспечивают увеличение производительности до 3-х раз по сравнению с видеокартами предыдущего поколения, а также они поддерживают новые игровые технологии.',4081241),(19,3,8,'Sapphire 11265-07-20G, RX 580, 4ГБ, GDDR5, Retail',17300,500,1,'1542805793.jpeg','Видеокарта Sapphire 11265-07-20G создана на основе архитектуры Polaris от AMD, которая совмещает технологический процесс 14-нм FinFET и продвинутые технологии управления питанием и частотами от AMD для обеспечения минимального шума и приемлемых температур во время игры.','Видеокарта Sapphire 11265-07-20G создана на основе архитектуры Polaris от AMD, которая совмещает технологический процесс 14-нм FinFET и продвинутые технологии управления питанием и частотами от AMD для обеспечения минимального шума и приемлемых температур во время игры. В сочетании с технологией AMD LiquidVR видеокарта Sapphire 11265-07-20G предоставляет комфортный и реалистичный опыт при использовании систем виртуальной реальности (VR). Поддержка асинхронных шейдеров и новые возможности обработки геометрии обеспечивают продвинутую поддержку DirectX 12 и API Vulkan в лучшей на сегодняшний день версии архитектуры Graphics Core Next.',4236954),(20,3,2,'Gigabyte GeForce® RTX 2080, GV-N2080GAMING OC-8GC, 8ГБ, GDDR6, Retail',63490,500,1,'1542805807.jpeg','Видеокарта GIGABYTE GEFORCE RTX 2080 GAMING OC 8G является мощнейшим представителем последнего поколения. Она создана на базе новейшей архитектуры NVIDIA TURING и обеспечивает невероятный уровень игрового реализма.','Видеокарта GIGABYTE GEFORCE RTX 2080 GAMING OC 8G является мощнейшим представителем последнего поколения. Она создана на базе новейшей архитектуры NVIDIA TURING и обеспечивает невероятный уровень игрового реализма. Модель RTX 2080 до шести раз производительнее видеокарт предыдущего поколения и привносит в игры технологии искусственного интеллекта и трассировки лучей в реальном времени. Продуманная система охлаждения позволит забыть о повышенных температурах и высоком уровне шума. Встроенная светодиодная подсветка придает видеокарте потрясающий внешний вид.',4441837),(21,3,8,'Sapphire 11266-36-20G, RX 570, 8ГБ, GDDR5, Retail',14460,500,1,'1542805819.jpeg','Созданная на основе перспективной архитектуры Polaris видеокарта SAPPHIRE Radeon RX570 плавно отображает игровой процесс, начиная с новейших игр, и заканчивая самыми популярными, графически насыщенными проектами.','Созданная на основе перспективной архитектуры Polaris видеокарта SAPPHIRE Radeon RX570 плавно отображает игровой процесс, начиная с новейших игр, и заканчивая самыми популярными, графически насыщенными проектами.',4401049),(22,3,8,'Sapphire 11265-09-20G, RX 580, 4ГБ, GDDR5, Retail',16110,500,1,'1542805980.jpeg','Видеокарта Sapphire 11265-09-20G создана на основе архитектуры Polaris от AMD, которая совмещает технологический процесс 14-нм FinFET','Видеокарта Sapphire 11265-09-20G создана на основе архитектуры Polaris от AMD, которая совмещает технологический процесс 14-нм FinFET и продвинутые технологии управления питанием и частотами от AMD для обеспечения минимального шума и приемлемых температур во время игры. В сочетании с технологией AMD LiquidVR видеокарта Sapphire 11265-09-20G предоставляет комфортный и реалистичный опыт при использовании систем виртуальной реальности (VR). Поддержка асинхронных шейдеров и новые возможности обработки геометрии обеспечивают продвинутую поддержку DirectX 12 и API Vulkan в лучшей на сегодняшний день версии архитектуры Graphics Core Next.',4249237),(23,3,9,'Palit GeForce® GTX 1080 Ti, PA-GTX1080TI GameRock 11G, 11ГБ, GDDR5X, Retail',58470,500,1,'1542805994.jpeg','Palit PA-GTX1080TI GameRock 11G - это новая флагманская игровая видеокарта NVIDIA, созданная на основе архитектуры NVIDIA Pascal. Последнее пополнение линейки мощных игровых видеокарт, GeForce GTX 1080 Ti обладает экстремальной игровой производительностью, имеет память GDDR5X нового поколения с пропускной способностью 11 Гбит/с и фреймбуфер объемом 11 ГБ.','Palit PA-GTX1080TI GameRock 11G - это новая флагманская игровая видеокарта NVIDIA, созданная на основе архитектуры NVIDIA Pascal. Последнее пополнение линейки мощных игровых видеокарт, GeForce GTX 1080 Ti обладает экстремальной игровой производительностью, имеет память GDDR5X нового поколения с пропускной способностью 11 Гбит/с и фреймбуфер объемом 11 ГБ. PA-GTX1080TI GameRock 11G обеспечивает великолепный геймплей с захватывающей графикой и звуковым сопровождением, гарантируя совершенно новый уровень игрового процесса. Игровая серия Palit GameRock создана для требовательных игроков, предпочитающих максимальные графические настройки. В видеокартах серии используются лучшие игровые технологии, максимально эффективные системы охлаждения и высококачественные компоненты. С GameRock каждый пользователь может стать игровой рок-звездой.',4282531),(24,4,10,'Intel Core i3-8100, BOX',12110,500,1,'1542806840.jpeg','Процессор для настольных персональных компьютеров, основанных на платформе Intel.','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',4328182),(25,4,10,'Intel Core i5-7400, BOX',15590,500,1,'1542806854.jpeg','Процессор для настольных персональных компьютеров, основанных на платформе Intel.','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',4078233),(26,4,10,'Intel Core i5-8400, BOX',18490,500,1,'1542806863.jpeg','Процессор для настольных персональных компьютеров, основанных на платформе Intel.','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',4335669),(27,4,7,'AMD FX-6300 Black Edition, OEM',4020,500,1,'1542806876.jpeg','Процессор для настольных персональных компьютеров, основанных на платформе AMD.','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',377181),(28,4,10,'Intel Core i3-7100, BOX',11640,500,1,'1542806888.jpeg','Процессор для настольных персональных компьютеров, основанных на платформе Intel.','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',4112830),(29,4,7,'AMD FX-4300 Black Edition, OEM',3280,500,1,'1542807046.jpeg','Процессор для настольных персональных компьютеров, основанных на платформе AMD.','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',377176),(30,4,7,'AMD RYZEN 5 2600, BOX',13390,500,1,'1542807146.jpeg','Революционные интеллектуальные процессоры AMD Ryzen призваны обеспечить максимальную производительность обработки данных. Новейшая революционная технология многопоточной обработки данных от компании AMD обеспечивает великолепную производительность для работы и игр.','Революционные интеллектуальные процессоры AMD Ryzen призваны обеспечить максимальную производительность обработки данных. Новейшая революционная технология многопоточной обработки данных от компании AMD обеспечивает великолепную производительность для работы и игр.',4410132),(31,4,10,'Intel Core i5-8400, OEM',18550,500,1,'1542807278.jpeg','Процессор для настольных персональных компьютеров, основанных на платформе Intel.','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',4335653),(32,4,10,'Intel Pentium G4560, BOX',7310,500,1,'1542807287.jpeg','Процессор для настольных персональных компьютеров, основанных на платформе Intel.','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',4113040),(33,5,11,'жесткий диск HDD 4TБ, Seagate BarraCuda, ST4000DM004',7580,500,1,'1542808440.jpeg','Диски BarraCuda - лидеры рынка накопителей для настольных и портативных ПК по вместительности. В их ассортименте представлены модели разной емкости (до 10 ТБ включительно), так что каждый клиент сможет выбрать накопитель BarraCuda себе по карману.','Диски BarraCuda - лидеры рынка накопителей для настольных и портативных ПК по вместительности. В их ассортименте представлены модели разной емкости (до 10 ТБ включительно), так что каждый клиент сможет выбрать накопитель BarraCuda себе по карману. Помимо емкости, мощные BarraCuda отличаются скоростью вращения шпинделя 7200 об/мин, обеспечивающей высокую производительность, молниеносную загрузку игр и поддержку высоких рабочих нагрузок.',4307716),(34,5,11,'жесткий диск HDD 4ТБ, Seagate IronWolf, ST4000VN008',8900,500,1,'1542808445.jpeg','Накопитель IronWolf создан для хранилищ NAS. Он обеспечивает постоянную работу и поддерживает технологию AgileArray, гарантирующую гибкость и надежность системы. Многопользовательская технология и высокий лими','Накопитель IronWolf создан для хранилищ NAS. Он обеспечивает постоянную работу и поддерживает технологию AgileArray, гарантирующую гибкость и надежность системы. Многопользовательская технология и высокий лимит рабочей нагрузки обеспечивают производительность и масштабируемость, необходимые для успеха вашего предприятия.',4081936),(35,5,12,'жесткий диск HDD 1ТБ, Western Digital Blue, WD10EZEX',3060,500,1,'1542808457.jpeg','Устройство хранения информации.','Устройство хранения информации.',332498),(36,5,11,'жесткий диск HDD 2ТБ, Seagate BarraCuda, ST2000DM006',4350,500,1,'1542808462.jpeg','Увеличьте емкость вашего ПК с помощью накопителя Seagate BarraCuda ST2000DM006, предназначенного специально для настольных и моноблочных компьютеров.','Увеличьте емкость вашего ПК с помощью накопителя Seagate BarraCuda ST2000DM006, предназначенного специально для настольных и моноблочных компьютеров.',3999800),(37,5,13,'SSD накопитель 240ГБ, SanDisk Plus, SDSSDA-240G-G26',3090,500,1,'1542808757.jpeg','Тихий и мало греющийся твердотельный накопитель SanDisk вдохнет новую жизнь в ваш ноутбук или настольный компьютер. Быстрый и надежный накопитель SanDisk SSD Plus ускорит загрузку и завершение работы, сократит время отклика приложений и увеличит скорость передачи данных по сравнению с обычным жестким диском.','Тихий и мало греющийся твердотельный накопитель SanDisk вдохнет новую жизнь в ваш ноутбук или настольный компьютер. Быстрый и надежный накопитель SanDisk SSD Plus ускорит загрузку и завершение работы, сократит время отклика приложений и увеличит скорость передачи данных по сравнению с обычным жестким диском.',4053479),(38,5,14,'SSD накопитель 250ГБ, M.2, PCIe 3.0, Samsung 970 EVO Series, MZ-V7E250BW',5980,500,1,'1542808768.jpeg','SSD-накопители Samsung серии 970 EVO отличаются непревзойденной скоростью, лучшей в своем классе надежностью и широким диапазоном выбора емкости.','SSD-накопители Samsung серии 970 EVO отличаются непревзойденной скоростью, лучшей в своем классе надежностью и широким диапазоном выбора емкости. Использование технологии V-NAND, нового контроллера Phoenix и интеллектуальной технологии Intelligent TurboWrite повышает плавность обработки динамичных сцен в ресурсоемких компьютерных играх и ускоряет редактирование 4K и 3D графики.',4426917),(39,5,16,'SSD накопитель 240ГБ, 2.5\", SATA III, Toshiba TR200, THN-TR20Z2400U8',3060,500,1,'1542808771.jpeg','Благодаря 64-слойной структуре с вертикальной укладкой, технология Toshiba BiCS FLASH обеспечивает более высокую пропускную способность, выносливость, производительность и эффективность в одном и том же месте, обеспечивая передовые технологии хранения.','Благодаря 64-слойной структуре с вертикальной укладкой, технология Toshiba BiCS FLASH обеспечивает более высокую пропускную способность, выносливость, производительность и эффективность в одном и том же месте, обеспечивая передовые технологии хранения. Повысьте производительность с помощью SSD серии TR200 и получите более быструю загрузку, передачу файлов и оперативность системы. Попрощайтесь с задержкой на жестком диске и получите опыт работы, достойный вашего времени. По сравнению с жесткими дисками твердотельные накопители Toshiba OCZ TR200 также обеспечивают повышенную долговечность и энергопотребление, что может привести к увеличению времени автономной работы, чтобы поддерживать работу и работать дольше.',4413897),(40,5,15,'SSD накопитель 120ГБ, Silicon Power Slim S55, SP120GBSS3S55S25',1760,500,1,'1542808776.jpeg','Включение компьютера и загрузка приложений все еще требуют массу времени? Пора избавляться от старого жесткого диска и переходить на SSD-накопитель.','Включение компьютера и загрузка приложений все еще требуют массу времени? Пора избавляться от старого жесткого диска и переходить на SSD-накопитель. С мощным интерфейсом SATA III 6 Гбит/с накопитель S55 обеспечит включение вашего ПК и загрузку всех приложений за считанные секунды.',805012);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8BF21CDE12469DE2` (`category_id`),
  CONSTRAINT `FK_8BF21CDE12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (1,1,'Форм-фактор'),(2,1,'Для процессоров'),(3,1,'Чипсет'),(4,1,'Количество слотов памяти'),(5,1,'Звуковая схема'),(6,2,'Объём'),(7,2,'Тип памяти'),(8,2,'Рабочая частота'),(9,3,'Чипсет'),(10,3,'Объём памяти'),(11,3,'Тип видеопамяти'),(12,3,'Разъёмы ввода/вывода'),(13,4,'Тип поставки'),(14,4,'Разъём'),(15,4,'Количество ядер'),(16,4,'Количество потоков'),(17,4,'Техпроцесс'),(18,4,'Частота'),(19,4,'Встроенная графика'),(20,5,'Объём памяти'),(21,5,'Форм-фактор'),(22,5,'Скорость вращения'),(23,5,'Тип SSD'),(24,5,'Буферная память');
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_value`
--

DROP TABLE IF EXISTS `property_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DB649939549213EC` (`property_id`),
  KEY `IDX_DB6499394584665A` (`product_id`),
  CONSTRAINT `FK_DB6499394584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK_DB649939549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_value`
--

LOCK TABLES `property_value` WRITE;
/*!40000 ALTER TABLE `property_value` DISABLE KEYS */;
INSERT INTO `property_value` VALUES (1,1,1,'Micro-ATX'),(2,2,1,'Intel'),(3,3,1,'Intel H81'),(4,4,1,'2'),(5,1,2,'Micro-ATX'),(6,2,2,'Intel'),(7,3,2,'Intel H81'),(8,4,2,'2'),(9,5,2,'Realtek ALC887'),(10,1,3,'Micro-ATX'),(11,2,3,'AMD'),(12,3,3,'AMD A68H'),(13,4,3,'2'),(14,5,3,'Realtek ALC887'),(15,1,4,'Micro-ATX'),(16,2,4,'AMD'),(17,3,4,'AMD A68H'),(18,4,4,'2'),(19,5,4,'Realtek ALC887'),(20,1,5,'Micro-ATX'),(21,2,5,'AMD'),(22,3,5,'AMD A68H'),(23,4,5,'2'),(24,5,5,'Realtek ALC887'),(25,1,6,'Micro-ATX'),(26,2,6,'Intel'),(27,3,6,'Intel H61'),(28,4,6,'2'),(29,5,6,'Realtek ALC887'),(30,1,7,'Standard-ATX'),(31,2,7,'Intel'),(32,3,7,'Intel B250'),(33,4,7,'4'),(34,5,7,'Realtek ALC1220'),(35,1,8,'Micro-ATX'),(36,2,8,'Intel'),(37,3,8,'Intel H310'),(38,4,8,'2'),(39,5,8,'Realtek ALC887'),(40,6,9,'8 Гб'),(41,7,9,'DDR4'),(42,8,9,'2400 МГц '),(43,6,10,'4 Гб'),(44,7,10,'DDR3'),(45,8,10,'1600 МГц (PC-12800)'),(46,6,11,'4 Гб'),(47,7,11,'DDR4'),(48,8,11,'2400 МГц (РС-19200)'),(49,6,12,'8 Гб'),(50,7,12,'DDR4'),(51,8,12,'2666 МГц (PC 21300)'),(52,6,13,'4 Гб'),(53,7,13,'DDR4'),(54,8,13,'2400 МГц (РС-19200)'),(55,6,14,'16 Гб'),(56,7,14,'DDR4'),(57,8,14,'2666 МГц (PC 21300)'),(58,6,15,'8 Гб'),(59,7,15,'DDR3'),(60,8,15,'1600 МГц (PC-12800)'),(61,9,16,'GTX 1050 Ti'),(62,10,16,'4 ГБ'),(63,11,16,'GDDR5'),(64,12,16,'DP, DVI, HDMI'),(65,9,17,'GTX 1060'),(66,10,17,'6 ГБ'),(67,11,17,'GDDR5'),(68,12,17,'2 x DVI, DP, HDMI'),(69,9,18,'GTX 1050 Ti'),(70,10,18,'4 ГБ'),(71,11,18,'GDDR5'),(72,12,18,'DP, DVI, HDMI'),(73,9,19,'RX 580'),(74,10,19,'4 ГБ'),(75,11,19,'GDDR5'),(76,12,19,'2 x DP, 2 x HDMI, DVI'),(77,9,20,'RTX 2080'),(78,10,20,'8 ГБ'),(79,11,20,'GDDR6'),(80,12,20,'3 x DP, HDMI, USB Type-C'),(81,9,21,'RX 570'),(82,10,21,'8 ГБ'),(83,11,21,'GDDR5'),(84,12,21,'2 x DP, 2 x HDMI, DVI'),(85,9,22,'RX 580'),(86,10,22,'4 ГБ'),(87,11,22,'GDDR5'),(88,12,22,'2 x DP, 2 x HDMI, DVI'),(89,9,23,'GTX 1080 Ti'),(90,10,23,'11 ГБ'),(91,11,23,'GDDR5X'),(92,12,23,'3 x DP, DVI, HDMI'),(93,13,24,'BOX'),(94,14,24,'LGA 1151-V2'),(95,15,24,'4'),(96,16,24,'4'),(97,17,24,'14 нм'),(98,18,24,'3.6 Ггц'),(99,19,24,'Intel UHD Graphics 630'),(100,13,25,'BOX'),(101,14,25,'LGA 1151'),(102,15,25,'4'),(103,16,25,'4'),(104,17,25,'14 нм'),(105,18,25,'3.0 Ггц'),(106,19,25,'Intel UHD Graphics 630'),(107,13,26,'BOX'),(108,14,26,'LGA 1151-V2'),(109,15,26,'6'),(110,16,26,'6'),(111,17,26,'14 нм'),(112,18,26,'2.8 Ггц'),(113,19,26,'Intel UHD Graphics 630'),(114,13,27,'OEM'),(115,14,27,'Socket AM3+'),(116,15,27,'6'),(117,16,27,'6'),(118,17,27,'32 нм'),(119,18,27,'3.5 Ггц'),(120,19,27,'Нет'),(121,13,28,'BOX'),(122,14,28,'LGA 1151'),(123,15,28,'2'),(124,16,28,'4'),(125,17,28,'14 нм'),(126,18,28,'3.9 Ггц'),(127,19,28,'Intel UHD Graphics 630'),(128,13,29,'OEM'),(129,14,29,'Socket AM3+'),(130,15,29,'4'),(131,16,29,'4'),(132,17,29,'32 нм'),(133,18,29,'3.8 Ггц'),(134,19,29,'Нет'),(135,13,30,'BOX'),(136,14,30,'Socket AM4'),(137,15,30,'6'),(138,16,30,'12'),(139,17,30,'12 нм'),(140,18,30,'3.4 Ггц'),(141,19,30,'Нет'),(142,13,31,'OEM'),(143,14,31,'LGA 1151-V2'),(144,15,31,'6'),(145,16,31,'6'),(146,17,31,'14 нм'),(147,18,31,'2.8 Ггц'),(148,19,31,'Intel UHD Graphics 630'),(149,13,32,'BOX'),(150,14,32,'LGA 1151'),(151,15,32,'2'),(152,16,32,'4'),(153,17,32,'14 нм'),(154,18,32,'3.5 Ггц'),(155,19,32,'Intel HD Graphics 610'),(156,20,33,'4TБ'),(157,21,33,'3,5'),(158,22,33,'5400'),(159,24,33,'256'),(160,20,34,'4ТБ'),(161,21,34,'3,5'),(162,22,34,'5900'),(163,24,34,'64'),(164,20,35,'1ТБ'),(165,21,35,'3,5'),(166,22,35,'7200'),(167,24,35,'64'),(168,20,36,'2ТБ'),(169,21,36,'3,5'),(170,22,36,'7200'),(171,24,36,'64'),(172,20,37,'240ГБ'),(173,21,37,'2,5'),(174,23,37,'TLC'),(175,20,38,'250ГБ'),(176,21,38,'M.2'),(177,23,38,'TLC 3D'),(178,20,39,'240ГБ'),(179,21,39,'2,5'),(180,23,39,'TLC 3D'),(181,20,40,'120ГБ'),(182,21,40,'2,5'),(183,23,40,'TLC');
/*!40000 ALTER TABLE `property_value` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-17 15:34:31
