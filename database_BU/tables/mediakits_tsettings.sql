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
-- Table structure for table `tsettings`
--

DROP TABLE IF EXISTS `tsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsettings` (
  `siteid` varchar(25) NOT NULL DEFAULT '',
  `Site` varchar(50) DEFAULT NULL,
  `MaxNestLevel` int(10) DEFAULT NULL,
  `PageLimit` int(10) DEFAULT NULL,
  `Locking` varchar(50) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `exportLocation` varchar(100) DEFAULT NULL,
  `FileDir` varchar(50) DEFAULT NULL,
  `Contact` varchar(50) DEFAULT NULL,
  `MailserverIP` varchar(50) DEFAULT NULL,
  `MailServerUsername` varchar(50) DEFAULT NULL,
  `MailServerPassword` varchar(50) DEFAULT NULL,
  `EmailBroadcaster` int(10) DEFAULT NULL,
  `Extranet` int(10) DEFAULT NULL,
  `ExtranetPublicReg` int(10) DEFAULT NULL,
  `ExtranetPublicRegNotify` varchar(255) DEFAULT NULL,
  `ExtranetSSL` int(10) DEFAULT NULL,
  `Cache` int(10) DEFAULT NULL,
  `ViewDepth` int(10) DEFAULT NULL,
  `NextN` int(10) DEFAULT NULL,
  `DataCollection` int(10) DEFAULT NULL,
  `columnCount` int(10) DEFAULT NULL,
  `columnNames` text,
  `primaryColumn` int(10) DEFAULT NULL,
  `publicSubmission` int(10) DEFAULT NULL,
  `AdManager` int(10) DEFAULT NULL,
  `archiveDate` datetime DEFAULT NULL,
  `contactName` varchar(50) DEFAULT NULL,
  `contactAddress` varchar(50) DEFAULT NULL,
  `contactCity` varchar(50) DEFAULT NULL,
  `contactState` varchar(50) DEFAULT NULL,
  `contactZip` varchar(50) DEFAULT NULL,
  `contactEmail` varchar(100) DEFAULT NULL,
  `contactPhone` varchar(50) DEFAULT NULL,
  `privateUserPoolID` varchar(50) DEFAULT NULL,
  `publicUserPoolID` varchar(50) DEFAULT NULL,
  `advertiserUserPoolID` varchar(50) DEFAULT NULL,
  `orderNo` int(10) DEFAULT NULL,
  `emailBroadcasterLimit` int(10) NOT NULL DEFAULT '0',
  `feedManager` int(10) DEFAULT NULL,
  `displayPoolID` varchar(50) DEFAULT NULL,
  `galleryMainScaleBy` varchar(50) DEFAULT NULL,
  `galleryMainScale` int(10) DEFAULT NULL,
  `gallerySmallScaleBy` varchar(50) DEFAULT NULL,
  `gallerySmallScale` int(10) DEFAULT NULL,
  `galleryMediumScaleBy` varchar(50) DEFAULT NULL,
  `galleryMediumScale` int(10) DEFAULT NULL,
  `sendLoginScript` longtext,
  `mailingListConfirmScript` longtext,
  `publicSubmissionApprovalScript` longtext,
  `reminderScript` longtext,
  `loginURL` varchar(255) DEFAULT NULL,
  `editProfileURL` varchar(255) DEFAULT NULL,
  `CommentApprovalDefault` tinyint(3) DEFAULT NULL,
  `deploy` tinyint(3) DEFAULT NULL,
  `lastDeployment` datetime DEFAULT NULL,
  `accountActivationScript` longtext,
  `googleAPIKey` varchar(100) DEFAULT NULL,
  `useDefaultSMTPServer` tinyint(3) DEFAULT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `mailserverSMTPPort` varchar(5) DEFAULT NULL,
  `mailserverPOPPort` varchar(5) DEFAULT NULL,
  `mailserverTLS` varchar(5) DEFAULT NULL,
  `mailserverSSL` varchar(5) DEFAULT NULL,
  `siteLocale` varchar(50) DEFAULT NULL,
  `domainAlias` longtext,
  `cacheCapacity` int(10) DEFAULT NULL,
  `cacheFreeMemoryThreshold` int(10) DEFAULT NULL,
  `tagline` varchar(255) DEFAULT NULL,
  `hasChangesets` tinyint(3) DEFAULT NULL,
  `baseID` char(35) DEFAULT NULL,
  `enforcePrimaryDomain` tinyint(4) DEFAULT '0',
  `enforceChangesets` tinyint(4) DEFAULT '0',
  `smallImageHeight` varchar(20) DEFAULT NULL,
  `smallImageWidth` varchar(20) DEFAULT NULL,
  `mediumImageHeight` varchar(20) DEFAULT NULL,
  `mediumImageWidth` varchar(20) DEFAULT NULL,
  `largeImageHeight` varchar(20) DEFAULT NULL,
  `largeImageWidth` varchar(20) DEFAULT NULL,
  `contentApprovalScript` longtext,
  `contentRejectionScript` longtext,
  `hasComments` int(10) DEFAULT '0',
  `hasLockableNodes` int(10) DEFAULT '0',
  `enableLockdown` varchar(255) DEFAULT NULL,
  `customTagGroups` varchar(255) DEFAULT NULL,
  `filePoolID` varchar(25) DEFAULT NULL,
  `categoryPoolID` varchar(25) DEFAULT NULL,
  `contentPoolID` text,
  `sendAuthCodeScript` longtext,
  `reCAPTCHASiteKey` varchar(50) DEFAULT NULL,
  `reCAPTCHASecret` varchar(50) DEFAULT NULL,
  `reCAPTCHALanguage` varchar(25) DEFAULT NULL,
  `JSONApi` int(10) DEFAULT '0',
  `useSSL` int(10) DEFAULT '0',
  `isremote` int(10) DEFAULT '0',
  `resourceSSL` int(10) DEFAULT '0',
  `resourceDomain` varchar(100) DEFAULT NULL,
  `remoteport` int(10) DEFAULT '80',
  `remotecontext` varchar(100) DEFAULT NULL,
  `contentPendingScript` longtext,
  `contentCanceledScript` longtext,
  `showDashboard` int(10) DEFAULT '0',
  `placeholderImgID` varchar(35) DEFAULT NULL,
  `placeholderImgExt` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsettings`
--

LOCK TABLES `tsettings` WRITE;
/*!40000 ALTER TABLE `tsettings` DISABLE KEYS */;
INSERT INTO `tsettings` VALUES ('default','Default',NULL,1000,'none','localmuradefault.loc',NULL,NULL,'king@werwards.com',NULL,NULL,NULL,0,1,0,NULL,0,0,1,20,1,3,'Left Column^Main Content^Right Column',2,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default','default',1,0,1,'default','y',600,'s',80,'s',180,NULL,NULL,NULL,NULL,'?display=login','?display=editProfile',1,0,NULL,NULL,NULL,1,'MuraBootstrap3','25','110','false','false',NULL,NULL,0,60,'',1,'0F147C93-8002-7D59-D5A4502B5896C090',0,0,'80','80','180','180','600','AUTO',NULL,NULL,0,0,'',NULL,'default','default','default',NULL,NULL,NULL,NULL,0,0,0,0,NULL,80,NULL,NULL,NULL,0,NULL,NULL),('mediakits','mediakits',NULL,1000,'none','www.mediakits.com',NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,NULL,0,0,1,20,1,3,'Left Column^Main Content^Right Column',2,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mediakits','mediakits','mediakits',2,0,1,'mediakits',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'?display=login','?display=editProfile',1,0,NULL,NULL,NULL,1,'MuraBootstrap3','25','110','false','false',NULL,'www.mediakits.com\r\ntest.mediakits.com\r\nmediakits.loc',0,60,'media kits tagline',1,'1264CBC1-8002-7D59-D5A070058251AE4C',0,0,'80','80','180','180','AUTO','600',NULL,NULL,1,0,'',NULL,'mediakits','mediakits','mediakits',NULL,NULL,NULL,'en',0,0,0,0,NULL,80,NULL,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `tsettings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-09 16:26:36
