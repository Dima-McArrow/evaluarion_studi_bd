-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: cinema_app_db
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `cin_admins`
--

DROP TABLE IF EXISTS `cin_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cin_admins` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cinema_id` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cin_admins`
--

LOCK TABLES `cin_admins` WRITE;
/*!40000 ALTER TABLE `cin_admins` DISABLE KEYS */;
INSERT INTO `cin_admins` VALUES (1,'Dima Makarov','dsm.box@gmail.com','dim123',1),(2,'John Doe','doe.john@mail.com','password',2),(3,'Tonny Stark','stark@industries.com','ironman',3),(4,'Steven Rogers','first@avenger.com','cpt',5),(5,'Peter Parker','peter@marvel.com','$2y$10$9OBxfSH8UAZyMXWfv8z2Z.CIew0E9ugmv0G3LyJZ9B361UdnHhKTe',3),(6,'Thor','thor@marvel.com','$2y$10$MuVlqZqiK1nHSy2ExDdtpOVLMxSKLVlvo1ln1icHuBp5GZscatUOa',1),(7,'Janne Doe','janne@mail.com','$2y$10$T1c/EIEziQWsWNRNHIfRKetRu07tORKR4Iao8usb4QBWFfD1c989e',2);
/*!40000 ALTER TABLE `cin_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemas`
--

DROP TABLE IF EXISTS `cinemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `adress` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemas`
--

LOCK TABLES `cinemas` WRITE;
/*!40000 ALTER TABLE `cinemas` DISABLE KEYS */;
INSERT INTO `cinemas` VALUES (1,'Paris 1','1 rue des Eaux'),(2,'Paris 2','13 rue de la Paix'),(3,'Paris 3','24 rue de la Tour'),(4,'Paris 7','33 rue de la Pompe'),(5,'Courbevoie 1','1 rue des Lilas d Espagne');
/*!40000 ALTER TABLE `cinemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `length_min` int NOT NULL,
  `director` varchar(100) DEFAULT NULL,
  `casting` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Mean Girls',112,'Samantha Jayne, Arturo Perez Jr.','Angourie Rice, Reneé Rapp, Auli\'i Cravalho'),(2,'The Beekeeper',105,'David Ayer','Jason Statham, Emmy Raver-Lampman, Bobby Naderi'),(3,'Wonka',116,'Paul King','Timothée Chalamet, Gustave Die, Murray McArthur'),(4,'Migration',83,'Benjamin Renner, Guylo Homsy','Kumail Nanjiani, Tresi Gazal, Elizabeth Banks'),(5,'Anyone But You',103,'Will Gluck','Sydney Sweeney, Glen Powell, Alexandra Shipp'),(6,'Poor Things',141,'Yorgos Lanthimos','Emma Stone, Mark Ruffalo, Willem Dafoe'),(7,'Ferrari',130,'Michael Mann','Adam Driver, Shailene Woodley, Giuseppe Festinese');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (1,'Plein tarif',9.20),(2,'Étudiant',7.60),(3,'Moins de 14 ans',5.90);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salles`
--

DROP TABLE IF EXISTS `salles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salles` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `places` int NOT NULL,
  `cinema_id` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salles`
--

LOCK TABLES `salles` WRITE;
/*!40000 ALTER TABLE `salles` DISABLE KEYS */;
INSERT INTO `salles` VALUES (7,'Normandie',100,1),(8,'Loire',150,1),(9,'Montargis',70,2),(10,'333',150,2),(11,'Rouge',130,2),(12,'Verte',80,3),(13,'Blanche',100,4),(14,'Noire',150,4),(15,'Lumiere',70,5),(16,'777',150,5),(17,'Rex',130,4),(18,'Moscou',80,4);
/*!40000 ALTER TABLE `salles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seances`
--

DROP TABLE IF EXISTS `seances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seances` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `movie_id` int NOT NULL,
  `salle_id` int NOT NULL,
  `start_at` timestamp NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seances`
--

LOCK TABLES `seances` WRITE;
/*!40000 ALTER TABLE `seances` DISABLE KEYS */;
INSERT INTO `seances` VALUES (1,1,1,'2024-02-13 08:00:00'),(2,1,3,'2024-02-13 08:00:00'),(3,1,5,'2024-02-13 08:00:00'),(4,1,8,'2024-02-13 08:00:00'),(5,2,2,'2024-02-13 08:00:00'),(6,2,4,'2024-02-13 08:00:00'),(7,3,6,'2024-02-13 08:00:00'),(8,4,7,'2024-02-13 08:00:00'),(9,3,1,'2024-02-13 12:00:00'),(10,4,3,'2024-02-13 12:00:00'),(11,2,9,'2024-02-13 08:00:00'),(12,2,10,'2024-02-13 08:00:00'),(13,2,13,'2024-02-13 08:00:00'),(14,3,9,'2024-02-13 12:00:00'),(15,1,7,'2024-02-13 12:00:00'),(16,7,8,'2024-02-13 12:00:00'),(17,7,12,'2024-02-13 08:00:00'),(18,3,12,'2024-02-13 12:00:00'),(19,3,9,'2024-02-13 12:00:00'),(20,4,15,'2024-02-13 12:00:00');
/*!40000 ALTER TABLE `seances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `seance_id` int DEFAULT NULL,
  `price_id` int DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,4,2,NULL),(2,4,1,NULL),(3,4,3,NULL);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-01  0:32:31
