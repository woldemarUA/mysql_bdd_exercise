-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: animal_refuge_db
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Adoptant`
--

DROP TABLE IF EXISTS `Adoptant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Adoptant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adoptant`
--

LOCK TABLES `Adoptant` WRITE;
/*!40000 ALTER TABLE `Adoptant` DISABLE KEYS */;
/*!40000 ALTER TABLE `Adoptant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Aliment`
--

DROP TABLE IF EXISTS `Aliment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aliment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aliment`
--

LOCK TABLES `Aliment` WRITE;
/*!40000 ALTER TABLE `Aliment` DISABLE KEYS */;
INSERT INTO `Aliment` VALUES (2,'Viande Fraiche'),(5,'Herbes'),(6,'Branches, foin'),(7,'Graines, noix'),(8,'Poisson'),(9,'Insectes'),(10,'Fruits'),(11,'Legumes'),(12,'Feuilles'),(13,'Bambou');
/*!40000 ALTER TABLE `Aliment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Allee`
--

DROP TABLE IF EXISTS `Allee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Allee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `responsableId` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Allee`
--

LOCK TABLES `Allee` WRITE;
/*!40000 ALTER TABLE `Allee` DISABLE KEYS */;
INSERT INTO `Allee` VALUES (1,1,7),(2,2,8),(3,3,9),(4,4,10);
/*!40000 ALTER TABLE `Allee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AlleeCage`
--

DROP TABLE IF EXISTS `AlleeCage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AlleeCage` (
  `alleeId` int NOT NULL,
  `cageId` int NOT NULL,
  PRIMARY KEY (`alleeId`,`cageId`),
  KEY `cageId` (`cageId`),
  CONSTRAINT `AlleeCage_ibfk_1` FOREIGN KEY (`alleeId`) REFERENCES `Allee` (`id`),
  CONSTRAINT `AlleeCage_ibfk_2` FOREIGN KEY (`cageId`) REFERENCES `Cage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AlleeCage`
--

LOCK TABLES `AlleeCage` WRITE;
/*!40000 ALTER TABLE `AlleeCage` DISABLE KEYS */;
INSERT INTO `AlleeCage` VALUES (1,1),(1,2),(1,3),(1,4),(2,5),(2,6),(2,7),(2,8),(3,9),(3,10),(3,11),(3,12),(4,13),(4,14),(4,15),(4,16);
/*!40000 ALTER TABLE `AlleeCage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Animal`
--

DROP TABLE IF EXISTS `Animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Animal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `pays` varchar(45) NOT NULL,
  `continent` varchar(45) NOT NULL,
  `dateNaissance` date NOT NULL,
  `dateArivee` date NOT NULL,
  `carnetSanteId` int NOT NULL,
  `soigneurId` int NOT NULL,
  `responsableId` int NOT NULL,
  `cageId` int NOT NULL,
  `alleeId` int NOT NULL,
  `mereId` int DEFAULT NULL,
  `pereId` int DEFAULT NULL,
  `especeId` int NOT NULL,
  `genreId` int DEFAULT NULL,
  `familieId` int DEFAULT NULL,
  `ordreId` int DEFAULT NULL,
  `classId` int DEFAULT NULL,
  `sexeId` int NOT NULL,
  `amis` varchar(15) NOT NULL DEFAULT 'Sauvage',
  PRIMARY KEY (`id`),
  UNIQUE KEY `carnetSanteId` (`carnetSanteId`),
  KEY `soigneurId` (`soigneurId`),
  KEY `responsableId` (`responsableId`),
  KEY `cageId` (`cageId`),
  KEY `mereId` (`mereId`),
  KEY `pereId` (`pereId`),
  KEY `especeId` (`especeId`),
  KEY `genreId` (`genreId`),
  KEY `familieId` (`familieId`),
  KEY `ordreId` (`ordreId`),
  KEY `classId` (`classId`),
  KEY `fk_sexe` (`sexeId`),
  KEY `fk_allee` (`alleeId`),
  CONSTRAINT `Animal_ibfk_1` FOREIGN KEY (`carnetSanteId`) REFERENCES `CarnetSante` (`id`),
  CONSTRAINT `Animal_ibfk_10` FOREIGN KEY (`genreId`) REFERENCES `Genre` (`id`),
  CONSTRAINT `Animal_ibfk_11` FOREIGN KEY (`familieId`) REFERENCES `Familie` (`id`),
  CONSTRAINT `Animal_ibfk_12` FOREIGN KEY (`ordreId`) REFERENCES `Ordre` (`id`),
  CONSTRAINT `Animal_ibfk_13` FOREIGN KEY (`classId`) REFERENCES `Class` (`id`),
  CONSTRAINT `Animal_ibfk_2` FOREIGN KEY (`soigneurId`) REFERENCES `Employe` (`id`),
  CONSTRAINT `Animal_ibfk_3` FOREIGN KEY (`responsableId`) REFERENCES `Employe` (`id`),
  CONSTRAINT `Animal_ibfk_4` FOREIGN KEY (`cageId`) REFERENCES `Cage` (`id`),
  CONSTRAINT `Animal_ibfk_7` FOREIGN KEY (`mereId`) REFERENCES `Animal` (`id`),
  CONSTRAINT `Animal_ibfk_8` FOREIGN KEY (`pereId`) REFERENCES `Animal` (`id`),
  CONSTRAINT `Animal_ibfk_9` FOREIGN KEY (`especeId`) REFERENCES `Espece` (`id`),
  CONSTRAINT `fk_allee` FOREIGN KEY (`alleeId`) REFERENCES `Allee` (`id`),
  CONSTRAINT `fk_sexe` FOREIGN KEY (`sexeId`) REFERENCES `Sexe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Animal`
--

LOCK TABLES `Animal` WRITE;
/*!40000 ALTER TABLE `Animal` DISABLE KEYS */;
INSERT INTO `Animal` VALUES (1,'Charly','Kenya','Afrique','1990-06-15','2009-04-22',1,1,7,2,1,NULL,NULL,1,NULL,NULL,NULL,NULL,1,'Sauvage'),(2,'Luna','Kenya','Afrique','2018-06-15','2020-05-20',3,2,7,4,1,NULL,NULL,2,NULL,NULL,NULL,NULL,2,'Sauvage'),(3,'Simba','Tanzanie','Afrique','2017-03-10','2019-11-25',4,3,8,6,2,NULL,NULL,3,NULL,NULL,NULL,NULL,1,'Sauvage'),(4,'Jumbo','Gabon','Afrique','2015-08-22','2018-04-30',5,4,8,8,2,NULL,NULL,4,NULL,NULL,NULL,NULL,1,'Sauvage'),(6,'Nemo','Australie','Oceanie','2019-01-16','2021-06-15',6,1,7,1,1,NULL,NULL,5,NULL,NULL,NULL,NULL,2,'Sauvage'),(7,'Zazu','Egypte','Afrique','2016-05-27','2018-07-09',7,5,9,9,3,NULL,NULL,6,NULL,NULL,NULL,NULL,1,'Sauvage'),(8,'Fluffy','Canada','Amerique du Nord','2017-10-05','2019-12-10',8,6,9,10,3,NULL,NULL,7,NULL,NULL,NULL,NULL,2,'Sauvage'),(9,'Dash','Madagascar','Afrique','2020-02-14','2022-03-22',9,6,9,11,3,NULL,NULL,8,NULL,NULL,NULL,NULL,1,'Sauvage'),(10,'Rio','Bresil','Amerique du Sud','2018-09-30','2021-01-05',10,6,9,12,3,NULL,NULL,10,NULL,NULL,NULL,NULL,2,'Sauvage'),(11,'Kiki','Chine','Asie','2016-11-11','2019-02-20',11,2,7,3,1,NULL,NULL,11,NULL,NULL,NULL,NULL,2,'Sauvage'),(12,'Momo','Nepal','Asie','2019-04-07','2021-05-27',12,4,8,7,2,NULL,NULL,12,NULL,NULL,NULL,NULL,1,'Sauvage'),(14,'Pixel','Madagascar','Afrique','2020-05-14','2022-07-22',13,3,8,5,2,NULL,NULL,13,NULL,NULL,NULL,NULL,1,'Sauvage'),(15,'Flicker','Costa Rica','Amerique','2021-03-18','2023-01-05',14,3,8,5,2,NULL,NULL,14,NULL,NULL,NULL,NULL,2,'Sauvage'),(16,'CoCo','Tanzanie','Afrique','2008-07-14','2015-02-04',15,1,7,2,1,NULL,NULL,1,NULL,NULL,NULL,NULL,2,'Sauvage'),(17,'Hector','Canada','Amerique Nord','2019-11-05','2021-10-15',16,2,7,3,1,NULL,NULL,15,NULL,NULL,NULL,NULL,1,'Sauvage'),(18,'Kofi','Congo','Afrique','2007-03-10','2021-06-20',17,12,10,14,4,NULL,NULL,16,NULL,NULL,1,NULL,1,'Sauvage'),(19,'Nia','Congo','Afrique','2009-05-18','2021-08-13',18,12,10,14,4,NULL,NULL,16,NULL,NULL,1,NULL,2,'Sauvage'),(20,'Zuri','Congo','Afrique','2016-02-21','2023-01-15',19,12,10,14,4,19,18,16,NULL,NULL,1,NULL,2,'Sauvage'),(21,'Moustache','France','Europe','2005-03-15','2021-04-10',20,11,10,16,4,NULL,NULL,17,NULL,NULL,NULL,NULL,1,'Domestic'),(22,'clair','France','Europe','2007-07-21','2021-05-18',21,11,10,16,4,NULL,NULL,17,NULL,NULL,NULL,NULL,2,'Domestic'),(23,'Tigre','France','Europe','2012-06-09','2021-06-30',22,13,10,15,4,22,21,17,NULL,NULL,NULL,NULL,1,'Domestic'),(24,'Ombre','France','Europe','2012-06-09','2021-07-22',23,13,10,15,4,22,21,17,NULL,NULL,NULL,NULL,1,'Domestic'),(25,'Petit Moustache','France','Europe','2020-02-20','2023-01-15',24,11,10,15,4,23,22,17,NULL,NULL,NULL,NULL,1,'Domestic'),(26,'Chouquette','France','Europe','2020-02-20','2023-01-15',25,11,10,15,4,23,22,17,NULL,NULL,NULL,NULL,2,'Domestic');
/*!40000 ALTER TABLE `Animal` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_animal_parent_not_self` BEFORE INSERT ON `Animal` FOR EACH ROW BEGIN
  IF NEW.mereId IS NOT NULL AND NEW.mereId = NEW.id THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Un animal ne peut pas tre sa propre mre';
  END IF;
  
  IF NEW.pereId IS NOT NULL AND NEW.pereId = NEW.id THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Un animal ne peut pas tre son propre pre';
  END IF;
  
  IF NEW.mereId = NEW.pereId THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Le mme animal ne peut pas tre  la fois la mre et le pre';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Cage`
--

DROP TABLE IF EXISTS `Cage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `soigneurId` int NOT NULL,
  `fonctionalite` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `soigneurId` (`soigneurId`),
  CONSTRAINT `Cage_ibfk_1` FOREIGN KEY (`soigneurId`) REFERENCES `Employe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cage`
--

LOCK TABLES `Cage` WRITE;
/*!40000 ALTER TABLE `Cage` DISABLE KEYS */;
INSERT INTO `Cage` VALUES (1,1,1,'Petite'),(2,2,1,'Grande'),(3,3,2,'Petite'),(4,4,2,'Grande'),(5,5,3,'Petite'),(6,6,3,'Grande'),(7,7,4,'Grande'),(8,8,4,'Grande'),(9,9,5,'Petite'),(10,10,6,'Grande'),(11,11,6,'Petite'),(12,12,6,'Grande'),(13,13,11,'Petite'),(14,14,12,'Grande'),(15,15,11,'Petite'),(16,16,13,'Grande');
/*!40000 ALTER TABLE `Cage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CarnetMaladie`
--

DROP TABLE IF EXISTS `CarnetMaladie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CarnetMaladie` (
  `carnetId` int NOT NULL,
  `maladieId` int NOT NULL,
  PRIMARY KEY (`carnetId`,`maladieId`),
  KEY `maladieId` (`maladieId`),
  CONSTRAINT `CarnetMaladie_ibfk_1` FOREIGN KEY (`carnetId`) REFERENCES `CarnetSante` (`id`),
  CONSTRAINT `CarnetMaladie_ibfk_2` FOREIGN KEY (`maladieId`) REFERENCES `Maladie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CarnetMaladie`
--

LOCK TABLES `CarnetMaladie` WRITE;
/*!40000 ALTER TABLE `CarnetMaladie` DISABLE KEYS */;
INSERT INTO `CarnetMaladie` VALUES (1,1),(1,6),(1,7),(3,8),(3,9),(4,10),(4,11),(5,12),(6,13),(7,14),(8,15),(9,16);
/*!40000 ALTER TABLE `CarnetMaladie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CarnetSante`
--

DROP TABLE IF EXISTS `CarnetSante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CarnetSante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CarnetSante`
--

LOCK TABLES `CarnetSante` WRITE;
/*!40000 ALTER TABLE `CarnetSante` DISABLE KEYS */;
INSERT INTO `CarnetSante` VALUES (1,1),(3,2),(4,3),(5,4),(6,5),(7,6),(8,7),(9,8),(10,9),(11,10),(12,11),(13,12),(14,13),(15,14),(16,15),(17,16),(18,17),(19,18),(20,19),(21,20),(22,21),(23,22),(24,23),(25,24);
/*!40000 ALTER TABLE `CarnetSante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Class`
--

DROP TABLE IF EXISTS `Class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Class`
--

LOCK TABLES `Class` WRITE;
/*!40000 ALTER TABLE `Class` DISABLE KEYS */;
/*!40000 ALTER TABLE `Class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employe`
--

DROP TABLE IF EXISTS `Employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `villeId` int NOT NULL,
  `roleId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `villeId` (`villeId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `Employe_ibfk_1` FOREIGN KEY (`villeId`) REFERENCES `Ville` (`id`),
  CONSTRAINT `Employe_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `Role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employe`
--

LOCK TABLES `Employe` WRITE;
/*!40000 ALTER TABLE `Employe` DISABLE KEYS */;
INSERT INTO `Employe` VALUES (1,'Peyrin',1,1),(2,'Berrut',2,1),(3,'Sicard',3,1),(4,'Voiron',4,1),(5,'Scholl',5,1),(6,'Adiba',6,1),(7,'Julien Marechal',7,2),(8,'Clara Fontaine',8,2),(9,'Louis Bernard',9,2),(10,'Eric Montagnan',5,2),(11,'Jean Pierre',5,1),(12,'Maria Curie',7,1),(13,'Roussonson',6,1);
/*!40000 ALTER TABLE `Employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Enfant`
--

DROP TABLE IF EXISTS `Enfant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Enfant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `animalID` int NOT NULL,
  `mereId` int DEFAULT NULL,
  `pereId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_enfant_animal` (`id`,`animalID`),
  KEY `animalID` (`animalID`),
  KEY `mereId` (`mereId`),
  KEY `pereId` (`pereId`),
  CONSTRAINT `Enfant_ibfk_1` FOREIGN KEY (`animalID`) REFERENCES `Animal` (`id`),
  CONSTRAINT `Enfant_ibfk_2` FOREIGN KEY (`mereId`) REFERENCES `Animal` (`id`),
  CONSTRAINT `Enfant_ibfk_3` FOREIGN KEY (`pereId`) REFERENCES `Animal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Enfant`
--

LOCK TABLES `Enfant` WRITE;
/*!40000 ALTER TABLE `Enfant` DISABLE KEYS */;
/*!40000 ALTER TABLE `Enfant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Espece`
--

DROP TABLE IF EXISTS `Espece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Espece` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_titre` (`titre`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Espece`
--

LOCK TABLES `Espece` WRITE;
/*!40000 ALTER TABLE `Espece` DISABLE KEYS */;
INSERT INTO `Espece` VALUES (15,'Castor'),(14,'Colibri'),(4,'Elephant'),(17,'Felis catus'),(2,'Girafe'),(16,'Gorille'),(10,'Jaguar'),(5,'Kangourou'),(8,'Lemurien'),(1,'Leopard'),(3,'Lion'),(7,'Ours Polaire'),(11,'Panda Roux'),(6,'Perroquet'),(13,'Tenrec'),(12,'Tigre');
/*!40000 ALTER TABLE `Espece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Familie`
--

DROP TABLE IF EXISTS `Familie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Familie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Familie`
--

LOCK TABLES `Familie` WRITE;
/*!40000 ALTER TABLE `Familie` DISABLE KEYS */;
/*!40000 ALTER TABLE `Familie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre`
--

DROP TABLE IF EXISTS `Genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre`
--

LOCK TABLES `Genre` WRITE;
/*!40000 ALTER TABLE `Genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `Genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Maladie`
--

DROP TABLE IF EXISTS `Maladie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Maladie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Maladie`
--

LOCK TABLES `Maladie` WRITE;
/*!40000 ALTER TABLE `Maladie` DISABLE KEYS */;
INSERT INTO `Maladie` VALUES (1,'Grippe','2020-12-03'),(2,'Entorse','2021-03-15'),(3,'Parasitose','2021-08-21'),(4,'Dermatite','2022-01-11'),(5,'Gingivite','2022-07-30'),(6,'Dermatite','2021-09-10'),(7,'Entorse','2022-01-20'),(8,'Gastro-enterite','2022-08-20'),(9,'Fievre','2023-03-15'),(10,'Tuberculose','2020-09-05'),(11,'Vers Intestinaux','2022-06-21'),(12,'Parasitose','2023-01-11'),(13,'Mycoplasme','2021-04-22'),(14,'Psittacose','2022-07-17'),(15,'Gale','2023-02-28'),(16,'Leishmaniose','2020-11-30');
/*!40000 ALTER TABLE `Maladie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu`
--

DROP TABLE IF EXISTS `Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Menu` (
  `animalId` int NOT NULL,
  `alimentId` int NOT NULL,
  `quantite` decimal(5,2) DEFAULT NULL,
  `notes` text,
  `frequence` varchar(45) DEFAULT NULL,
  `numero` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`animalId`,`alimentId`),
  KEY `alimentId` (`alimentId`),
  CONSTRAINT `Menu_ibfk_1` FOREIGN KEY (`animalId`) REFERENCES `Animal` (`id`),
  CONSTRAINT `Menu_ibfk_2` FOREIGN KEY (`alimentId`) REFERENCES `Aliment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
INSERT INTO `Menu` VALUES (1,2,2.00,'Source principale de nourriture','Quotidienne',1),(1,11,0.30,'Supplementaire legumes pour Carnivore','Hebdomadaire',1),(2,5,5.00,'Besoin de branches pour mimer le broutage naturel','Quotidienne',2),(2,11,5.00,'Besoin de branches pour mimer le broutage naturel','Quotidienne',2),(2,12,5.00,'Besoin de branches pour mimer le broutage naturel','Quotidienne',2),(3,2,7.00,'Fournir des os pour hygiene dentaire','Quotidienne',1),(3,11,0.50,'Supplementaire legumes pour Carnivore','Hebdomadaire',1),(4,6,100.00,'Necessite un access a leau pour boire et se baigner','Quotidienne',3),(4,10,80.00,' Necessite un access a leau pour boire et se baigner','Quotidienne',3),(6,5,1.50,'Espace pour sauter est essentiel','Quotidienne',4),(6,12,1.50,'Espace pour sauter est essentiel','Quotidienne',4),(7,7,0.20,'Necessite des structures d escalade','Quotidienne',5),(7,10,0.10,'Necessite des structures d escalade','Quotidienne',5),(8,2,8.00,'Fournir de leau glacee et des jeux pour stimuler','Quotidienne',6),(8,8,8.00,'Fournir de leau glacee et des jeux pour stimuler','Quotidienne',6),(9,9,0.20,'Necessite des structures d escalade','Quotidienne',7),(9,10,0.20,'Necessite des structures d escalade','Quotidienne',7),(9,11,0.20,'Necessite des structures d escalade','Quotidienne',7),(10,2,6.00,'Inclure des exercise d enrichissement pour simuler la chasse','Quotidienne',1),(10,11,0.50,'Supplementaire legumes pour Carnivore','Hebdomadaire',1),(11,10,0.50,'Arbres et branches sont necessaires pour grimper','Quotidienne',8),(11,11,0.50,'Arbres et branches sont necessaires pour grimper','Quotidienne',8),(11,13,1.00,'Arbres et branches sont necessaires pour grimper','Quotidienne',8),(12,2,6.00,'Enrichessement necessaire pour stimuler les instincts naturels','Quotidienne',1),(12,11,0.40,'Supplementaire legumes pour Carnivore','Hebdomadaire',1),(21,2,0.15,'Source principale de nourriture','Quotidienne',6),(21,8,0.05,'Supplment nutritionnel','Quotidienne',6),(22,2,0.15,'Source principale de nourriture','Quotidienne',6),(22,8,0.05,'Supplment nutritionnel','Quotidienne',6),(23,2,0.15,'Source principale de nourriture','Quotidienne',6),(23,8,0.05,'Supplment nutritionnel','Quotidienne',6),(24,2,0.10,'Source principale de nourriture pour jeune chat','Quotidienne',6),(24,8,0.03,'Supplment nutritionnel pour jeune chat','Quotidienne',6),(25,2,0.10,'Source principale de nourriture pour jeune chat','Quotidienne',6),(25,8,0.03,'Supplment nutritionnel pour jeune chat','Quotidienne',6);
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ordre`
--

DROP TABLE IF EXISTS `Ordre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ordre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ordre`
--

LOCK TABLES `Ordre` WRITE;
/*!40000 ALTER TABLE `Ordre` DISABLE KEYS */;
INSERT INTO `Ordre` VALUES (1,'Primates');
/*!40000 ALTER TABLE `Ordre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'Soigneur'),(2,'Responsable');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sexe`
--

DROP TABLE IF EXISTS `Sexe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sexe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sexe`
--

LOCK TABLES `Sexe` WRITE;
/*!40000 ALTER TABLE `Sexe` DISABLE KEYS */;
INSERT INTO `Sexe` VALUES (1,'male'),(2,'femelle');
/*!40000 ALTER TABLE `Sexe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vaccine`
--

DROP TABLE IF EXISTS `Vaccine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vaccine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `dateProchain` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vaccine`
--

LOCK TABLES `Vaccine` WRITE;
/*!40000 ALTER TABLE `Vaccine` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vaccine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ville`
--

DROP TABLE IF EXISTS `Ville`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ville` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ville`
--

LOCK TABLES `Ville` WRITE;
/*!40000 ALTER TABLE `Ville` DISABLE KEYS */;
INSERT INTO `Ville` VALUES (1,'Noumea'),(2,'Sartene'),(3,'Calvi'),(4,'Pointe a Pitre'),(5,'Ushuaia'),(6,'Papeete'),(7,'Marseille'),(8,'Lyon'),(9,'Toulouse');
/*!40000 ALTER TABLE `Ville` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-05  8:11:59
