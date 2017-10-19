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
-- Table structure for table `tsessiontracking`
--

DROP TABLE IF EXISTS `tsessiontracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsessiontracking` (
  `trackingID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contentID` char(35) DEFAULT NULL,
  `siteID` varchar(25) DEFAULT NULL,
  `userid` char(35) DEFAULT NULL,
  `remote_addr` varchar(50) DEFAULT NULL,
  `server_name` varchar(50) DEFAULT NULL,
  `query_string` mediumtext,
  `referer` varchar(255) DEFAULT NULL,
  `user_agent` varchar(200) DEFAULT NULL,
  `script_name` varchar(200) DEFAULT NULL,
  `urlToken` varchar(130) NOT NULL DEFAULT '',
  `entered` datetime NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  `locale` varchar(50) DEFAULT NULL,
  `keywords` varchar(200) DEFAULT NULL,
  `originalUrlToken` varchar(130) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`trackingID`),
  KEY `IDX_ENTERED` (`entered`),
  KEY `IX_TSessionTracking` (`siteID`),
  KEY `IX_TSessionTracking_1` (`contentID`),
  KEY `IX_TSessionTracking_2` (`urlToken`),
  KEY `IX_TSessionTracking_3` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsessiontracking`
--

LOCK TABLES `tsessiontracking` WRITE;
/*!40000 ALTER TABLE `tsessiontracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsessiontracking` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-09 16:25:55
