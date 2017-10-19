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
-- Table structure for table `tusers`
--

DROP TABLE IF EXISTS `tusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tusers` (
  `UserID` char(35) NOT NULL DEFAULT '',
  `GroupName` varchar(50) DEFAULT NULL,
  `Fname` varchar(50) DEFAULT NULL,
  `Lname` varchar(50) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `PasswordCreated` datetime DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Company` varchar(50) DEFAULT NULL,
  `JobTitle` varchar(50) DEFAULT NULL,
  `mobilePhone` varchar(50) DEFAULT NULL,
  `Website` varchar(255) DEFAULT NULL,
  `Type` int(10) DEFAULT NULL,
  `subType` varchar(50) DEFAULT NULL,
  `Ext` int(10) DEFAULT NULL,
  `ContactForm` longtext,
  `Admin` int(10) DEFAULT NULL,
  `S2` int(10) DEFAULT NULL,
  `LastLogin` datetime DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  `LastUpdateBy` varchar(50) DEFAULT NULL,
  `LastUpdateByID` varchar(35) DEFAULT NULL,
  `Perm` tinyint(3) DEFAULT NULL,
  `InActive` tinyint(3) DEFAULT NULL,
  `isPublic` int(10) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  `Subscribe` int(10) DEFAULT NULL,
  `notes` longtext,
  `description` longtext,
  `interests` longtext,
  `keepPrivate` tinyint(3) DEFAULT NULL,
  `photoFileID` varchar(35) DEFAULT NULL,
  `IMName` varchar(100) DEFAULT NULL,
  `IMService` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `remoteID` varchar(35) DEFAULT NULL,
  `tags` longtext,
  `tablist` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `IX_tusers_groupname` (`GroupName`),
  KEY `IX_tusers_type` (`Type`),
  KEY `IX_tusers_subtype` (`subType`),
  KEY `IX_tusers_remoteid` (`remoteID`),
  KEY `IX_tusers_siteid` (`SiteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tusers`
--

LOCK TABLES `tusers` WRITE;
/*!40000 ALTER TABLE `tusers` DISABLE KEYS */;
INSERT INTO `tusers` VALUES ('0F0D96E2-8002-7D59-D5AE0B7065A84EE1',NULL,'Admin','User','admin','$2a$10$1re5FuUf5DBwPKzwSgzdPOAc21Q/p8JIUoLS/1L3z9qEzOuC6UhGO','2017-09-09 11:55:07','king@werwards.com',NULL,NULL,NULL,NULL,2,'Default',NULL,NULL,NULL,1,'2017-09-09 12:59:33','2017-09-09 11:29:55','System','22FC551F-FABE-EA01-C6EDD0885DDC1682',0,0,0,'default',0,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-09 18:29:55',NULL,NULL,NULL),('0F0D9A45-8002-7D59-D5AB2FF154E7E61B','Admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Default',NULL,NULL,NULL,0,NULL,'2017-09-09 11:29:55','System',NULL,1,0,0,'default',0,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-09 18:29:55',NULL,NULL,NULL),('1264DA91-8002-7D59-D5A3A2379DF8B637','Admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Default',NULL,NULL,NULL,0,NULL,'2017-09-09 13:03:20','System',NULL,1,0,0,'mediakits',0,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-09 20:03:20',NULL,NULL,NULL),('12D80D2A-8002-7D59-D5A49F4BAB747F70',NULL,'trip','ward','trip','$2a$10$nEdkRR/vRJrD72p/HtUhhuFa8ekdv/ba0tSXY6pBBAXDjcwCV0eo6','2017-09-09 13:16:51','king@werwards.com','mediakits','web guy',NULL,NULL,2,'Default',NULL,NULL,NULL,1,NULL,'2017-09-09 13:20:57','Admin User','0F0D96E2-8002-7D59-D5AE0B7065A84EE1',0,0,0,'mediakits',1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-09 20:16:51',NULL,NULL,NULL),('12E22ED3-8002-7D59-D5AB9990790141AB',NULL,'patrick','tisdael','patrick','$2a$10$nEdkRR/vRJrD72p/HtUhhuWNpVphXjxNThrVq911r3VvFdMoUoj.u','2017-09-09 13:18:20','patricktisdel@outlook.com','mediakits','web guy',NULL,NULL,2,'Default',NULL,NULL,NULL,1,NULL,'2017-09-09 13:20:36','Admin User','0F0D96E2-8002-7D59-D5AE0B7065A84EE1',0,0,0,'mediakits',1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-09 20:18:20',NULL,NULL,NULL),('12EFB7DE-8002-7D59-D5AAABB1D1E7FBE6',NULL,'andrea','Khoury','andrea','$2a$10$nEdkRR/vRJrD72p/HtUhhuWNpVphXjxNThrVq911r3VvFdMoUoj.u','2017-09-09 13:19:47','andrea@khourypr.com','mediakits','Owner',NULL,NULL,2,'Default',NULL,NULL,NULL,0,NULL,'2017-09-09 13:20:15','Admin User','0F0D96E2-8002-7D59-D5AE0B7065A84EE1',0,0,0,'mediakits',1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-09 20:19:47',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tusers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-09 16:28:17
