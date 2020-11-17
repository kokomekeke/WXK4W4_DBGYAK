-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: _62
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `alkatresz`
--

DROP TABLE IF EXISTS `alkatresz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alkatresz` (
  `akod` int NOT NULL,
  `nev` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`akod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alkatresz`
--

LOCK TABLES `alkatresz` WRITE;
/*!40000 ALTER TABLE `alkatresz` DISABLE KEYS */;
/*!40000 ALTER TABLE `alkatresz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egysegek`
--

DROP TABLE IF EXISTS `egysegek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `egysegek` (
  `aru` int NOT NULL,
  `db` int DEFAULT NULL,
  KEY `aru` (`aru`),
  CONSTRAINT `egysegek_ibfk_1` FOREIGN KEY (`aru`) REFERENCES `termek` (`tkod`),
  CONSTRAINT `egysegek_chk_1` CHECK ((`db` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egysegek`
--

LOCK TABLES `egysegek` WRITE;
/*!40000 ALTER TABLE `egysegek` DISABLE KEYS */;
/*!40000 ALTER TABLE `egysegek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gyarto`
--

DROP TABLE IF EXISTS `gyarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gyarto` (
  `adoszam` int NOT NULL,
  `nev` varchar(30) DEFAULT NULL,
  `telephely` varchar(40) DEFAULT NULL,
  `irsz` varchar(4) DEFAULT NULL,
  `varos` varchar(40) DEFAULT NULL,
  `utca` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`adoszam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gyarto`
--

LOCK TABLES `gyarto` WRITE;
/*!40000 ALTER TABLE `gyarto` DISABLE KEYS */;
/*!40000 ALTER TABLE `gyarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komponens`
--

DROP TABLE IF EXISTS `komponens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `komponens` (
  `termek` int NOT NULL,
  `alkatresz` int NOT NULL,
  KEY `termek` (`termek`),
  KEY `alkatresz` (`alkatresz`),
  CONSTRAINT `komponens_ibfk_1` FOREIGN KEY (`termek`) REFERENCES `termek` (`tkod`),
  CONSTRAINT `komponens_ibfk_2` FOREIGN KEY (`alkatresz`) REFERENCES `alkatresz` (`akod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komponens`
--

LOCK TABLES `komponens` WRITE;
/*!40000 ALTER TABLE `komponens` DISABLE KEYS */;
/*!40000 ALTER TABLE `komponens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `termek`
--

DROP TABLE IF EXISTS `termek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `termek` (
  `tkod` int NOT NULL,
  `nev` varchar(50) DEFAULT NULL,
  `ear` int NOT NULL,
  `gyarto` int DEFAULT NULL,
  PRIMARY KEY (`tkod`),
  KEY `gyarto` (`gyarto`),
  CONSTRAINT `termek_ibfk_1` FOREIGN KEY (`gyarto`) REFERENCES `gyarto` (`adoszam`),
  CONSTRAINT `termek_chk_1` CHECK ((`ear` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termek`
--

LOCK TABLES `termek` WRITE;
/*!40000 ALTER TABLE `termek` DISABLE KEYS */;
/*!40000 ALTER TABLE `termek` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-15 20:02:02
