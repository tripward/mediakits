CREATE DATABASE  IF NOT EXISTS `mediakits` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mediakits`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mediakits
-- ------------------------------------------------------
-- Server version	5.5.45

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
-- Table structure for table `tclassextenddatauseractivity`
--

DROP TABLE IF EXISTS `tclassextenddatauseractivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tclassextenddatauseractivity` (
  `dataID` int(11) NOT NULL AUTO_INCREMENT,
  `baseID` char(35) NOT NULL,
  `attributeID` int(11) NOT NULL,
  `siteID` varchar(25) DEFAULT NULL,
  `attributeValue` longtext,
  `remoteID` varchar(35) DEFAULT NULL,
  `datetimevalue` datetime DEFAULT NULL,
  `numericvalue` float DEFAULT NULL,
  `stringvalue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dataID`),
  KEY `Index_2` (`baseID`),
  KEY `Index_3` (`attributeID`),
  KEY `IX_extend_remote2` (`remoteID`),
  KEY `IX_extend_date2` (`datetimevalue`),
  KEY `IX_extend_numeric2` (`numericvalue`),
  KEY `IX_extend_string2` (`stringvalue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tclassextenddatauseractivity`
--

LOCK TABLES `tclassextenddatauseractivity` WRITE;
/*!40000 ALTER TABLE `tclassextenddatauseractivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tclassextenddatauseractivity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-09 16:29:13
