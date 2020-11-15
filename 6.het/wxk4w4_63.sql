-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: _63
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
-- Table structure for table `konyv`
--

DROP TABLE IF EXISTS `konyv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `konyv` (
  `isbn` varchar(20) NOT NULL,
  `cim` varchar(40) DEFAULT NULL,
  `targy` varchar(30) DEFAULT NULL,
  `ar` int DEFAULT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konyv`
--

LOCK TABLES `konyv` WRITE;
/*!40000 ALTER TABLE `konyv` DISABLE KEYS */;
/*!40000 ALTER TABLE `konyv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resztvevo`
--

DROP TABLE IF EXISTS `resztvevo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resztvevo` (
  `tajszam` int NOT NULL,
  `nev` varchar(30) DEFAULT NULL,
  `lakcim` varchar(50) DEFAULT NULL,
  `befizetes` int DEFAULT NULL,
  PRIMARY KEY (`tajszam`),
  UNIQUE KEY `befizetes` (`befizetes`),
  CONSTRAINT `FK_asd` FOREIGN KEY (`befizetes`) REFERENCES `tanfolyam` (`tkod`),
  CONSTRAINT `resztvevo_ibfk_1` FOREIGN KEY (`tajszam`) REFERENCES `tanfolyam` (`tkod`),
  CONSTRAINT `resztvevo_ibfk_2` FOREIGN KEY (`befizetes`) REFERENCES `tanfolyam` (`befizetes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resztvevo`
--

LOCK TABLES `resztvevo` WRITE;
/*!40000 ALTER TABLE `resztvevo` DISABLE KEYS */;
/*!40000 ALTER TABLE `resztvevo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tanfolyam`
--

DROP TABLE IF EXISTS `tanfolyam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tanfolyam` (
  `tkod` int NOT NULL,
  `ar` int DEFAULT NULL,
  `tipus` varchar(50) DEFAULT NULL,
  `megnevezes` varchar(50) DEFAULT NULL,
  `befizetes` int DEFAULT NULL,
  PRIMARY KEY (`tkod`),
  UNIQUE KEY `befizetes` (`befizetes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tanfolyam`
--

LOCK TABLES `tanfolyam` WRITE;
/*!40000 ALTER TABLE `tanfolyam` DISABLE KEYS */;
/*!40000 ALTER TABLE `tanfolyam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `termekek`
--

DROP TABLE IF EXISTS `termekek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `termekek` (
  `tkod` int NOT NULL,
  `nev` varchar(50) NOT NULL,
  `ear` int DEFAULT NULL,
  `kategoria` char(20) DEFAULT NULL,
  PRIMARY KEY (`tkod`),
  CONSTRAINT `termekek_chk_1` CHECK ((`ear` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termekek`
--

LOCK TABLES `termekek` WRITE;
/*!40000 ALTER TABLE `termekek` DISABLE KEYS */;
INSERT INTO `termekek` VALUES (1,'lapát',2000,'K1'),(2,'seprű',4000,'K1'),(3,'mosogató gél',1500,'K2'),(4,'szappan',1000,'K2'),(5,'pohár',2400,'K3');
/*!40000 ALTER TABLE `termekek` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-15 20:02:18
