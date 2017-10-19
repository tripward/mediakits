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
-- Table structure for table `tcontentfeeds`
--

DROP TABLE IF EXISTS `tcontentfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontentfeeds` (
  `feedID` char(35) NOT NULL DEFAULT '',
  `siteID` varchar(35) DEFAULT NULL,
  `parentID` char(35) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `isActive` tinyint(3) DEFAULT NULL,
  `isPublic` tinyint(3) DEFAULT NULL,
  `isDefault` tinyint(3) DEFAULT NULL,
  `isFeaturesOnly` tinyint(3) DEFAULT NULL,
  `description` longtext,
  `maxItems` int(10) DEFAULT NULL,
  `allowHTML` tinyint(3) DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  `lastUpdateBy` varchar(100) DEFAULT NULL,
  `lastUpdate` datetime DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `restricted` tinyint(3) DEFAULT NULL,
  `restrictGroups` longtext,
  `version` varchar(50) DEFAULT NULL,
  `channellink` longtext,
  `Type` varchar(50) DEFAULT NULL,
  `sortBy` varchar(50) DEFAULT NULL,
  `sortDirection` varchar(50) DEFAULT NULL,
  `nextN` int(10) DEFAULT NULL,
  `displayName` tinyint(3) DEFAULT NULL,
  `displayRatings` tinyint(3) DEFAULT NULL,
  `displayComments` tinyint(3) DEFAULT NULL,
  `altname` varchar(250) DEFAULT NULL,
  `remoteID` varchar(255) DEFAULT NULL,
  `remoteSourceURL` varchar(255) DEFAULT NULL,
  `remotePubDate` datetime DEFAULT NULL,
  `imageSize` varchar(50) DEFAULT NULL,
  `imageHeight` varchar(15) DEFAULT NULL,
  `imageWidth` varchar(15) DEFAULT NULL,
  `displayList` longtext,
  `showNavOnly` tinyint(3) DEFAULT NULL,
  `showExcludeSearch` tinyint(3) DEFAULT NULL,
  `viewalllink` varchar(255) DEFAULT NULL,
  `viewalllabel` varchar(100) DEFAULT NULL,
  `cssclass` varchar(255) DEFAULT NULL,
  `autoimport` tinyint(4) DEFAULT '0',
  `isLocked` tinyint(4) DEFAULT '0',
  `contentpoolid` text,
  `useCategoryIntersect` int(10) DEFAULT NULL,
  `authtype` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`feedID`),
  KEY `IX_TContentFeeds` (`siteID`),
  KEY `IX_feed_remoteID` (`remoteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontentfeeds`
--

LOCK TABLES `tcontentfeeds` WRITE;
/*!40000 ALTER TABLE `tcontentfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcontentfeeds` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-09 16:26:03
