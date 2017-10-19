CREATE DATABASE  IF NOT EXISTS `mediakits_mura` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mediakits_mura`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mediakits_mura
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
-- Table structure for table `custom_personphonenumbers`
--

DROP TABLE IF EXISTS `custom_personphonenumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_personphonenumbers` (
  `phonenumberid` char(35) NOT NULL DEFAULT '',
  `personid` char(35) DEFAULT '',
  `phonenumber` varchar(255) NOT NULL,
  `phonetype` varchar(255) NOT NULL,
  PRIMARY KEY (`phonenumberid`),
  KEY `IX_custom_personphonenumbers_personid` (`personid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_personphonenumbers`
--

LOCK TABLES `custom_personphonenumbers` WRITE;
/*!40000 ALTER TABLE `custom_personphonenumbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_personphonenumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_persons`
--

DROP TABLE IF EXISTS `custom_persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_persons` (
  `personid` char(35) NOT NULL DEFAULT '',
  `siteid` varchar(25) DEFAULT '',
  `namefirst` varchar(255) NOT NULL,
  `namelast` varchar(255) NOT NULL,
  `userid` char(35) DEFAULT '',
  `datemodified` datetime DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  PRIMARY KEY (`personid`),
  KEY `IX_custom_persons_siteid` (`siteid`),
  KEY `IX_custom_persons_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_persons`
--

LOCK TABLES `custom_persons` WRITE;
/*!40000 ALTER TABLE `custom_persons` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tapprovalactions`
--

DROP TABLE IF EXISTS `tapprovalactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tapprovalactions` (
  `siteID` varchar(25) DEFAULT '',
  `actionType` varchar(50) DEFAULT '',
  `comments` text,
  `userID` char(35) DEFAULT '',
  `groupID` char(35) DEFAULT '',
  `created` datetime DEFAULT NULL,
  `actiontID` char(35) NOT NULL DEFAULT '',
  `requestID` char(35) DEFAULT '',
  `parentID` char(35) DEFAULT '',
  `chainID` char(35) DEFAULT '',
  PRIMARY KEY (`actiontID`),
  KEY `IX_tapprovalactions_siteID` (`siteID`),
  KEY `IX_tapprovalactions_userID` (`userID`),
  KEY `IX_tapprovalactions_groupID` (`groupID`),
  KEY `IX_tapprovalactions_requestID` (`requestID`),
  KEY `IX_tapprovalactions_parentID` (`parentID`),
  KEY `IX_tapprovalactions_chainID` (`chainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tapprovalactions`
--

LOCK TABLES `tapprovalactions` WRITE;
/*!40000 ALTER TABLE `tapprovalactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tapprovalactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tapprovalassignments`
--

DROP TABLE IF EXISTS `tapprovalassignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tapprovalassignments` (
  `siteID` varchar(25) DEFAULT '',
  `assignmentID` char(35) NOT NULL DEFAULT '',
  `contentID` char(35) DEFAULT '',
  `exemptID` text,
  `chainID` char(35) DEFAULT '',
  PRIMARY KEY (`assignmentID`),
  KEY `IX_tapprovalassignments_siteID` (`siteID`),
  KEY `IX_tapprovalassignments_contentID` (`contentID`),
  KEY `IX_tapprovalassignments_chainID` (`chainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tapprovalassignments`
--

LOCK TABLES `tapprovalassignments` WRITE;
/*!40000 ALTER TABLE `tapprovalassignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tapprovalassignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tapprovalchains`
--

DROP TABLE IF EXISTS `tapprovalchains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tapprovalchains` (
  `siteID` varchar(25) DEFAULT '',
  `chainID` char(35) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `lastupdate` datetime DEFAULT NULL,
  `description` text,
  `lastupdateby` varchar(50) DEFAULT NULL,
  `lastupdatebyid` char(35) DEFAULT NULL,
  PRIMARY KEY (`chainID`),
  KEY `IX_tapprovalchains_siteID` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tapprovalchains`
--

LOCK TABLES `tapprovalchains` WRITE;
/*!40000 ALTER TABLE `tapprovalchains` DISABLE KEYS */;
/*!40000 ALTER TABLE `tapprovalchains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tapprovalmemberships`
--

DROP TABLE IF EXISTS `tapprovalmemberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tapprovalmemberships` (
  `groupID` char(35) DEFAULT '',
  `siteID` varchar(25) DEFAULT '',
  `created` datetime DEFAULT NULL,
  `orderno` int(10) DEFAULT '1',
  `membershipID` char(35) NOT NULL DEFAULT '',
  `chainID` char(35) DEFAULT '',
  PRIMARY KEY (`membershipID`),
  KEY `IX_tapprovalmemberships_groupID` (`groupID`),
  KEY `IX_tapprovalmemberships_siteID` (`siteID`),
  KEY `IX_tapprovalmemberships_chainID` (`chainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tapprovalmemberships`
--

LOCK TABLES `tapprovalmemberships` WRITE;
/*!40000 ALTER TABLE `tapprovalmemberships` DISABLE KEYS */;
/*!40000 ALTER TABLE `tapprovalmemberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tapprovalrequests`
--

DROP TABLE IF EXISTS `tapprovalrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tapprovalrequests` (
  `siteID` varchar(25) DEFAULT '',
  `userID` char(35) DEFAULT '',
  `groupID` char(35) DEFAULT '',
  `created` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `contentHistID` char(35) DEFAULT '',
  `requestID` char(35) NOT NULL DEFAULT '',
  `chainID` char(35) DEFAULT '',
  PRIMARY KEY (`requestID`),
  KEY `IX_tapprovalrequests_siteID` (`siteID`),
  KEY `IX_tapprovalrequests_userID` (`userID`),
  KEY `IX_tapprovalrequests_groupID` (`groupID`),
  KEY `IX_tapprovalrequests_contentHistID` (`contentHistID`),
  KEY `IX_tapprovalrequests_chainID` (`chainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tapprovalrequests`
--

LOCK TABLES `tapprovalrequests` WRITE;
/*!40000 ALTER TABLE `tapprovalrequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tapprovalrequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tchangesetcategoryassign`
--

DROP TABLE IF EXISTS `tchangesetcategoryassign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tchangesetcategoryassign` (
  `siteid` varchar(25) DEFAULT '',
  `categoryid` char(35) DEFAULT '',
  `changesetid` char(35) DEFAULT '',
  `assignmentid` char(35) NOT NULL DEFAULT '',
  PRIMARY KEY (`assignmentid`),
  KEY `IX_tchangesetcategoryassign_siteid` (`siteid`),
  KEY `IX_tchangesetcategoryassign_categoryid` (`categoryid`),
  KEY `IX_tchangesetcategoryassign_changesetid` (`changesetid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tchangesetcategoryassign`
--

LOCK TABLES `tchangesetcategoryassign` WRITE;
/*!40000 ALTER TABLE `tchangesetcategoryassign` DISABLE KEYS */;
/*!40000 ALTER TABLE `tchangesetcategoryassign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tchangesetrollback`
--

DROP TABLE IF EXISTS `tchangesetrollback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tchangesetrollback` (
  `siteID` varchar(25) DEFAULT '',
  `rollbackID` char(35) NOT NULL DEFAULT '',
  `changesetID` char(35) DEFAULT '',
  `previousHistID` char(35) DEFAULT '',
  `changesetHistID` char(35) DEFAULT '',
  PRIMARY KEY (`rollbackID`),
  KEY `IX_tchangesetrollback_siteID` (`siteID`),
  KEY `IX_tchangesetrollback_changesetID` (`changesetID`),
  KEY `IX_tchangesetrollback_previousHistID` (`previousHistID`),
  KEY `IX_tchangesetrollback_changesetHistID` (`changesetHistID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tchangesetrollback`
--

LOCK TABLES `tchangesetrollback` WRITE;
/*!40000 ALTER TABLE `tchangesetrollback` DISABLE KEYS */;
/*!40000 ALTER TABLE `tchangesetrollback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tchangesets`
--

DROP TABLE IF EXISTS `tchangesets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tchangesets` (
  `changesetID` char(35) NOT NULL DEFAULT '',
  `siteID` varchar(25) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` longtext,
  `created` datetime DEFAULT NULL,
  `publishDate` datetime DEFAULT NULL,
  `published` tinyint(3) DEFAULT NULL,
  `lastUpdate` datetime DEFAULT NULL,
  `lastUpdateBy` varchar(50) DEFAULT NULL,
  `lastUpdateByID` char(35) DEFAULT NULL,
  `remoteID` varchar(255) DEFAULT NULL,
  `remotePubDate` datetime DEFAULT NULL,
  `remoteSourceURL` varchar(255) DEFAULT NULL,
  `closeDate` datetime DEFAULT NULL,
  PRIMARY KEY (`changesetID`),
  KEY `IX_tchangesets_siteID` (`siteID`),
  KEY `IX_tchangesets_publishDate` (`publishDate`),
  KEY `IX_tchangesets_remoteID` (`remoteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tchangesets`
--

LOCK TABLES `tchangesets` WRITE;
/*!40000 ALTER TABLE `tchangesets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tchangesets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tchangesettagassign`
--

DROP TABLE IF EXISTS `tchangesettagassign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tchangesettagassign` (
  `siteid` varchar(25) DEFAULT '',
  `changesetid` char(35) DEFAULT '',
  `assignmentid` char(35) NOT NULL DEFAULT '',
  `tag` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`assignmentid`),
  KEY `IX_tchangesettagassign_siteid` (`siteid`),
  KEY `IX_tchangesettagassign_changesetid` (`changesetid`),
  KEY `IX_tchangesettagassign_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tchangesettagassign`
--

LOCK TABLES `tchangesettagassign` WRITE;
/*!40000 ALTER TABLE `tchangesettagassign` DISABLE KEYS */;
/*!40000 ALTER TABLE `tchangesettagassign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tclassextend`
--

DROP TABLE IF EXISTS `tclassextend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tclassextend` (
  `subTypeID` char(35) NOT NULL,
  `siteID` varchar(25) DEFAULT NULL,
  `baseTable` varchar(50) DEFAULT NULL,
  `baseKeyField` varchar(50) DEFAULT NULL,
  `dataTable` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `subType` varchar(50) DEFAULT NULL,
  `isActive` tinyint(3) DEFAULT NULL,
  `notes` longtext,
  `lastUpdate` datetime DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `lastUpdateBy` varchar(100) DEFAULT NULL,
  `hasSummary` tinyint(4) DEFAULT '1',
  `hasBody` tinyint(4) DEFAULT '1',
  `description` longtext,
  `availableSubTypes` longtext,
  `iconclass` varchar(50) DEFAULT NULL,
  `hasAssocFile` tinyint(4) DEFAULT '1',
  `hasConfigurator` int(10) DEFAULT '1',
  `adminonly` int(10) DEFAULT NULL,
  PRIMARY KEY (`subTypeID`),
  KEY `IX_extend_type` (`type`,`subType`),
  KEY `IX_extend_siteID` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tclassextend`
--

LOCK TABLES `tclassextend` WRITE;
/*!40000 ALTER TABLE `tclassextend` DISABLE KEYS */;
/*!40000 ALTER TABLE `tclassextend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tclassextendattributes`
--

DROP TABLE IF EXISTS `tclassextendattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tclassextendattributes` (
  `attributeID` int(11) NOT NULL AUTO_INCREMENT,
  `extendSetID` char(35) DEFAULT NULL,
  `siteID` varchar(25) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `label` text,
  `hint` text,
  `type` varchar(100) DEFAULT NULL,
  `orderno` int(11) DEFAULT NULL,
  `isActive` tinyint(3) DEFAULT NULL,
  `required` varchar(50) DEFAULT NULL,
  `validation` varchar(50) DEFAULT NULL,
  `regex` text,
  `message` text,
  `defaultValue` varchar(100) DEFAULT NULL,
  `optionList` longtext,
  `optionLabelList` longtext,
  `adminonly` int(10) DEFAULT NULL,
  PRIMARY KEY (`attributeID`),
  KEY `Index_2` (`extendSetID`),
  KEY `IX_extend_attr_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tclassextendattributes`
--

LOCK TABLES `tclassextendattributes` WRITE;
/*!40000 ALTER TABLE `tclassextendattributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tclassextendattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tclassextenddata`
--

DROP TABLE IF EXISTS `tclassextenddata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tclassextenddata` (
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
  KEY `IX_extend_remoteID1` (`remoteID`),
  KEY `IX_extend_date1` (`datetimevalue`),
  KEY `IX_extend_numeric1` (`numericvalue`),
  KEY `IX_extend_string1` (`stringvalue`),
  KEY `IX_tclassextenddata_baseID_attributeID` (`baseID`,`attributeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tclassextenddata`
--

LOCK TABLES `tclassextenddata` WRITE;
/*!40000 ALTER TABLE `tclassextenddata` DISABLE KEYS */;
/*!40000 ALTER TABLE `tclassextenddata` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `tclassextendrcsets`
--

DROP TABLE IF EXISTS `tclassextendrcsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tclassextendrcsets` (
  `subTypeID` varchar(35) DEFAULT '',
  `orderNo` int(10) DEFAULT NULL,
  `relatedContentSetID` char(35) NOT NULL DEFAULT '',
  `availableSubTypes` text,
  `siteID` varchar(25) DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`relatedContentSetID`),
  KEY `IX_tclassextendrcsets_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tclassextendrcsets`
--

LOCK TABLES `tclassextendrcsets` WRITE;
/*!40000 ALTER TABLE `tclassextendrcsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tclassextendrcsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tclassextendsets`
--

DROP TABLE IF EXISTS `tclassextendsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tclassextendsets` (
  `extendSetID` char(35) NOT NULL,
  `subTypeID` char(35) DEFAULT NULL,
  `categoryID` longtext,
  `siteID` varchar(25) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `orderno` int(11) DEFAULT NULL,
  `isActive` tinyint(3) DEFAULT NULL,
  `container` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`extendSetID`),
  KEY `Index_2` (`subTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tclassextendsets`
--

LOCK TABLES `tclassextendsets` WRITE;
/*!40000 ALTER TABLE `tclassextendsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tclassextendsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tclustercommands`
--

DROP TABLE IF EXISTS `tclustercommands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tclustercommands` (
  `commandID` char(35) NOT NULL DEFAULT '',
  `instanceID` char(35) DEFAULT NULL,
  `command` longtext,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`commandID`),
  KEY `IX_tclustercommands_instanceID` (`instanceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tclustercommands`
--

LOCK TABLES `tclustercommands` WRITE;
/*!40000 ALTER TABLE `tclustercommands` DISABLE KEYS */;
INSERT INTO `tclustercommands` VALUES ('6E9A86E3-8002-7D59-D5AB1C8C76672FD3','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'userManager\').purgeUserCache(userID=\'12EFB7DE-8002-7D59-D5AAABB1D1E7FBE6\',broadcast=false)','2017-09-16 07:19:59'),('6E9E0113-8002-7D59-D5A91D3AF550B18C','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'userManager\').purgeUserCache(userID=\'12E22ED3-8002-7D59-D5AB9990790141AB\',broadcast=false)','2017-09-16 07:20:22'),('6EA2774E-8002-7D59-D5A540CEF72A4C78','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'userManager\').purgeUserCache(userID=\'12D80D2A-8002-7D59-D5A49F4BAB747F70\',broadcast=false)','2017-09-16 07:20:51'),('6EC1610A-8002-7D59-D5AA6EC8EC09C2F5','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'userManager\').purgeUserCache(userID=\'12EFB7DE-8002-7D59-D5AAABB1D1E7FBE6\',broadcast=false)','2017-09-16 07:24:13'),('6EF624B1-8002-7D59-D5A92D54DA4381E9','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'contentSourceMap6EF6193B-8002-7D59-D5ABD6C162850DAB\')','2017-09-16 07:29:59'),('6EF625B7-8002-7D59-D5A64539DAC73DF6','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').purgeCache(name=\'output\',broadcast=false)','2017-09-16 07:29:59'),('6EF63281-8002-7D59-D5A40074CB98EF2D','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'contentFilenameArchive6EF626A7-8002-7D59-D5A0F019D04A69FF\')','2017-09-16 07:30:00'),('6F0BECAC-8002-7D59-D5A2536FBF70250D','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'contentSourceMap6F0BE9CB-8002-7D59-D5A213687AE08DB0\')','2017-09-16 07:32:22'),('6F0BED94-8002-7D59-D5A802F0E43088AB','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').purgeCache(name=\'output\',broadcast=false)','2017-09-16 07:32:22'),('6F0BF159-8002-7D59-D5A2F4971CA94A58','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'contentFilenameArchive6F0BEE8C-8002-7D59-D5A070839C64D898\')','2017-09-16 07:32:22'),('6F125D44-8002-7D59-D5AF017B09934E9B','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'contentSourceMap6F125A8A-8002-7D59-D5AA41FD9FC50BE3\')','2017-09-16 07:33:04'),('6F1CEE76-8002-7D59-D5AF1F52C8C7265E','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'contentSourceMap6F1CEC33-8002-7D59-D5ACCB9D1FB88FE0\')','2017-09-16 07:34:13'),('6F1CF10F-8002-7D59-D5AF731A87E74DA9','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').purgeCache(name=\'output\',broadcast=false)','2017-09-16 07:34:14'),('6F1CF383-8002-7D59-D5A2B59FCD585A3E','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'contentManager\').purgeContentCache(contentID=\'6F103AB2-8002-7D59-D5AC42C0CD198BFE\',siteID=\'mediakits\',broadcast=false)','2017-09-16 07:34:14'),('6F1CF989-8002-7D59-D5A0D2E0471F8F72','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'contentFilenameArchive6F1CF6B6-8002-7D59-D5ABCA54989FBC6F\')','2017-09-16 07:34:14'),('6F2A1DFB-8002-7D59-D5A833D3CFF28953','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'contentSourceMap6F2A1BA3-8002-7D59-D5A3BFE08D16C000\')','2017-09-16 07:35:40'),('6F2A1F9F-8002-7D59-D5A5C49EDE12C68D','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').purgeCache(name=\'output\',broadcast=false)','2017-09-16 07:35:40'),('6F2A229B-8002-7D59-D5AD78C6127CAA5F','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'contentFilenameArchive6F2A206C-8002-7D59-D5A478C1BC79D958\')','2017-09-16 07:35:40'),('6F333E5C-8002-7D59-D5AD8900535F72EC','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'contentSourceMap6F333C54-8002-7D59-D5AE907A4D60B89A\')','2017-09-16 07:36:40'),('6F333F09-8002-7D59-D5ADFB2784CCB600','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').purgeCache(name=\'output\',broadcast=false)','2017-09-16 07:36:40'),('6F334276-8002-7D59-D5A0FA4AA999B671','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'contentFilenameArchive6F33402A-8002-7D59-D5A8ACCB03037EFC\')','2017-09-16 07:36:40'),('6F44D2B1-8002-7D59-D5AEE4B3C2CFA02F','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'contentSourceMap6F44D09F-8002-7D59-D5AC5A68BCB17849\')','2017-09-16 07:38:35'),('6F88073A-8002-7D59-D5A8AEA72CA56362','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'contentSourceMap6F8800F3-8002-7D59-D5A1A3E6584764C5\')','2017-09-16 07:45:55'),('6F880969-8002-7D59-D5AC48C876347508','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').purgeCache(name=\'output\',broadcast=false)','2017-09-16 07:45:55'),('6F880A63-8002-7D59-D5AF3FC3ADDE6FA5','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'contentManager\').purgeContentCache(contentID=\'6F3A9F8E-8002-7D59-D5A13F05142EDF24\',siteID=\'mediakits\',broadcast=false)','2017-09-16 07:45:55'),('6F8811DD-8002-7D59-D5A5F8DDDED29F95','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'contentFilenameArchive6F880D3C-8002-7D59-D5A68C0B4E51A8B9\')','2017-09-16 07:45:56'),('6F981DFA-8002-7D59-D5AD14C1F9378F89','1FE7C959-8002-7D59-D5AE78F6AC3D63E7','getBean(\'settingsManager\').remoteReload()','2017-09-16 07:47:41'),('776597B4-8002-7D59-D5A2B28F307EC3D3','6E6A8162-8002-7D59-D5A859268DF6BBA3','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'contentSourceMap7765889A-8002-7D59-D5A2349BA3252A08\')','2017-09-16 11:25:51'),('776597CB-8002-7D59-D5AE91264EEEF4FD','70ED8AA9-8002-7D59-D5AFCDC2C67B2D3B','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'contentSourceMap7765889A-8002-7D59-D5A2349BA3252A08\')','2017-09-16 11:25:51'),('77659B6E-8002-7D59-D5A08D31BC7E485A','6E6A8162-8002-7D59-D5A859268DF6BBA3','getBean(\'settingsManager\').getSite(\'mediakits\').purgeCache(name=\'output\',broadcast=false)','2017-09-16 11:25:52'),('77659B8E-8002-7D59-D5A153391DDEE514','70ED8AA9-8002-7D59-D5AFCDC2C67B2D3B','getBean(\'settingsManager\').getSite(\'mediakits\').purgeCache(name=\'output\',broadcast=false)','2017-09-16 11:25:52'),('7765AD30-8002-7D59-D5A3287152A4275C','6E6A8162-8002-7D59-D5A859268DF6BBA3','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'contentFilenameArchive77659CC3-8002-7D59-D5A707DC8820B65D\')','2017-09-16 11:25:52'),('7765AD48-8002-7D59-D5A6A291E4538D66','70ED8AA9-8002-7D59-D5AFCDC2C67B2D3B','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'contentFilenameArchive77659CC3-8002-7D59-D5A707DC8820B65D\')','2017-09-16 11:25:52'),('778B436F-8002-7D59-D5A43758A1FB557C','6E6A8162-8002-7D59-D5A859268DF6BBA3','getBean(\'settingsManager\').remoteReload()','2017-09-16 11:29:58'),('778B438B-8002-7D59-D5A9407BA53189F8','70ED8AA9-8002-7D59-D5AFCDC2C67B2D3B','getBean(\'settingsManager\').remoteReload()','2017-09-16 11:29:58');
/*!40000 ALTER TABLE `tclustercommands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tclusterpeers`
--

DROP TABLE IF EXISTS `tclusterpeers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tclusterpeers` (
  `instanceID` char(35) NOT NULL DEFAULT '',
  PRIMARY KEY (`instanceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tclusterpeers`
--

LOCK TABLES `tclusterpeers` WRITE;
/*!40000 ALTER TABLE `tclusterpeers` DISABLE KEYS */;
INSERT INTO `tclusterpeers` VALUES ('77472098-8002-7D59-D5A8344AC7C69E4D');
/*!40000 ALTER TABLE `tclusterpeers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcontent`
--

DROP TABLE IF EXISTS `tcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontent` (
  `TContent_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SiteID` varchar(25) DEFAULT NULL,
  `ModuleID` char(35) DEFAULT NULL,
  `ParentID` char(35) DEFAULT NULL,
  `ContentID` char(35) DEFAULT NULL,
  `ContentHistID` char(35) DEFAULT NULL,
  `RemoteID` varchar(255) DEFAULT NULL,
  `remoteurl` text,
  `RemotePubDate` varchar(50) DEFAULT NULL,
  `remotesourceurl` text,
  `remotesource` text,
  `Credits` varchar(255) DEFAULT NULL,
  `FileID` char(35) DEFAULT NULL,
  `Template` varchar(50) DEFAULT NULL,
  `Type` varchar(25) DEFAULT NULL,
  `subType` varchar(25) DEFAULT NULL,
  `Active` tinyint(3) DEFAULT '0',
  `OrderNo` int(10) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(255) DEFAULT NULL,
  `Summary` longtext,
  `Filename` varchar(255) DEFAULT NULL,
  `metadesc` text,
  `metakeywords` text,
  `Body` longtext,
  `lastUpdate` datetime DEFAULT NULL,
  `lastUpdateBy` varchar(50) DEFAULT NULL,
  `lastUpdateByID` varchar(50) DEFAULT NULL,
  `DisplayStart` datetime DEFAULT NULL,
  `DisplayStop` datetime DEFAULT NULL,
  `Display` tinyint(3) DEFAULT NULL,
  `Approved` tinyint(3) DEFAULT NULL,
  `IsNav` tinyint(3) DEFAULT NULL,
  `Restricted` tinyint(3) DEFAULT NULL,
  `restrictgroups` text,
  `Target` varchar(50) DEFAULT NULL,
  `targetparams` text,
  `responseChart` tinyint(3) DEFAULT NULL,
  `responseMessage` longtext,
  `responsesendto` text,
  `responsedisplayfields` text,
  `moduleassign` text,
  `displayTitle` tinyint(3) DEFAULT NULL,
  `notes` text,
  `inheritObjects` varchar(25) DEFAULT NULL,
  `isFeature` tinyint(3) DEFAULT NULL,
  `ReleaseDate` datetime DEFAULT NULL,
  `IsLocked` tinyint(3) DEFAULT NULL,
  `nextN` int(10) DEFAULT NULL,
  `sortBy` varchar(50) DEFAULT NULL,
  `sortDirection` varchar(50) DEFAULT NULL,
  `featureStart` datetime DEFAULT NULL,
  `featureStop` datetime DEFAULT NULL,
  `forceSSL` tinyint(3) NOT NULL DEFAULT '0',
  `audience` text,
  `keypoints` text,
  `searchExclude` tinyint(3) DEFAULT NULL,
  `path` text,
  `tags` text,
  `doCache` tinyint(3) DEFAULT NULL,
  `urltitle` varchar(255) DEFAULT NULL,
  `htmltitle` text,
  `created` datetime DEFAULT NULL,
  `mobileExclude` tinyint(3) DEFAULT NULL,
  `changesetID` char(35) DEFAULT NULL,
  `imageSize` varchar(50) DEFAULT NULL,
  `imageHeight` varchar(15) DEFAULT NULL,
  `imageWidth` varchar(15) DEFAULT NULL,
  `childTemplate` varchar(50) DEFAULT NULL,
  `majorVersion` int(11) DEFAULT NULL,
  `minorVersion` int(11) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `displayInterval` varchar(200) DEFAULT NULL,
  `objectParams` text,
  PRIMARY KEY (`TContent_ID`),
  KEY `IX_TContent` (`ContentID`),
  KEY `IX_TContent_1` (`ContentHistID`),
  KEY `IX_TContent_2` (`SiteID`),
  KEY `IX_TContent_3` (`ParentID`),
  KEY `IX_TContent_4` (`RemoteID`),
  KEY `IX_TContent_5` (`ModuleID`),
  KEY `IX_tcontent_mobileExclude` (`mobileExclude`),
  KEY `IX_tcontent_changesetID` (`changesetID`),
  KEY `IX_tcontent_urltitle` (`urltitle`),
  KEY `IX_tcontent_displaystart` (`DisplayStart`),
  KEY `IX_tcontent_displaystop` (`DisplayStop`),
  KEY `IX_tcontent_approved` (`Approved`),
  KEY `IX_tcontent_active` (`Active`),
  KEY `IX_tcontent_display` (`Display`),
  KEY `IX_tcontent_isfeature` (`isFeature`),
  KEY `IX_tcontent_type` (`Type`),
  KEY `IX_tcontent_filename` (`Filename`),
  KEY `IX_tcontent_title` (`Title`),
  KEY `IX_tcontent_subtype` (`subType`),
  KEY `IX_tcontent_isnav` (`IsNav`),
  KEY `ntID_Type_subType_Display_DisplayStart_DisplayStop_mobileExclude` (`SiteID`,`Active`,`Approved`,`IsNav`,`ModuleID`,`searchExclude`,`ContentID`,`Type`,`subType`,`Display`,`DisplayStart`,`DisplayStop`,`mobileExclude`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontent`
--

LOCK TABLES `tcontent` WRITE;
/*!40000 ALTER TABLE `tcontent` DISABLE KEYS */;
INSERT INTO `tcontent` VALUES (1,'default','00000000000000000000000000000000003','00000000000000000000000000000000END','00000000000000000000000000000000003','6300ED4A-1320-5CC3-F9D6A2D279E386D0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Components','Components',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'Components','Components',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(2,'default','00000000000000000000000000000000004','00000000000000000000000000000000END','00000000000000000000000000000000004','6300ED59-1320-5CC3-F9706221E0EFF7A2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Forms','Forms',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,'Forms','Forms',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(3,'default','00000000000000000000000000000000000','00000000000000000000000000000000END','00000000000000000000000000000000001','6300ED69-1320-5CC3-F922E3012E2C6BAE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default.cfm','Page','Default',0,1,'Home','Home',NULL,NULL,NULL,NULL,NULL,'2017-09-09 11:29:55','System',NULL,NULL,NULL,1,1,1,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Cascade',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001',NULL,NULL,'Home','Home','2017-09-09 11:29:55',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(4,'default','00000000000000000000000000000000006','00000000000000000000000000000000END','00000000000000000000000000000000006','6300ED79-1320-5CC3-F92E6325C26664B6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Advertising','Advertising',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Advertising',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(5,'default','00000000000000000000000000000000000','00000000000000000000000000000000END','00000000000000000000000000000000000','6300ED88-1320-5CC3-F9E241684D21FEC9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Site Manager','Site Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Site Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(6,'default','00000000000000000000000000000000008','00000000000000000000000000000000END','00000000000000000000000000000000008','6300ED98-1320-5CC3-F9398EB23A57CBD0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Site Members','Site Members',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Site Members',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(7,'default','00000000000000000000000000000000005','00000000000000000000000000000000END','00000000000000000000000000000000005','6300EDA8-1320-5CC3-F93DF074187C935E',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Email Broadcaster','Email Broadcaster',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Email Broadcaster',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(8,'default','00000000000000000000000000000000009','00000000000000000000000000000000END','00000000000000000000000000000000009','6300EDB7-1320-5CC3-F9D664F38EBBD2D0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Mailing Lists','Mailing Lists',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Mailing Lists',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(9,'default','00000000000000000000000000000000010','00000000000000000000000000000000END','00000000000000000000000000000000010','6300EDC7-1320-5CC3-F9DB8034C9626B70',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Categories','Categories',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Categories',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(10,'default','00000000000000000000000000000000011','00000000000000000000000000000000END','00000000000000000000000000000000011','6300EDD6-1320-5CC3-F9625545444B880F',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Collections Manager','Collections Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Content Collections',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(11,'default','00000000000000000000000000000000012','00000000000000000000000000000000END','00000000000000000000000000000000012','6300EDE6-1320-5CC3-F94E2FCEF5DE046D',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Filemanager Manager','Filemanager Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Filemanager Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(12,'default','00000000000000000000000000000000014','00000000000000000000000000000000END','00000000000000000000000000000000014','0F141D3C-8002-7D59-D5A62D9ACCCB27F6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','default',1,NULL,'Content Staging Manager','Content Staging Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(13,'default','00000000000000000000000000000000015','00000000000000000000000000000000END','00000000000000000000000000000000015','0F161D57-8002-7D59-D5AC8CF3E70F2640',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','default',1,NULL,'Comments Manager','Comments Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'default','00000000000000000000000000000000099','00000000000000000000000000000000END','00000000000000000000000000000000099','0F161F09-8002-7D59-D5ADB04F47DE30D2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','default',1,NULL,'Remote Variations','Remote Variations',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'default','00000000000000000000000000000000000','00000000000000000000000000000000END','00000000000000000000000000000000001','105EFBA5-8002-7D59-D5ABB1E5FD8165F5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default.cfm','Page','Default',1,1,'Home','Home',NULL,NULL,NULL,NULL,'<p>this is media kits home page</p>','2017-09-09 12:06:46','Admin User','0F0D96E2-8002-7D59-D5AE0B7065A84EE1',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Cascade',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001',NULL,1,'Home','Home','2017-09-09 11:29:55',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,NULL,'{}'),(16,'mediakits','00000000000000000000000000000000003','00000000000000000000000000000000END','00000000000000000000000000000000003','1264D2BC-8002-7D59-D5A7C70D5817A52B',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Components','Components',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'mediakits','00000000000000000000000000000000004','00000000000000000000000000000000END','00000000000000000000000000000000004','1264D2E6-8002-7D59-D5AEDF696E76930C',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Forms','Forms',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000END','00000000000000000000000000000000001','1264D2F8-8002-7D59-D5A9381473EA3DE0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default.cfm','Page','Default',0,1,'Home','Home',NULL,NULL,NULL,NULL,NULL,'2017-09-09 13:03:20','System',NULL,NULL,NULL,1,1,1,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Cascade',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001',NULL,NULL,NULL,NULL,'2017-09-09 13:03:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'mediakits','00000000000000000000000000000000006','00000000000000000000000000000000END','00000000000000000000000000000000006','1264D552-8002-7D59-D5A7C10667F56CAB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Advertisement Manager','Advertisement Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000END','00000000000000000000000000000000000','1264D562-8002-7D59-D5AC46E81DC7A844',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Content Manager','Content Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'mediakits','00000000000000000000000000000000008','00000000000000000000000000000000END','00000000000000000000000000000000008','1264D56F-8002-7D59-D5A11D25F217D00A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Public User Manager','Public User Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'mediakits','00000000000000000000000000000000005','00000000000000000000000000000000END','00000000000000000000000000000000005','1264D593-8002-7D59-D5AA80695CB537E8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Email Broadcaster','Email Broadcaster',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'mediakits','00000000000000000000000000000000009','00000000000000000000000000000000END','00000000000000000000000000000000009','1264D5AD-8002-7D59-D5A3D51DBDA71F9D',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Mailing List Manager','Mailing List Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'mediakits','00000000000000000000000000000000010','00000000000000000000000000000000END','00000000000000000000000000000000010','1264D5C8-8002-7D59-D5A0701729AF29C9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Category Manager','Category Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'mediakits','00000000000000000000000000000000011','00000000000000000000000000000000END','00000000000000000000000000000000011','1264D601-8002-7D59-D5AB95F5DD0C5A54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Collections Manager','Collections Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'mediakits','00000000000000000000000000000000012','00000000000000000000000000000000END','00000000000000000000000000000000012','1264D60F-8002-7D59-D5AB6A5EF9C45076',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Filemanager Manager','Filemanager Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'mediakits','00000000000000000000000000000000014','00000000000000000000000000000000END','00000000000000000000000000000000014','1264D618-8002-7D59-D5A5BFC5ADD1C3B3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Content Staging Manager','Content Staging Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'mediakits','00000000000000000000000000000000015','00000000000000000000000000000000END','00000000000000000000000000000000015','1264D621-8002-7D59-D5A570AA070665E5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Comments Manager','Comments Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'mediakits','00000000000000000000000000000000099','00000000000000000000000000000000END','00000000000000000000000000000000099','1264D62D-8002-7D59-D5A1C567959C1743',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Remote Variations','Remote Variations',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000END','00000000000000000000000000000000001','3833FE25-8002-7D59-D5AB63D4D5EDE98D',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default.cfm','Page','Default',0,1,'Home','Home',NULL,NULL,NULL,NULL,'<p></p>','2017-09-10 06:40:34','Admin User','0F0D96E2-8002-7D59-D5AE0B7065A84EE1',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Cascade',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001',NULL,1,'home','Home','2017-09-09 13:03:20',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,NULL,'{}'),(32,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000END','00000000000000000000000000000000001','3A8FB57B-8002-7D59-D5A6579BB8B83A19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'one_column.cfm','Page','Default',1,1,'Home','Home',NULL,NULL,NULL,NULL,NULL,'2017-09-10 07:46:30','Admin User','0F0D96E2-8002-7D59-D5AE0B7065A84EE1',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Cascade',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001',NULL,1,'home','Home','2017-09-09 13:03:20',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,NULL,'{}'),(33,'default','3761007E-8002-7D59-D5AFEB2410038817','3761007E-8002-7D59-D5AFEB2410038817','3761007E-8002-7D59-D5AFEB2410038817','3761007E-8002-7D59-D5AFEB2410038817',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Plugin','Default',1,NULL,'MuraFW1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'mediakits','3761007E-8002-7D59-D5AFEB2410038817','3761007E-8002-7D59-D5AFEB2410038817','3761007E-8002-7D59-D5AFEB2410038817','3761007E-8002-7D59-D5AFEB2410038817',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Plugin','Default',1,NULL,'MuraFW1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'default','1EFF5432-8002-7D59-D5A86C7370331ECA','1EFF5432-8002-7D59-D5A86C7370331ECA','1EFF5432-8002-7D59-D5A86C7370331ECA','1EFF5432-8002-7D59-D5A86C7370331ECA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Plugin','Default',1,NULL,'mediakitsFunctions',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'mediakits','1EFF5432-8002-7D59-D5A86C7370331ECA','1EFF5432-8002-7D59-D5A86C7370331ECA','1EFF5432-8002-7D59-D5A86C7370331ECA','1EFF5432-8002-7D59-D5A86C7370331ECA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Plugin','Default',1,NULL,'mediakitsFunctions',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','1F2DB22B-8002-7D59-D5A4B433710E9317','1F34E9D3-8002-7D59-D5A5A0ADE622883D',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Page','Default',0,1,'Login','Login',NULL,'login',NULL,NULL,'<p>this is the login page</p>','2017-09-14 18:19:53','patrick tisdael','12E22ED3-8002-7D59-D5AB9990790141AB',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,1F2DB22B-8002-7D59-D5A4B433710E9317',NULL,1,'login','Login','2017-09-14 18:19:53',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(38,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','1F2DB22B-8002-7D59-D5A4B433710E9317','1F3A7FE9-8002-7D59-D5AF25CB5DE88DCB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Page','Default',0,1,'Login','Login',NULL,'login',NULL,NULL,'<p>this is the login page</p>','2017-09-14 18:20:30','patrick tisdael','12E22ED3-8002-7D59-D5AB9990790141AB',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,1F2DB22B-8002-7D59-D5A4B433710E9317',NULL,1,'login','Login','2017-09-14 18:19:53',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(39,'mediakits','00000000000000000000000000000000004','00000000000000000000000000000000004','1F499EE9-8002-7D59-D5A158FCAA216B12','1F6B079A-8002-7D59-D5A054960833F4FF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Form','Default',1,1,'Login Form','Login Form',NULL,'/login-form',NULL,NULL,'{\"form\":{\"datecreate\":\"\",\"fields\":{\"1F4C4880-8002-7D59-D5AB9DD293903119\":{\"fieldid\":\"1F4C4880-8002-7D59-D5AB9DD293903119\",\"sectionid\":\"00000000-0000-0000-0000000000000000\",\"validatemessage\":\"\",\"fieldtype\":{\"fieldtypeid\":\"1F4C4923-8002-7D59-D5A81AC6A59FB757\",\"islong\":0,\"datecreate\":\"\",\"fieldtype\":\"textfield\",\"IsMultiSelect\":0,\"moduleid\":\"\",\"isdata\":0,\"datelastupdate\":\"\",\"rblabel\":\"\",\"label\":\"\",\"displaytype\":\"field\",\"bean\":\"\"},\"relatedid\":\"\",\"rblabel\":\"\",\"value\":\"\",\"config\":{},\"isrequired\":\"1\",\"label\":\"Username\",\"type\":\"COMMON\",\"fieldtypeid\":\"\",\"datecreate\":\"\",\"cssstyle\":\"\",\"datelastupdate\":\"\",\"validateregex\":\"\",\"formid\":\"1F499EE9-8002-7D59-D5A158FCAA216B12\",\"isactive\":1,\"name\":\"username\",\"placeholder\":\"\",\"islocked\":0,\"validatetype\":\"email\",\"datasetid\":\"\",\"remoteid\":\"\",\"tooltip\":\"\",\"isdeleted\":0,\"orderno\":0,\"isentrytype\":\"SINGLE\",\"params\":\"\",\"isdirty\":1,\"size\":\"20\"},\"1F4D8F2A-8002-7D59-D5A475250CA68AD2\":{\"fieldid\":\"1F4D8F2A-8002-7D59-D5A475250CA68AD2\",\"sectionid\":\"00000000-0000-0000-0000000000000000\",\"validatemessage\":\"\",\"fieldtype\":{\"fieldtypeid\":\"1F4D8F8B-8002-7D59-D5ACD3475EB8E232\",\"islong\":0,\"datecreate\":\"\",\"fieldtype\":\"textfield\",\"IsMultiSelect\":0,\"moduleid\":\"\",\"isdata\":0,\"datelastupdate\":\"\",\"rblabel\":\"\",\"label\":\"\",\"displaytype\":\"field\",\"bean\":\"\"},\"relatedid\":\"\",\"rblabel\":\"\",\"value\":\"\",\"config\":{},\"isrequired\":\"1\",\"label\":\"Password\",\"type\":\"COMMON\",\"fieldtypeid\":\"\",\"datecreate\":\"\",\"cssstyle\":\"\",\"datelastupdate\":\"\",\"validateregex\":\"\",\"formid\":\"1F499EE9-8002-7D59-D5A158FCAA216B12\",\"isactive\":1,\"name\":\"password\",\"placeholder\":\"\",\"islocked\":0,\"validatetype\":\"\",\"datasetid\":\"\",\"remoteid\":\"\",\"tooltip\":\"\",\"isdeleted\":0,\"orderno\":0,\"isentrytype\":\"SINGLE\",\"params\":\"\",\"isdirty\":1},\"1F5BFB11-8002-7D59-D5AED6737EC09595\":{\"fieldid\":\"1F5BFB11-8002-7D59-D5AED6737EC09595\",\"sectionid\":\"00000000-0000-0000-0000000000000000\",\"validatemessage\":\"\",\"fieldtype\":{\"fieldtypeid\":\"1F5BFB50-8002-7D59-D5A95C7CF5C61A07\",\"islong\":0,\"datecreate\":\"\",\"fieldtype\":\"section\",\"IsMultiSelect\":0,\"moduleid\":\"\",\"isdata\":0,\"datelastupdate\":\"\",\"rblabel\":\"\",\"label\":\"\",\"displaytype\":\"section\",\"bean\":\"\"},\"relatedid\":\"\",\"rblabel\":\"\",\"value\":\"\",\"config\":{},\"isrequired\":0,\"label\":\"New Section\",\"type\":\"COMMON\",\"fieldtypeid\":\"\",\"datecreate\":\"\",\"cssstyle\":\"\",\"datelastupdate\":\"\",\"validateregex\":\"\",\"formid\":\"1F499EE9-8002-7D59-D5A158FCAA216B12\",\"isactive\":1,\"name\":\"\",\"placeholder\":\"\",\"islocked\":0,\"validatetype\":\"\",\"datasetid\":\"\",\"remoteid\":\"\",\"tooltip\":\"\",\"isdeleted\":0,\"orderno\":0,\"isentrytype\":\"SINGLE\",\"params\":\"\"}},\"pages\":[[\"1F5BFB11-8002-7D59-D5AED6737EC09595\",\"1F4D8F2A-8002-7D59-D5A475250CA68AD2\",\"1F4C4880-8002-7D59-D5AB9DD293903119\"]],\"statuscode\":0,\"datelastupdate\":\"\",\"formattributes\":{},\"siteid\":\"\",\"formid\":\"1F499EE9-8002-7D59-D5A158FCAA216B12\",\"isactive\":0,\"name\":\"\",\"config\":{},\"notes\":\"\",\"remoteid\":\"\",\"iscurrent\":0,\"package\":\"\",\"deletedfields\":{},\"fieldorder\":[],\"isdirty\":1,\"issortchanged\":1},\"datasets\":{}}','2017-09-14 18:25:48','patrick tisdael','12E22ED3-8002-7D59-D5AB9990790141AB',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000004,1F499EE9-8002-7D59-D5A158FCAA216B12',NULL,1,'Login Form','Login Form','2017-09-14 18:25:48',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(40,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','1F2DB22B-8002-7D59-D5A4B433710E9317','208E2C35-8002-7D59-D5A0D48D923CF050',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Page','Default',0,5,'Login','Login',NULL,'influencer-login',NULL,NULL,'<p>this is the login page</p><div data-object=\"app3\" data-objectname=\"mediakitsFunctions App3\" data-objecticonclass=\"mi-leaf\" data-async=\"true\" data-instanceid=\"59E952A2-BF0F-429F-8E0D9F0FEA8AE3B7\" class=\"mura-async-object mura-object mura-object-select\" data-objectid=\"7F39D4A2-A7D4-4F9D-B9F493993888D821\" style=\"\" data-inited=\"true\" data-app3message=\"This is a message from configurator\" data-configureddts=\"{ts \'2017-09-14 18:51:12\'}\" data-configuredby=\"tisdael, patrick\"></div>','2017-09-14 18:57:36','patrick tisdael','12E22ED3-8002-7D59-D5AB9990790141AB',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,1F2DB22B-8002-7D59-D5A4B433710E9317',NULL,1,'login','Login','2017-09-14 18:19:53',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(41,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','6EEACB44-8002-7D59-D5AB4ED1ED9630F0','6EF61130-8002-7D59-D5A8324292446196',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Folder','Default',1,5,'Influencer Search','Influencer Search',NULL,'influencer-search',NULL,NULL,NULL,'2017-09-16 07:29:59','Admin User','0F0D96E2-8002-7D59-D5AE0B7065A84EE1',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,6EEACB44-8002-7D59-D5AB4ED1ED9630F0',NULL,1,'influencer-search','Influencer Search','2017-09-16 07:29:59',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(42,'mediakits','00000000000000000000000000000000000','6EEACB44-8002-7D59-D5AB4ED1ED9630F0','6EF918AD-8002-7D59-D5A005F15DBEFBB4','6F0BDC56-8002-7D59-D5AEAAEE08BC73BF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Page','Default',1,2,'Influencer Search Results','Influencer Search Results',NULL,'influencer-search/influencer-search-results',NULL,NULL,'<p>this is the influencer search result</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>you can click on an influencer and see public display if you are not logged in, but is there logged in view for another influencer</p>','2017-09-16 07:32:22','Admin User','0F0D96E2-8002-7D59-D5AE0B7065A84EE1',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,6EEACB44-8002-7D59-D5AB4ED1ED9630F0,6EF918AD-8002-7D59-D5A005F15DBEFBB4',NULL,1,'influencer-search-results','Influencer Search Results','2017-09-16 07:32:22',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(44,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','6F103AB2-8002-7D59-D5AC42C0CD198BFE','6F1CCAF8-8002-7D59-D5AEC292BA2D82B4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Folder','Default',1,4,'Influnencers','Influnencers',NULL,'influnencers',NULL,NULL,'<p>this is the influencer home page - updates, plugs, announcements</p>','2017-09-16 07:34:13','Admin User','0F0D96E2-8002-7D59-D5AE0B7065A84EE1',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,6F103AB2-8002-7D59-D5AC42C0CD198BFE',NULL,1,'influnencers','Influnencers','2017-09-16 07:33:04',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(45,'mediakits','00000000000000000000000000000000000','6F103AB2-8002-7D59-D5AC42C0CD198BFE','6F2201C0-8002-7D59-D5ACBC8DB846DE4C','6F2A0E14-8002-7D59-D5A7242281B5FD5F',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Page','Default',1,2,'Profile','Profile',NULL,'influnencers/profile',NULL,NULL,'<p>this is the influencer profile page</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>you can update all influncer meta data on this page</p>','2017-09-16 07:35:40','Admin User','0F0D96E2-8002-7D59-D5AE0B7065A84EE1',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,6F103AB2-8002-7D59-D5AC42C0CD198BFE,6F2201C0-8002-7D59-D5ACBC8DB846DE4C',NULL,1,'profile','Profile','2017-09-16 07:35:39',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(46,'mediakits','00000000000000000000000000000000000','6F103AB2-8002-7D59-D5AC42C0CD198BFE','6F2FC6A2-8002-7D59-D5A33D1D5827A439','6F333604-8002-7D59-D5A67482172CAA51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Page','Default',1,1,'Generate Media kit','Generate Media kit',NULL,'influnencers/generate-media-kit',NULL,NULL,NULL,'2017-09-16 07:36:40','Admin User','0F0D96E2-8002-7D59-D5AE0B7065A84EE1',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,6F103AB2-8002-7D59-D5AC42C0CD198BFE,6F2FC6A2-8002-7D59-D5A33D1D5827A439',NULL,1,'generate-media-kit','Generate Media kit','2017-09-16 07:36:39',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(48,'mediakits','00000000000000000000000000000000000','6EEACB44-8002-7D59-D5AB4ED1ED9630F0','6F3A9F8E-8002-7D59-D5A13F05142EDF24','6F87F934-8002-7D59-D5AD745A37815C6F',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Page','Default',1,1,'Influencers Public Display','Influencers Public Display',NULL,'influencer-search/influencers-public-display',NULL,NULL,'<p>not 100% sure what would go on here</p>','2017-09-16 07:45:55','Admin User','0F0D96E2-8002-7D59-D5AE0B7065A84EE1',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,6EEACB44-8002-7D59-D5AB4ED1ED9630F0,6F3A9F8E-8002-7D59-D5A13F05142EDF24',NULL,1,'influencers-public-display','Influencers Public Display','2017-09-16 07:38:35',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(49,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','6FB0373E-8002-7D59-D5A566649FDF266B','6FB49336-8002-7D59-D5AF8DC266A0E5A3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Page','Default',1,3,'Influencer Recruit','Influencer Recruit',NULL,'influencer-recruit',NULL,NULL,'<p>Influencer Recruit</p>','2017-09-16 07:50:47','Admin User','0F0D96E2-8002-7D59-D5AE0B7065A84EE1',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,6FB0373E-8002-7D59-D5A566649FDF266B',NULL,1,'influencer-recruit','Influencer Recruit','2017-09-16 07:50:47',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(50,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','6FB7B168-8002-7D59-D5A13F6EAA3B3A4C','6FBE1324-8002-7D59-D5A385F2D9518F5D',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Page','Default',1,2,'Brand Recruit','Brand Recruit',NULL,'brand-recruit',NULL,NULL,'<p>Brand Recruit</p>','2017-09-16 07:51:50','Admin User','0F0D96E2-8002-7D59-D5AE0B7065A84EE1',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,6FB7B168-8002-7D59-D5A13F6EAA3B3A4C',NULL,1,'brand-recruit','Brand Recruit','2017-09-16 07:51:49',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(51,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','1F2DB22B-8002-7D59-D5A4B433710E9317','6FCC085F-8002-7D59-D5A472ABF21029B6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Page','Default',1,6,'Influencer Login','Influencer Login',NULL,'influencer-login',NULL,NULL,'<p>This&nbsp;the Influencer Login</p>\r\n<div data-object=\"app3\" data-objectname=\"mediakitsFunctions App3\" data-objecticonclass=\"mi-leaf\" data-async=\"true\" data-instanceid=\"59E952A2-BF0F-429F-8E0D9F0FEA8AE3B7\" class=\"mura-async-object mura-object mura-object-select\" data-objectid=\"7F39D4A2-A7D4-4F9D-B9F493993888D821\" style=\"\" data-inited=\"true\" data-app3message=\"This is a message from configurator\" data-configureddts=\"{ts \'2017-09-14 18:51:12\'}\" data-configuredby=\"tisdael, patrick\"></div>','2017-09-16 07:53:21','Admin User','0F0D96E2-8002-7D59-D5AE0B7065A84EE1',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,1F2DB22B-8002-7D59-D5A4B433710E9317',NULL,1,'influencer-login','Influencer Login','2017-09-14 18:19:53',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(52,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','775EABE4-8002-7D59-D5A814DB38D14E15','7765794D-8002-7D59-D5A7F11403BB6CAD',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Page','Default',1,1,'Infuencer Subscribe','Infuencer Subscribe',NULL,'infuencer-subscribe',NULL,NULL,'<p>this will be the influencer subscriber form</p>','2017-09-16 11:25:51','Admin User','0F0D96E2-8002-7D59-D5AE0B7065A84EE1',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,775EABE4-8002-7D59-D5A814DB38D14E15',NULL,1,'infuencer-subscribe','Infuencer Subscribe','2017-09-16 11:25:51',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}');
/*!40000 ALTER TABLE `tcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcontentassignments`
--

DROP TABLE IF EXISTS `tcontentassignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontentassignments` (
  `contentID` char(35) NOT NULL DEFAULT '',
  `contentHistID` char(35) NOT NULL DEFAULT '',
  `siteID` varchar(25) NOT NULL DEFAULT '',
  `userID` char(35) NOT NULL DEFAULT '',
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`contentID`,`contentHistID`,`siteID`,`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontentassignments`
--

LOCK TABLES `tcontentassignments` WRITE;
/*!40000 ALTER TABLE `tcontentassignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcontentassignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcontentcategories`
--

DROP TABLE IF EXISTS `tcontentcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontentcategories` (
  `categoryID` char(35) NOT NULL DEFAULT '',
  `siteID` varchar(25) DEFAULT NULL,
  `parentID` char(35) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `lastUpdate` datetime DEFAULT NULL,
  `lastUpdateBy` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `notes` longtext,
  `isInterestGroup` int(10) DEFAULT NULL,
  `isActive` int(10) DEFAULT NULL,
  `isOpen` int(10) DEFAULT NULL,
  `sortBy` varchar(50) DEFAULT NULL,
  `sortDirection` varchar(50) DEFAULT NULL,
  `restrictGroups` varchar(255) DEFAULT NULL,
  `path` longtext,
  `remoteID` varchar(255) DEFAULT NULL,
  `remoteSourceURL` varchar(255) DEFAULT NULL,
  `remotePubDate` datetime DEFAULT NULL,
  `urltitle` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `isfeatureable` int(10) DEFAULT NULL,
  PRIMARY KEY (`categoryID`),
  KEY `IX_TContentCategories` (`siteID`),
  KEY `IX_category_remoteID` (`remoteID`),
  KEY `IX_tcontentcategories_name` (`name`),
  KEY `IX_tcontentcategories_urltitle` (`urltitle`),
  KEY `IX_tcontentcategories_parentid` (`parentID`),
  KEY `IX_tcontentcategories_filename` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontentcategories`
--

LOCK TABLES `tcontentcategories` WRITE;
/*!40000 ALTER TABLE `tcontentcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcontentcategories` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `tcontentcommentcommenters`
--

DROP TABLE IF EXISTS `tcontentcommentcommenters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontentcommentcommenters` (
  `remoteID` varchar(50) DEFAULT NULL,
  `commenterID` char(35) NOT NULL DEFAULT '',
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`commenterID`),
  KEY `IX_tcontentcommentcommenters_remoteID` (`remoteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontentcommentcommenters`
--

LOCK TABLES `tcontentcommentcommenters` WRITE;
/*!40000 ALTER TABLE `tcontentcommentcommenters` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcontentcommentcommenters` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `tcontentdisplaytitleapprovals`
--

DROP TABLE IF EXISTS `tcontentdisplaytitleapprovals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontentdisplaytitleapprovals` (
  `contentid` char(35) NOT NULL DEFAULT '',
  `isApproved` tinyint(3) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `siteid` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontentdisplaytitleapprovals`
--

LOCK TABLES `tcontentdisplaytitleapprovals` WRITE;
/*!40000 ALTER TABLE `tcontentdisplaytitleapprovals` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcontentdisplaytitleapprovals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcontenteventreminders`
--

DROP TABLE IF EXISTS `tcontenteventreminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontenteventreminders` (
  `contentId` char(35) NOT NULL DEFAULT '',
  `siteId` varchar(35) NOT NULL DEFAULT '',
  `email` varchar(200) NOT NULL DEFAULT '',
  `RemindDate` datetime DEFAULT NULL,
  `RemindHour` int(10) DEFAULT NULL,
  `RemindMinute` int(10) DEFAULT NULL,
  `RemindInterval` int(10) DEFAULT NULL,
  `isSent` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontenteventreminders`
--

LOCK TABLES `tcontenteventreminders` WRITE;
/*!40000 ALTER TABLE `tcontenteventreminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcontenteventreminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcontentfeedadvancedparams`
--

DROP TABLE IF EXISTS `tcontentfeedadvancedparams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontentfeedadvancedparams` (
  `paramID` char(35) NOT NULL DEFAULT '',
  `feedID` char(35) NOT NULL DEFAULT '',
  `param` decimal(18,0) DEFAULT NULL,
  `relationship` varchar(50) DEFAULT NULL,
  `field` varchar(100) DEFAULT NULL,
  `condition` varchar(50) DEFAULT NULL,
  `criteria` varchar(200) DEFAULT NULL,
  `dataType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`paramID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontentfeedadvancedparams`
--

LOCK TABLES `tcontentfeedadvancedparams` WRITE;
/*!40000 ALTER TABLE `tcontentfeedadvancedparams` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcontentfeedadvancedparams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcontentfeeditems`
--

DROP TABLE IF EXISTS `tcontentfeeditems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontentfeeditems` (
  `feedID` char(35) NOT NULL DEFAULT '',
  `itemID` char(35) NOT NULL DEFAULT '',
  `type` varchar(50) DEFAULT NULL,
  KEY `IX_tcontentfeeditems_feedid` (`feedID`),
  KEY `IX_tcontentfeeditems_itemid` (`itemID`),
  KEY `IX_tcontentfeeditems_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontentfeeditems`
--

LOCK TABLES `tcontentfeeditems` WRITE;
/*!40000 ALTER TABLE `tcontentfeeditems` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcontentfeeditems` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `tcontentfilemetadata`
--

DROP TABLE IF EXISTS `tcontentfilemetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontentfilemetadata` (
  `altText` varchar(255) DEFAULT NULL,
  `contenthistid` char(35) DEFAULT '',
  `fileid` char(35) DEFAULT '',
  `credits` text,
  `siteID` varchar(25) DEFAULT '',
  `remoteURL` varchar(255) DEFAULT NULL,
  `exif` text,
  `remoteID` varchar(255) DEFAULT NULL,
  `remoteSourceURL` varchar(255) DEFAULT NULL,
  `remoteSource` varchar(255) DEFAULT NULL,
  `remotePubDate` datetime DEFAULT NULL,
  `metaID` char(35) NOT NULL DEFAULT '',
  `contentid` char(35) DEFAULT '',
  `caption` text,
  PRIMARY KEY (`metaID`),
  KEY `IX_tcontentfilemetadata_contenthistid` (`contenthistid`),
  KEY `IX_tcontentfilemetadata_fileid` (`fileid`),
  KEY `IX_tcontentfilemetadata_siteID` (`siteID`),
  KEY `IX_tcontentfilemetadata_remoteID` (`remoteID`),
  KEY `IX_tcontentfilemetadata_contentid` (`contentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontentfilemetadata`
--

LOCK TABLES `tcontentfilemetadata` WRITE;
/*!40000 ALTER TABLE `tcontentfilemetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcontentfilemetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcontentfilenamearchive`
--

DROP TABLE IF EXISTS `tcontentfilenamearchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontentfilenamearchive` (
  `siteID` varchar(25) DEFAULT '',
  `archiveid` char(35) NOT NULL DEFAULT '',
  `contentID` char(35) DEFAULT '',
  `filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`archiveid`),
  KEY `IX_tcontentfilenamearchive_siteID` (`siteID`),
  KEY `IX_tcontentfilenamearchive_contentID` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontentfilenamearchive`
--

LOCK TABLES `tcontentfilenamearchive` WRITE;
/*!40000 ALTER TABLE `tcontentfilenamearchive` DISABLE KEYS */;
INSERT INTO `tcontentfilenamearchive` VALUES ('mediakits','1F34FC6B-8002-7D59-D5A17F350F41C89F','1F2DB22B-8002-7D59-D5A4B433710E9317','login'),('mediakits','38342E09-8002-7D59-D5AFEBE43EADE019','00000000000000000000000000000000001',NULL),('mediakits','3A8FD6AD-8002-7D59-D5AF35F09F76BA39','00000000000000000000000000000000001',NULL),('mediakits','6EF626A7-8002-7D59-D5A0F019D04A69FF','6EEACB44-8002-7D59-D5AB4ED1ED9630F0','influencer-search'),('mediakits','6F0BEE8C-8002-7D59-D5A070839C64D898','6EF918AD-8002-7D59-D5A005F15DBEFBB4','influencer-search/influencer-search-results'),('mediakits','6F1CF6B6-8002-7D59-D5ABCA54989FBC6F','6F103AB2-8002-7D59-D5AC42C0CD198BFE','influnencers'),('mediakits','6F2A206C-8002-7D59-D5A478C1BC79D958','6F2201C0-8002-7D59-D5ACBC8DB846DE4C','influnencers/profile'),('mediakits','6F33402A-8002-7D59-D5A8ACCB03037EFC','6F2FC6A2-8002-7D59-D5A33D1D5827A439','influnencers/generate-media-kit'),('mediakits','6F880D3C-8002-7D59-D5A68C0B4E51A8B9','6F3A9F8E-8002-7D59-D5A13F05142EDF24','influencer-search/influencers-public-display'),('mediakits','6FB4A0DB-8002-7D59-D5A942BA7C629F2E','6FB0373E-8002-7D59-D5A566649FDF266B','influencer-recruit'),('mediakits','6FBE1EE6-8002-7D59-D5A79DA06E8B36BB','6FB7B168-8002-7D59-D5A13F6EAA3B3A4C','brand-recruit'),('mediakits','6FCC1B44-8002-7D59-D5AE63C5218CC499','1F2DB22B-8002-7D59-D5A4B433710E9317','influencer-login'),('mediakits','77659CC3-8002-7D59-D5A707DC8820B65D','775EABE4-8002-7D59-D5A814DB38D14E15','infuencer-subscribe');
/*!40000 ALTER TABLE `tcontentfilenamearchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcontentobjects`
--

DROP TABLE IF EXISTS `tcontentobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontentobjects` (
  `ContentHistID` char(35) NOT NULL DEFAULT '',
  `ObjectID` varchar(100) NOT NULL DEFAULT '',
  `Object` varchar(50) NOT NULL DEFAULT '',
  `ContentID` char(35) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `OrderNo` int(10) NOT NULL DEFAULT '0',
  `SiteID` varchar(25) DEFAULT NULL,
  `ColumnID` int(10) NOT NULL DEFAULT '0',
  `Params` longtext,
  PRIMARY KEY (`ContentHistID`,`ObjectID`,`Object`,`ColumnID`,`OrderNo`),
  KEY `IX_TContentObjects` (`SiteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontentobjects`
--

LOCK TABLES `tcontentobjects` WRITE;
/*!40000 ALTER TABLE `tcontentobjects` DISABLE KEYS */;
INSERT INTO `tcontentobjects` VALUES ('3833FE25-8002-7D59-D5AB63D4D5EDE98D','00000000000000000000000000000000001','rater','00000000000000000000000000000000001','System',1,'mediakits',2,'{\"object\":\"rater\",\"objectname\":\"System\",\"objecticonclass\":\"mi-cog\",\"inited\":true,\"cssclass\":\"\",\"class\":\"mura-left mura-three mura-offset-by-five\"}'),('3A8FB57B-8002-7D59-D5A6579BB8B83A19','00000000000000000000000000000000001','rater','00000000000000000000000000000000001','System',1,'mediakits',2,'{\"object\":\"rater\",\"objectname\":\"System\",\"objecticonclass\":\"mi-cog\",\"inited\":true,\"cssclass\":\"\",\"class\":\"mura-left mura-three mura-offset-by-five\"}');
/*!40000 ALTER TABLE `tcontentobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcontentpublicsubmissionapprovals`
--

DROP TABLE IF EXISTS `tcontentpublicsubmissionapprovals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontentpublicsubmissionapprovals` (
  `contentID` char(35) NOT NULL DEFAULT '',
  `isApproved` int(10) unsigned NOT NULL,
  `email` varchar(150) NOT NULL,
  `siteID` varchar(25) NOT NULL,
  PRIMARY KEY (`contentID`,`siteID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontentpublicsubmissionapprovals`
--

LOCK TABLES `tcontentpublicsubmissionapprovals` WRITE;
/*!40000 ALTER TABLE `tcontentpublicsubmissionapprovals` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcontentpublicsubmissionapprovals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcontentratings`
--

DROP TABLE IF EXISTS `tcontentratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontentratings` (
  `contentID` char(35) NOT NULL DEFAULT '',
  `userID` char(35) NOT NULL DEFAULT '',
  `siteID` varchar(35) NOT NULL DEFAULT '',
  `rate` int(10) DEFAULT NULL,
  `entered` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`contentID`,`userID`,`siteID`),
  KEY `IDX_ENTERED` (`entered`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontentratings`
--

LOCK TABLES `tcontentratings` WRITE;
/*!40000 ALTER TABLE `tcontentratings` DISABLE KEYS */;
INSERT INTO `tcontentratings` VALUES ('00000000000000000000000000000000001','12E22ED3-8002-7D59-D5AB9990790141AB','mediakits',5,'2017-09-13 00:38:24');
/*!40000 ALTER TABLE `tcontentratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcontentrelated`
--

DROP TABLE IF EXISTS `tcontentrelated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontentrelated` (
  `contentHistID` char(35) NOT NULL DEFAULT '',
  `relatedID` char(35) NOT NULL DEFAULT '',
  `contentID` char(35) NOT NULL DEFAULT '',
  `siteID` varchar(25) NOT NULL DEFAULT '',
  `relatedContentSetID` varchar(35) DEFAULT '00000000000000000000000000000000000',
  `orderNo` int(10) DEFAULT NULL,
  `relatedContentID` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`relatedContentID`),
  KEY `IX_tcontentrelated_relatedID` (`relatedID`),
  KEY `IX_tcontentrelated_contentHistID` (`contentHistID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontentrelated`
--

LOCK TABLES `tcontentrelated` WRITE;
/*!40000 ALTER TABLE `tcontentrelated` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcontentrelated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcontentremotepointer`
--

DROP TABLE IF EXISTS `tcontentremotepointer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontentremotepointer` (
  `siteID` varchar(25) DEFAULT '',
  `remoteid` varchar(50) DEFAULT NULL,
  `remoteurl` varchar(250) DEFAULT NULL,
  `created` varchar(50) DEFAULT NULL,
  `pointerid` char(35) NOT NULL DEFAULT '',
  `contentid` char(35) DEFAULT '',
  PRIMARY KEY (`pointerid`),
  KEY `IX_tcontentremotepointer_siteID` (`siteID`),
  KEY `IX_tcontentremotepointer_remoteid` (`remoteid`),
  KEY `IX_tcontentremotepointer_contentid` (`contentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontentremotepointer`
--

LOCK TABLES `tcontentremotepointer` WRITE;
/*!40000 ALTER TABLE `tcontentremotepointer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcontentremotepointer` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `tcontentsourcemaps` VALUES ('default','2017-09-09 12:06:46','6300ED69-1320-5CC3-F922E3012E2C6BAE','105EFBA5-8002-7D59-D5ABB1E5FD8165F5','105F0438-8002-7D59-D5A80D118EF00ADF','00000000000000000000000000000000001'),('mediakits','2017-09-14 18:19:53','1F34E785-8002-7D59-D5ABC1144EEED968','1F34E9D3-8002-7D59-D5A5A0ADE622883D','1F34F34A-8002-7D59-D5A2E61ED60C22EA','1F2DB22B-8002-7D59-D5A4B433710E9317'),('mediakits','2017-09-14 18:20:30','1F34E9D3-8002-7D59-D5A5A0ADE622883D','1F3A7FE9-8002-7D59-D5AF25CB5DE88DCB','1F3A9A4E-8002-7D59-D5A97F4CAF6EF5FA','1F2DB22B-8002-7D59-D5A4B433710E9317'),('mediakits','2017-09-14 18:25:48','1F6B053C-8002-7D59-D5A7B17B946BCDDE','1F6B079A-8002-7D59-D5A054960833F4FF','1F6B0D79-8002-7D59-D5A8FA018B95EDCB','1F499EE9-8002-7D59-D5A158FCAA216B12'),('mediakits','2017-09-14 18:57:36','1F3A7FE9-8002-7D59-D5AF25CB5DE88DCB','208E2C35-8002-7D59-D5A0D48D923CF050','208E35F0-8002-7D59-D5A7D96D2E1B5CA4','1F2DB22B-8002-7D59-D5A4B433710E9317'),('mediakits','2017-09-10 06:30:56','1264D2F8-8002-7D59-D5A9381473EA3DE0','37DBE275-8002-7D59-D5A7C4603AD5452D','37DBF34F-8002-7D59-D5AC8ED2DBD71722','00000000000000000000000000000000001'),('mediakits','2017-09-10 06:40:34','37DBE275-8002-7D59-D5A7C4603AD5452D','3833FE25-8002-7D59-D5AB63D4D5EDE98D','3834146F-8002-7D59-D5AE3995428E7575','00000000000000000000000000000000001'),('mediakits','2017-09-10 07:46:30','3833FE25-8002-7D59-D5AB63D4D5EDE98D','3A8FB57B-8002-7D59-D5A6579BB8B83A19','3A8FC13A-8002-7D59-D5A01E8882A01A2A','00000000000000000000000000000000001'),('mediakits','2017-09-16 07:29:59','6EF60F48-8002-7D59-D5AF884EBB2CE97C','6EF61130-8002-7D59-D5A8324292446196','6EF6193B-8002-7D59-D5ABD6C162850DAB','6EEACB44-8002-7D59-D5AB4ED1ED9630F0'),('mediakits','2017-09-16 07:32:22','6F0BDA5D-8002-7D59-D5AF7D1C6A28D0EF','6F0BDC56-8002-7D59-D5AEAAEE08BC73BF','6F0BE9CB-8002-7D59-D5A213687AE08DB0','6EF918AD-8002-7D59-D5A005F15DBEFBB4'),('mediakits','2017-09-16 07:34:13','6F125224-8002-7D59-D5A43CF0A0081139','6F1CCAF8-8002-7D59-D5AEC292BA2D82B4','6F1CEC33-8002-7D59-D5ACCB9D1FB88FE0','6F103AB2-8002-7D59-D5AC42C0CD198BFE'),('mediakits','2017-09-16 07:35:40','6F2A0BC6-8002-7D59-D5A079E6505EF026','6F2A0E14-8002-7D59-D5A7242281B5FD5F','6F2A1BA3-8002-7D59-D5A3BFE08D16C000','6F2201C0-8002-7D59-D5ACBC8DB846DE4C'),('mediakits','2017-09-16 07:36:40','6F332B69-8002-7D59-D5AD1A76EEFDE700','6F333604-8002-7D59-D5A67482172CAA51','6F333C54-8002-7D59-D5AE907A4D60B89A','6F2FC6A2-8002-7D59-D5A33D1D5827A439'),('mediakits','2017-09-16 07:45:55','6F44CACD-8002-7D59-D5ADF68502F08423','6F87F934-8002-7D59-D5AD745A37815C6F','6F8800F3-8002-7D59-D5A1A3E6584764C5','6F3A9F8E-8002-7D59-D5A13F05142EDF24'),('mediakits','2017-09-16 07:50:47','6FB48E05-8002-7D59-D5A2214BA2CD5943','6FB49336-8002-7D59-D5AF8DC266A0E5A3','6FB49AE2-8002-7D59-D5AB4B62B0000FAB','6FB0373E-8002-7D59-D5A566649FDF266B'),('mediakits','2017-09-16 07:51:50','6FBE111E-8002-7D59-D5A31AFBBC87E870','6FBE1324-8002-7D59-D5A385F2D9518F5D','6FBE1A1D-8002-7D59-D5AD26D854ECA75B','6FB7B168-8002-7D59-D5A13F6EAA3B3A4C'),('mediakits','2017-09-16 07:53:21','208E2C35-8002-7D59-D5A0D48D923CF050','6FCC085F-8002-7D59-D5A472ABF21029B6','6FCC0FC2-8002-7D59-D5AD6714E5902B57','1F2DB22B-8002-7D59-D5A4B433710E9317'),('mediakits','2017-09-16 11:25:51','7765719E-8002-7D59-D5A5C27E7602B902','7765794D-8002-7D59-D5A7F11403BB6CAD','7765889A-8002-7D59-D5A2349BA3252A08','775EABE4-8002-7D59-D5A814DB38D14E15');
/*!40000 ALTER TABLE `tcontentsourcemaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcontentstats`
--

DROP TABLE IF EXISTS `tcontentstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontentstats` (
  `contentID` char(35) NOT NULL DEFAULT '',
  `siteID` varchar(25) NOT NULL DEFAULT '',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `rating` float NOT NULL DEFAULT '0',
  `totalVotes` int(10) unsigned NOT NULL DEFAULT '0',
  `upVotes` int(10) unsigned NOT NULL DEFAULT '0',
  `downVotes` int(10) unsigned NOT NULL DEFAULT '0',
  `comments` int(10) unsigned NOT NULL DEFAULT '0',
  `majorVersion` int(11) DEFAULT NULL,
  `minorVersion` int(11) DEFAULT NULL,
  `lockID` char(35) DEFAULT NULL,
  `lockType` varchar(50) DEFAULT NULL,
  `disableComments` int(10) DEFAULT '0',
  PRIMARY KEY (`contentID`,`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontentstats`
--

LOCK TABLES `tcontentstats` WRITE;
/*!40000 ALTER TABLE `tcontentstats` DISABLE KEYS */;
INSERT INTO `tcontentstats` VALUES ('00000000000000000000000000000000001','mediakits',0,5,1,1,0,0,0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `tcontentstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcontenttags`
--

DROP TABLE IF EXISTS `tcontenttags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontenttags` (
  `tagID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contentID` char(35) NOT NULL,
  `contentHistID` char(35) NOT NULL,
  `siteID` varchar(25) NOT NULL,
  `tag` varchar(100) NOT NULL,
  `taggroup` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tagID`),
  KEY `Index_2` (`contentHistID`),
  KEY `Index_3` (`siteID`),
  KEY `Index_4` (`contentID`),
  KEY `Index_5` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontenttags`
--

LOCK TABLES `tcontenttags` WRITE;
/*!40000 ALTER TABLE `tcontenttags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcontenttags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcontentvariationtargeting`
--

DROP TABLE IF EXISTS `tcontentvariationtargeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontentvariationtargeting` (
  `targetingid` char(35) NOT NULL DEFAULT '',
  `siteid` varchar(25) DEFAULT '',
  `initjs` text,
  `targetingjs` text,
  `contentid` char(35) DEFAULT '',
  PRIMARY KEY (`targetingid`),
  KEY `IX_tcontentvariationtargeting_siteid` (`siteid`),
  KEY `IX_tcontentvariationtargeting_contentid` (`contentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontentvariationtargeting`
--

LOCK TABLES `tcontentvariationtargeting` WRITE;
/*!40000 ALTER TABLE `tcontentvariationtargeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcontentvariationtargeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tdirectories`
--

DROP TABLE IF EXISTS `tdirectories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tdirectories` (
  `dirID` char(35) NOT NULL DEFAULT '',
  `siteID` varchar(35) DEFAULT NULL,
  `subdir` varchar(255) DEFAULT NULL,
  `editfilename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dirID`),
  KEY `IX_tdirectories_siteID` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tdirectories`
--

LOCK TABLES `tdirectories` WRITE;
/*!40000 ALTER TABLE `tdirectories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdirectories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temailreturnstats`
--

DROP TABLE IF EXISTS `temailreturnstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temailreturnstats` (
  `emailID` char(35) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `url` mediumtext,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temailreturnstats`
--

LOCK TABLES `temailreturnstats` WRITE;
/*!40000 ALTER TABLE `temailreturnstats` DISABLE KEYS */;
/*!40000 ALTER TABLE `temailreturnstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temails`
--

DROP TABLE IF EXISTS `temails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temails` (
  `EmailID` char(35) NOT NULL DEFAULT '',
  `siteid` varchar(25) DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `BodyText` longtext,
  `BodyHtml` longtext,
  `CreatedDate` datetime DEFAULT NULL,
  `DeliveryDate` datetime DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL,
  `GroupList` longtext,
  `LastUpdateBy` varchar(50) DEFAULT NULL,
  `LastUpdateByID` varchar(35) DEFAULT NULL,
  `NumberSent` int(10) NOT NULL DEFAULT '0',
  `ReplyTo` varchar(50) DEFAULT NULL,
  `format` varchar(50) DEFAULT NULL,
  `fromLabel` varchar(50) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `template` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EmailID`),
  KEY `IX_TEmails` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temails`
--

LOCK TABLES `temails` WRITE;
/*!40000 ALTER TABLE `temails` DISABLE KEYS */;
/*!40000 ALTER TABLE `temails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temailstats`
--

DROP TABLE IF EXISTS `temailstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temailstats` (
  `EmailID` char(35) DEFAULT NULL,
  `Email` char(100) DEFAULT NULL,
  `emailOpen` int(10) NOT NULL DEFAULT '0',
  `returnClick` int(10) NOT NULL DEFAULT '0',
  `bounce` int(10) NOT NULL DEFAULT '0',
  `sent` int(10) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temailstats`
--

LOCK TABLES `temailstats` WRITE;
/*!40000 ALTER TABLE `temailstats` DISABLE KEYS */;
/*!40000 ALTER TABLE `temailstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tfiles`
--

DROP TABLE IF EXISTS `tfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tfiles` (
  `fileID` char(35) NOT NULL DEFAULT '',
  `contentID` char(35) DEFAULT NULL,
  `siteID` varchar(25) DEFAULT NULL,
  `moduleID` char(35) DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `image` longblob,
  `imageSmall` longblob,
  `imageMedium` longblob,
  `fileSize` int(10) DEFAULT NULL,
  `contentType` varchar(100) DEFAULT NULL,
  `contentSubType` varchar(200) DEFAULT NULL,
  `fileExt` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `deleted` tinyint(3) DEFAULT NULL,
  `caption` text,
  `credits` varchar(255) DEFAULT NULL,
  `alttext` varchar(255) DEFAULT NULL,
  `remoteID` varchar(255) DEFAULT NULL,
  `remoteURL` varchar(255) DEFAULT NULL,
  `remotePubDate` datetime DEFAULT NULL,
  `remoteSource` varchar(255) DEFAULT NULL,
  `remoteSourceURL` varchar(255) DEFAULT NULL,
  `exif` text,
  PRIMARY KEY (`fileID`),
  KEY `IX_tfiles_siteid` (`siteID`),
  KEY `IX_tfiles_contentid` (`contentID`),
  KEY `IX_tfiles_remoteid` (`remoteID`),
  KEY `IX_tfiles_moduleid` (`moduleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tfiles`
--

LOCK TABLES `tfiles` WRITE;
/*!40000 ALTER TABLE `tfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tformresponsepackets`
--

DROP TABLE IF EXISTS `tformresponsepackets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tformresponsepackets` (
  `ResponseID` char(35) NOT NULL DEFAULT '',
  `FormID` char(35) DEFAULT NULL,
  `SiteID` varchar(25) DEFAULT NULL,
  `FieldList` longtext,
  `Data` longtext,
  `Entered` datetime DEFAULT NULL,
  PRIMARY KEY (`ResponseID`),
  KEY `IX_TFormResponsePackets` (`FormID`,`SiteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tformresponsepackets`
--

LOCK TABLES `tformresponsepackets` WRITE;
/*!40000 ALTER TABLE `tformresponsepackets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tformresponsepackets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tformresponsequestions`
--

DROP TABLE IF EXISTS `tformresponsequestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tformresponsequestions` (
  `responseID` char(35) DEFAULT NULL,
  `formID` char(35) DEFAULT NULL,
  `formField` varchar(50) DEFAULT NULL,
  `formValue` longtext,
  `pollValue` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tformresponsequestions`
--

LOCK TABLES `tformresponsequestions` WRITE;
/*!40000 ALTER TABLE `tformresponsequestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tformresponsequestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timagesizes`
--

DROP TABLE IF EXISTS `timagesizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timagesizes` (
  `sizeID` char(35) NOT NULL DEFAULT '',
  `siteID` varchar(35) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `height` varchar(10) DEFAULT NULL,
  `width` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sizeID`),
  KEY `IX_timagesizes_siteID` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timagesizes`
--

LOCK TABLES `timagesizes` WRITE;
/*!40000 ALTER TABLE `timagesizes` DISABLE KEYS */;
INSERT INTO `timagesizes` VALUES ('0F18139F-8002-7D59-D5AA5A2AD5EC0979','default','carouselimage','500','1200'),('126DE320-8002-7D59-D5A95C7CC1184C33','mediakits','carouselimage','500','1200');
/*!40000 ALTER TABLE `timagesizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmailinglist`
--

DROP TABLE IF EXISTS `tmailinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmailinglist` (
  `MLID` char(35) DEFAULT NULL,
  `SiteID` varchar(25) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Description` longtext,
  `LastUpdate` datetime DEFAULT NULL,
  `isPurge` int(10) DEFAULT NULL,
  `isPublic` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmailinglist`
--

LOCK TABLES `tmailinglist` WRITE;
/*!40000 ALTER TABLE `tmailinglist` DISABLE KEYS */;
INSERT INTO `tmailinglist` VALUES ('0F0D9A42-8002-7D59-D5A182D14929D3D3','default','Please Remove Me from All Lists','','2017-09-09 11:29:55',1,1),('1264D9E8-8002-7D59-D5AF64A5A6B6F47E','mediakits','Please Remove Me from All Lists',NULL,'2017-09-09 13:03:20',1,1);
/*!40000 ALTER TABLE `tmailinglist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmailinglistmembers`
--

DROP TABLE IF EXISTS `tmailinglistmembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmailinglistmembers` (
  `MLID` char(35) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `SiteID` varchar(25) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `isVerified` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmailinglistmembers`
--

LOCK TABLES `tmailinglistmembers` WRITE;
/*!40000 ALTER TABLE `tmailinglistmembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmailinglistmembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toauthclients`
--

DROP TABLE IF EXISTS `toauthclients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `toauthclients` (
  `clientsecret` varchar(100) DEFAULT NULL,
  `siteid` varchar(25) NOT NULL DEFAULT '',
  `granttype` varchar(50) DEFAULT 'basic',
  `userid` char(35) DEFAULT '',
  `clientid` char(35) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL,
  `created` datetime DEFAULT NULL,
  `lastupdate` datetime DEFAULT NULL,
  `description` text,
  `redirecturl` text,
  `lastupdatebidy` varchar(35) DEFAULT NULL,
  `lastupdateby` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`clientid`),
  KEY `IX_toauthclients_siteid` (`siteid`),
  KEY `IX_toauthclients_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toauthclients`
--

LOCK TABLES `toauthclients` WRITE;
/*!40000 ALTER TABLE `toauthclients` DISABLE KEYS */;
/*!40000 ALTER TABLE `toauthclients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toauthtokens`
--

DROP TABLE IF EXISTS `toauthtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `toauthtokens` (
  `data` text,
  `expires` datetime NOT NULL,
  `granttype` varchar(50) DEFAULT 'client_credentials',
  `userid` char(35) DEFAULT '',
  `token` char(35) NOT NULL DEFAULT '',
  `clientid` char(35) NOT NULL DEFAULT '',
  `accessCode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`token`),
  KEY `IX_toauthtokens_userid` (`userid`),
  KEY `IX_toauthtokens_clientid` (`clientid`),
  KEY `IX_toauthtokens_accessCode` (`accessCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toauthtokens`
--

LOCK TABLES `toauthtokens` WRITE;
/*!40000 ALTER TABLE `toauthtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `toauthtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpermissions`
--

DROP TABLE IF EXISTS `tpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpermissions` (
  `ContentID` char(35) DEFAULT NULL,
  `GroupID` char(35) DEFAULT NULL,
  `SiteID` varchar(25) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  KEY `IX_tpermissions_siteid` (`SiteID`),
  KEY `IX_tpermissions_contentid` (`ContentID`),
  KEY `IX_tpermissions_type` (`Type`),
  KEY `IX_tpermissions_groupid` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpermissions`
--

LOCK TABLES `tpermissions` WRITE;
/*!40000 ALTER TABLE `tpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tplugindisplayobjects`
--

DROP TABLE IF EXISTS `tplugindisplayobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tplugindisplayobjects` (
  `objectID` char(35) NOT NULL DEFAULT '',
  `moduleID` char(35) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `displayObjectFile` varchar(200) DEFAULT NULL,
  `displaymethod` varchar(100) DEFAULT NULL,
  `docache` varchar(5) DEFAULT NULL,
  `configuratorInit` varchar(50) DEFAULT NULL,
  `configuratorJS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tplugindisplayobjects`
--

LOCK TABLES `tplugindisplayobjects` WRITE;
/*!40000 ALTER TABLE `tplugindisplayobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `tplugindisplayobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tplugins`
--

DROP TABLE IF EXISTS `tplugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tplugins` (
  `pluginID` int(11) NOT NULL AUTO_INCREMENT,
  `moduleID` char(35) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `provider` varchar(100) DEFAULT NULL,
  `providerURL` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `deployed` tinyint(3) DEFAULT NULL,
  `package` varchar(100) DEFAULT NULL,
  `directory` varchar(100) DEFAULT NULL,
  `loadPriority` int(10) DEFAULT NULL,
  PRIMARY KEY (`pluginID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tplugins`
--

LOCK TABLES `tplugins` WRITE;
/*!40000 ALTER TABLE `tplugins` DISABLE KEYS */;
INSERT INTO `tplugins` VALUES (1,'3761007E-8002-7D59-D5AFEB2410038817','MuraFW1','2017-09-13 00:32:53','Steve Withington','http://stephenwithington.com','Application','5.0.1',1,'MuraFW1','MuraFW1',5),(2,'1EFF5432-8002-7D59-D5A86C7370331ECA','mediakitsFunctions','2017-09-15 01:16:44','Steve Withington','http://stephenwithington.com','Application','5.0.1',1,'mediakitsFunctions','mediakitsFunctions',5),(5,'71489D3F-8002-7D59-D5A85E4EEA67E669','An error occurred.','2017-09-16 15:34:55',NULL,NULL,NULL,NULL,0,NULL,'5',5);
/*!40000 ALTER TABLE `tplugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpluginscripts`
--

DROP TABLE IF EXISTS `tpluginscripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpluginscripts` (
  `scriptID` char(35) NOT NULL DEFAULT '',
  `moduleID` char(35) DEFAULT NULL,
  `runat` varchar(50) DEFAULT NULL,
  `scriptfile` varchar(200) DEFAULT NULL,
  `docache` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`scriptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpluginscripts`
--

LOCK TABLES `tpluginscripts` WRITE;
/*!40000 ALTER TABLE `tpluginscripts` DISABLE KEYS */;
INSERT INTO `tpluginscripts` VALUES ('1F1828AD-8002-7D59-D5ABF0BE3B3AAD54','1EFF5432-8002-7D59-D5A86C7370331ECA','onApplicationLoad','model.handlers.mediakitsFunctions','false'),('B687842C-8002-7D59-D5A244740A25B029','3761007E-8002-7D59-D5AFEB2410038817','onApplicationLoad','model.handlers.murafw1','false');
/*!40000 ALTER TABLE `tpluginscripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpluginsettings`
--

DROP TABLE IF EXISTS `tpluginsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpluginsettings` (
  `moduleID` char(35) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `settingValue` longtext,
  PRIMARY KEY (`moduleID`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpluginsettings`
--

LOCK TABLES `tpluginsettings` WRITE;
/*!40000 ALTER TABLE `tpluginsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpluginsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trazunasettings`
--

DROP TABLE IF EXISTS `trazunasettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trazunasettings` (
  `settingsID` char(35) NOT NULL DEFAULT '',
  `damPath` varchar(250) DEFAULT NULL,
  `siteID` varchar(25) DEFAULT '',
  `apiKey` varchar(50) NOT NULL,
  `hostName` varchar(50) NOT NULL,
  `hostID` varchar(50) NOT NULL,
  `servertype` varchar(50) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`settingsID`),
  KEY `IX_trazunasettings_siteID` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trazunasettings`
--

LOCK TABLES `trazunasettings` WRITE;
/*!40000 ALTER TABLE `trazunasettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `trazunasettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tredirects`
--

DROP TABLE IF EXISTS `tredirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tredirects` (
  `redirectID` char(35) NOT NULL DEFAULT '',
  `URL` mediumtext,
  `created` datetime DEFAULT NULL,
  `userid` char(35) DEFAULT NULL,
  `siteid` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`redirectID`),
  KEY `IX_tredirects_userid` (`userid`),
  KEY `IX_tredirects_siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tredirects`
--

LOCK TABLES `tredirects` WRITE;
/*!40000 ALTER TABLE `tredirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `tredirects` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `tsettings` VALUES ('default','Default',NULL,1000,'none','localmuradefault.loc',NULL,NULL,'king@werwards.com',NULL,NULL,NULL,0,1,0,NULL,0,0,1,20,1,3,'Left Column^Main Content^Right Column',2,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default','default',1,0,1,'default','y',600,'s',80,'s',180,NULL,NULL,NULL,NULL,'?display=login','?display=editProfile',1,0,NULL,NULL,NULL,1,'MuraBootstrap3','25','110','false','false',NULL,NULL,0,60,'',1,'0F147C93-8002-7D59-D5A4502B5896C090',0,0,'80','80','180','180','600','AUTO',NULL,NULL,0,0,'',NULL,'default','default','default',NULL,NULL,NULL,NULL,0,0,0,0,NULL,80,NULL,NULL,NULL,0,NULL,NULL),('mediakits','mediakits',NULL,1000,'none','www.mediakits.com',NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,NULL,0,0,1,20,1,3,'Left Column^Main Content^Right Column',2,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mediakits','mediakits','mediakits',2,0,1,'mediakits',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'?display=login','?display=editProfile',1,0,NULL,NULL,NULL,1,'MuraBootstrap3','25','110','false','false',NULL,'www.mediakits.com\r\ntest.mediakits.com\r\nmediakits.loc',0,60,'media kits tagline',1,'1264CBC1-8002-7D59-D5A070058251AE4C',0,0,'80','80','180','180','AUTO','600',NULL,NULL,1,0,'',NULL,'mediakits','mediakits','mediakits',NULL,NULL,NULL,'en',0,0,0,0,NULL,80,NULL,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `tsettings` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `ttrash`
--

DROP TABLE IF EXISTS `ttrash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ttrash` (
  `objectID` char(35) NOT NULL,
  `parentID` char(35) NOT NULL,
  `siteID` varchar(25) NOT NULL,
  `objectClass` varchar(50) NOT NULL,
  `objectType` varchar(50) NOT NULL,
  `objectSubType` varchar(50) NOT NULL,
  `objectLabel` varchar(255) NOT NULL,
  `objectstring` longtext,
  `deletedDate` datetime DEFAULT NULL,
  `deletedBy` varchar(50) NOT NULL,
  `deleteid` char(35) DEFAULT NULL,
  `orderno` int(10) DEFAULT NULL,
  PRIMARY KEY (`objectID`),
  KEY `IX_ttrash_deleteddate` (`deletedDate`),
  KEY `IX_ttrash_siteid` (`siteID`),
  KEY `IX_ttrash_objecttype` (`objectClass`),
  KEY `IX_ttrash_parentid` (`parentID`),
  KEY `IX_ttrash_deleteid` (`deleteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ttrash`
--

LOCK TABLES `ttrash` WRITE;
/*!40000 ALTER TABLE `ttrash` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttrash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuseraddresses`
--

DROP TABLE IF EXISTS `tuseraddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tuseraddresses` (
  `addressID` char(35) NOT NULL DEFAULT '',
  `userID` char(35) DEFAULT NULL,
  `siteID` varchar(25) DEFAULT NULL,
  `addressName` varchar(50) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `isPrimary` tinyint(3) DEFAULT NULL,
  `addressNotes` longtext,
  `addressURL` varchar(200) DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `addressEmail` varchar(100) DEFAULT NULL,
  `hours` longtext,
  PRIMARY KEY (`addressID`),
  KEY `Index_2` (`longitude`),
  KEY `Index_3` (`latitude`),
  KEY `Index_4` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuseraddresses`
--

LOCK TABLES `tuseraddresses` WRITE;
/*!40000 ALTER TABLE `tuseraddresses` DISABLE KEYS */;
INSERT INTO `tuseraddresses` VALUES ('12E09747-8002-7D59-D5AEBE62186DFD87','12D80D2A-8002-7D59-D5A49F4BAB747F70','mediakits','Primary',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,0,0,NULL,NULL),('12EE3BB3-8002-7D59-D5A46518A4A841AD','12E22ED3-8002-7D59-D5AB9990790141AB','mediakits','Primary',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,0,0,NULL,NULL),('12FB6B8C-8002-7D59-D5A14772AE4D1D66','12EFB7DE-8002-7D59-D5AAABB1D1E7FBE6','mediakits','Primary',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,0,0,NULL,NULL),('6EAD0009-8002-7D59-D5AAECDDF3F60C65','6EA4526C-8002-7D59-D5AD89B7260BE84B','mediakits','Primary',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,0,0,NULL,NULL),('6EB11F5F-8002-7D59-D5AFE6EB097204B2','6EAE9F96-8002-7D59-D5AC60460D092FD8','mediakits','Primary',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,0,0,NULL,NULL),('6EE50749-8002-7D59-D5A367B0A43FE532','6EDA4F56-8002-7D59-D5A50A1BB6D12038','mediakits','Primary',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,0,0,NULL,NULL);
/*!40000 ALTER TABLE `tuseraddresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuserdevice`
--

DROP TABLE IF EXISTS `tuserdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tuserdevice` (
  `siteID` varchar(25) DEFAULT '',
  `created` datetime DEFAULT NULL,
  `deviceid` char(35) NOT NULL DEFAULT '',
  `userID` char(35) DEFAULT '',
  `lastLogin` datetime DEFAULT NULL,
  PRIMARY KEY (`deviceid`),
  KEY `IX_tuserdevice_siteID` (`siteID`),
  KEY `IX_tuserdevice_userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuserdevice`
--

LOCK TABLES `tuserdevice` WRITE;
/*!40000 ALTER TABLE `tuserdevice` DISABLE KEYS */;
/*!40000 ALTER TABLE `tuserdevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuserremotesessions`
--

DROP TABLE IF EXISTS `tuserremotesessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tuserremotesessions` (
  `userID` char(35) NOT NULL,
  `authToken` char(32) DEFAULT NULL,
  `data` text,
  `created` datetime DEFAULT NULL,
  `lastAccessed` datetime NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `tuserremotesessions_authtoken` (`authToken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuserremotesessions`
--

LOCK TABLES `tuserremotesessions` WRITE;
/*!40000 ALTER TABLE `tuserremotesessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tuserremotesessions` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `tusers` VALUES ('0F0D96E2-8002-7D59-D5AE0B7065A84EE1',NULL,'Admin','User','admin','$2a$10$1re5FuUf5DBwPKzwSgzdPOAc21Q/p8JIUoLS/1L3z9qEzOuC6UhGO','2017-09-09 11:55:07','king@werwards.com',NULL,NULL,NULL,NULL,2,'Default',NULL,NULL,NULL,1,'2017-09-16 11:23:28','2017-09-09 11:29:55','System','22FC551F-FABE-EA01-C6EDD0885DDC1682',0,0,0,'default',0,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-09 18:29:55',NULL,NULL,NULL),('0F0D9A45-8002-7D59-D5AB2FF154E7E61B','Admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Default',NULL,NULL,NULL,0,NULL,'2017-09-09 11:29:55','System',NULL,1,0,0,'default',0,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-09 18:29:55',NULL,NULL,NULL),('1264DA91-8002-7D59-D5A3A2379DF8B637','Admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Default',NULL,NULL,NULL,0,NULL,'2017-09-09 13:03:20','System',NULL,1,0,0,'mediakits',0,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-09 20:03:20',NULL,NULL,NULL),('12D80D2A-8002-7D59-D5A49F4BAB747F70',NULL,'trip','ward','trip','$2a$10$hywS/6P40d8WaJ7JcJJd8.AMapavpCqZC0AM0.BIkFgn8XJGQkIgW','2017-09-16 07:20:51','king@werwards.com','mediakits','web guy',NULL,NULL,2,'Default',NULL,NULL,NULL,1,NULL,'2017-09-16 07:20:51','patrick tisdael','12E22ED3-8002-7D59-D5AB9990790141AB',0,0,0,'mediakits',1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-09 20:16:51',NULL,NULL,NULL),('12E22ED3-8002-7D59-D5AB9990790141AB',NULL,'patrick','tisdael','patrick','$2a$10$hywS/6P40d8WaJ7JcJJd8.GwsGrTCihv5D/6Zk.JhZPJQj2pQvNP6','2017-09-16 07:20:22','patricktisdel@outlook.com','mediakits','web guy',NULL,NULL,2,'Default',NULL,NULL,NULL,1,'2017-09-16 07:16:58','2017-09-16 07:20:22','patrick tisdael','12E22ED3-8002-7D59-D5AB9990790141AB',0,0,0,'mediakits',1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-09 20:18:20',NULL,NULL,NULL),('12EFB7DE-8002-7D59-D5AAABB1D1E7FBE6',NULL,'andrea','Khoury','andrea','$2a$10$hywS/6P40d8WaJ7JcJJd8.GwsGrTCihv5D/6Zk.JhZPJQj2pQvNP6','2017-09-16 07:19:59','andrea@khourypr.com','mediakits','Owner',NULL,NULL,2,'Default',NULL,NULL,NULL,0,NULL,'2017-09-16 07:24:13','Admin User','0F0D96E2-8002-7D59-D5AE0B7065A84EE1',0,0,0,'mediakits',1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-09 20:19:47',NULL,NULL,NULL),('6EA4526C-8002-7D59-D5AD89B7260BE84B','Influencers',NULL,NULL,NULL,'$2a$10$hywS/6P40d8WaJ7JcJJd8.kSVz4X82FPeSzcUl4uUorV0osrTQWWu','2017-09-16 07:22:00','king@werwards.com',NULL,NULL,NULL,NULL,1,'Default',NULL,'0',NULL,0,NULL,'2017-09-16 07:22:00','patrick tisdael','12E22ED3-8002-7D59-D5AB9990790141AB',0,0,1,'mediakits',1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-16 14:22:00',NULL,NULL,'Basic'),('6EAE9F96-8002-7D59-D5AC60460D092FD8','Brands',NULL,NULL,NULL,'$2a$10$hywS/6P40d8WaJ7JcJJd8.XTM6y0bUeX/zaM2vvzrqxamEdbEGBoW','2017-09-16 07:22:27','king@werwards.com',NULL,NULL,NULL,NULL,1,'Default',NULL,'0',NULL,0,NULL,'2017-09-16 07:22:27','patrick tisdael','12E22ED3-8002-7D59-D5AB9990790141AB',0,0,1,'mediakits',1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-16 14:22:27',NULL,NULL,'Basic'),('6EDA4F56-8002-7D59-D5A50A1BB6D12038','Daily Maintenance',NULL,NULL,NULL,'$2a$10$hywS/6P40d8WaJ7JcJJd8.2r99K4HAiG3E/yAJsgrRhmIShN7yerS','2017-09-16 07:28:07','king@werwards.com',NULL,NULL,NULL,NULL,1,'Default',NULL,'0',NULL,0,NULL,'2017-09-16 07:28:07','Admin User','0F0D96E2-8002-7D59-D5AE0B7065A84EE1',0,0,0,'mediakits',1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-16 14:28:07',NULL,NULL,'Basic,Publishing,SEO,Related Content,Extended Attributes,Usage Report');
/*!40000 ALTER TABLE `tusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tusersfavorites`
--

DROP TABLE IF EXISTS `tusersfavorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tusersfavorites` (
  `favoriteID` char(35) NOT NULL DEFAULT '',
  `userID` char(35) NOT NULL DEFAULT '',
  `favoriteName` varchar(255) DEFAULT NULL,
  `favorite` mediumtext,
  `type` varchar(30) NOT NULL DEFAULT '',
  `siteID` varchar(35) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `columnNumber` int(10) DEFAULT NULL,
  `rowNumber` int(10) DEFAULT NULL,
  `maxRSSItems` int(10) DEFAULT NULL,
  PRIMARY KEY (`favoriteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tusersfavorites`
--

LOCK TABLES `tusersfavorites` WRITE;
/*!40000 ALTER TABLE `tusersfavorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `tusersfavorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tusersinterests`
--

DROP TABLE IF EXISTS `tusersinterests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tusersinterests` (
  `userID` char(35) NOT NULL DEFAULT '',
  `categoryID` char(35) NOT NULL DEFAULT '',
  PRIMARY KEY (`userID`,`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tusersinterests`
--

LOCK TABLES `tusersinterests` WRITE;
/*!40000 ALTER TABLE `tusersinterests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tusersinterests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tusersmemb`
--

DROP TABLE IF EXISTS `tusersmemb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tusersmemb` (
  `UserID` char(35) NOT NULL DEFAULT '',
  `GroupID` char(35) NOT NULL DEFAULT '',
  PRIMARY KEY (`UserID`,`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tusersmemb`
--

LOCK TABLES `tusersmemb` WRITE;
/*!40000 ALTER TABLE `tusersmemb` DISABLE KEYS */;
INSERT INTO `tusersmemb` VALUES ('12D80D2A-8002-7D59-D5A49F4BAB747F70','1264DA91-8002-7D59-D5A3A2379DF8B637'),('12E22ED3-8002-7D59-D5AB9990790141AB','1264DA91-8002-7D59-D5A3A2379DF8B637'),('12EFB7DE-8002-7D59-D5AAABB1D1E7FBE6','1264DA91-8002-7D59-D5A3A2379DF8B637'),('12EFB7DE-8002-7D59-D5AAABB1D1E7FBE6','6EA4526C-8002-7D59-D5AD89B7260BE84B'),('12EFB7DE-8002-7D59-D5AAABB1D1E7FBE6','6EAE9F96-8002-7D59-D5AC60460D092FD8');
/*!40000 ALTER TABLE `tusersmemb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuserstags`
--

DROP TABLE IF EXISTS `tuserstags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tuserstags` (
  `tagID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` char(35) NOT NULL,
  `siteID` varchar(25) NOT NULL,
  `tag` varchar(100) NOT NULL,
  PRIMARY KEY (`tagID`),
  KEY `Index_2` (`userID`),
  KEY `Index_3` (`siteID`),
  KEY `Index_4` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuserstags`
--

LOCK TABLES `tuserstags` WRITE;
/*!40000 ALTER TABLE `tuserstags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tuserstags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuserstrikes`
--

DROP TABLE IF EXISTS `tuserstrikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tuserstrikes` (
  `username` varchar(100) NOT NULL DEFAULT '',
  `strikes` int(10) DEFAULT NULL,
  `lastAttempt` datetime NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuserstrikes`
--

LOCK TABLES `tuserstrikes` WRITE;
/*!40000 ALTER TABLE `tuserstrikes` DISABLE KEYS */;
INSERT INTO `tuserstrikes` VALUES ('admin',0,'2017-09-16 07:22:02'),('andrea',0,'2017-09-16 07:18:37'),('patrick',0,'2017-09-16 07:15:58'),('trip',0,'2017-09-16 07:19:31');
/*!40000 ALTER TABLE `tuserstrikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mediakits_mura'
--

--
-- Dumping routines for database 'mediakits_mura'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-16 14:53:42
