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
-- Table structure for table `tsystemobjects`
--

DROP TABLE IF EXISTS `tsystemobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsystemobjects` (
  `Object` varchar(50) DEFAULT NULL,
  `SiteID` varchar(25) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `OrderNo` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsystemobjects`
--

LOCK TABLES `tsystemobjects` WRITE;
/*!40000 ALTER TABLE `tsystemobjects` DISABLE KEYS */;
INSERT INTO `tsystemobjects` VALUES ('event_reminder_form','default','Event Reminder Form',12),('forward_email','default','Forward Email',13),('site_map','default','Site Map',2),('peer_nav','default','Peer Navigation',3),('sub_nav','default','Sub Navigation',4),('standard_nav','default','Standard Navigation',5),('folder_nav','default','Folder Navigation',6),('comments','default','Comment Form',9),('seq_nav','default','Sequential Nav',8),('rater','default','Content Rater',16),('favorites','default','User Favorites',17),('related_content','default','Related Content',19),('user_tools','default','User Tools',20),('tag_cloud','default','Tag Cloud',21),('goToFirstChild','default','Go To First Child',23),('multilevel_nav','default','Multi-Level Navigation',7),('event_reminder_form','mediakits','Event Reminder Form',12),('forward_email','mediakits','Forward Email',13),('site_map','mediakits','Site Map',2),('peer_nav','mediakits','Peer Navigation',3),('sub_nav','mediakits','Sub Navigation',4),('standard_nav','mediakits','Standard Navigation',5),('folder_nav','mediakits','Folder Navigation',6),('comments','mediakits','Comment Form',9),('seq_nav','mediakits','Sequential Nav',8),('rater','mediakits','Content Rater',16),('favorites','mediakits','User Favorites',17),('related_content','mediakits','Related Content',19),('user_tools','mediakits','User Tools',20),('tag_cloud','mediakits','Tag Cloud',21),('goToFirstChild','mediakits','Go To First Child',23),('multilevel_nav','mediakits','Multi-Level Navigation',7);
/*!40000 ALTER TABLE `tsystemobjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-09 16:29:05
