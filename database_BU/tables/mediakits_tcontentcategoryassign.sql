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
-- Table structure for table `tcontentcategoryassign`
--

DROP TABLE IF EXISTS `tcontentcategoryassign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontentcategoryassign` (
  `contentHistID` char(35) NOT NULL DEFAULT '',
  `categoryID` char(35) NOT NULL DEFAULT '',
  `contentID` char(35) DEFAULT NULL,
  `isFeature` int(10) DEFAULT NULL,
  `orderno` int(10) DEFAULT NULL,
  `siteID` varchar(50) DEFAULT NULL,
  `featureStart` datetime DEFAULT NULL,
  `featureStop` datetime DEFAULT NULL,
  PRIMARY KEY (`contentHistID`,`categoryID`),
  KEY `IX_tcontentcategoryassign_isfeature` (`isFeature`),
  KEY `IX_tcontentcategoryassign_featurestart` (`featureStart`),
  KEY `IX_tcontentcategoryassign_featurestop` (`featureStop`),
  KEY `IX_tcontentcategoryassign_contentID` (`contentID`),
  KEY `IX_tcontentcategoryassign_categoryID` (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontentcategoryassign`
--

LOCK TABLES `tcontentcategoryassign` WRITE;
/*!40000 ALTER TABLE `tcontentcategoryassign` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcontentcategoryassign` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-09 16:26:58
