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
-- Table structure for table `tcontentsourcemaps`
--

DROP TABLE IF EXISTS `tcontentsourcemaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontentsourcemaps` (
  `siteid` varchar(25) DEFAULT '',
  `created` datetime DEFAULT NULL,
  `sourceid` char(35) DEFAULT '',
  `contenthistid` char(35) DEFAULT '',
  `mapid` char(35) NOT NULL DEFAULT '',
  `contentid` char(35) DEFAULT '',
  PRIMARY KEY (`mapid`),
  KEY `IX_tcontentsourcemaps_siteid` (`siteid`),
  KEY `IX_tcontentsourcemaps_sourceid` (`sourceid`),
  KEY `IX_tcontentsourcemaps_contenthistid` (`contenthistid`),
  KEY `IX_tcontentsourcemaps_contentid` (`contentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontentsourcemaps`
--

LOCK TABLES `tcontentsourcemaps` WRITE;
/*!40000 ALTER TABLE `tcontentsourcemaps` DISABLE KEYS */;
INSERT INTO `tcontentsourcemaps` VALUES ('default','2017-09-09 12:06:46','6300ED69-1320-5CC3-F922E3012E2C6BAE','105EFBA5-8002-7D59-D5ABB1E5FD8165F5','105F0438-8002-7D59-D5A80D118EF00ADF','00000000000000000000000000000000001');
/*!40000 ALTER TABLE `tcontentsourcemaps` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-09 16:28:40
