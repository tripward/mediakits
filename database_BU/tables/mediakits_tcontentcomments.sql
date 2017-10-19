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
-- Table structure for table `tcontentcomments`
--

DROP TABLE IF EXISTS `tcontentcomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontentcomments` (
  `commentid` char(35) NOT NULL DEFAULT '',
  `contentid` char(35) DEFAULT NULL,
  `contenthistid` char(35) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `comments` longtext,
  `entered` datetime DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `siteid` varchar(25) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `isApproved` tinyint(3) DEFAULT '0',
  `subscribe` tinyint(3) DEFAULT NULL,
  `userID` char(35) DEFAULT NULL,
  `parentID` char(35) DEFAULT NULL,
  `path` longtext,
  `remoteID` char(35) DEFAULT NULL,
  `flagCount` int(10) DEFAULT '0',
  `isSpam` int(10) DEFAULT '0',
  `isDeleted` int(10) DEFAULT '0',
  PRIMARY KEY (`commentid`),
  KEY `IX_TContentComments` (`contentid`),
  KEY `IX_tcontentcomments_parentID` (`parentID`),
  KEY `IX_tcontentcomments_remoteid` (`remoteID`),
  KEY `IX_tcontentcomments_entered` (`entered`),
  KEY `IX_tcontentcomments_userid` (`userID`),
  KEY `IX_tcontentcomments_siteid` (`siteid`),
  KEY `IX_tcontentcomments_flagCount` (`flagCount`),
  KEY `IX_tcontentcomments_isSpam` (`isSpam`),
  KEY `IX_tcontentcomments_isDeleted` (`isDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontentcomments`
--

LOCK TABLES `tcontentcomments` WRITE;
/*!40000 ALTER TABLE `tcontentcomments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcontentcomments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-09 16:26:25
