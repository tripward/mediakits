-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: muradcf8aa48cfe9e84d53300e47fbb7ea73
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
-- Table structure for table `custom_influenceraccounts`
--

DROP TABLE IF EXISTS `custom_influenceraccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_influenceraccounts` (
  `discountPercent` float DEFAULT NULL,
  `state` varchar(255) DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `discountStart` datetime DEFAULT NULL,
  `country` varchar(255) DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `discountDuration` float DEFAULT NULL,
  `influenceraccountid` char(35) NOT NULL DEFAULT '',
  `address1` varchar(255) NOT NULL DEFAULT '',
  `address3` varchar(255) DEFAULT '',
  `address2` varchar(255) DEFAULT '',
  `address4` varchar(255) DEFAULT '',
  `siteid` varchar(25) DEFAULT '',
  `subscriptionStart` datetime DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT '',
  `userid` char(35) DEFAULT '',
  `isActive` tinyint(1) DEFAULT '1',
  `city` varchar(255) DEFAULT '',
  `datemodified` datetime DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  PRIMARY KEY (`influenceraccountid`),
  KEY `IX_custom_InfluencerAccounts_siteid` (`siteid`),
  KEY `IX_custom_InfluencerAccounts_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_influenceraccounts`
--

LOCK TABLES `custom_influenceraccounts` WRITE;
/*!40000 ALTER TABLE `custom_influenceraccounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_influenceraccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_influencerprofiles`
--

DROP TABLE IF EXISTS `custom_influencerprofiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_influencerprofiles` (
  `FacebookUsername` varchar(50) DEFAULT '',
  `BaseInfluencelong` varchar(255) DEFAULT '',
  `instagramUserName` varchar(50) DEFAULT '',
  `googleAnalyticsUsername` varchar(50) DEFAULT '',
  `headshotFilename` varchar(100) DEFAULT '',
  `influencerProfileid` char(35) NOT NULL DEFAULT '',
  `influenceraccountid` char(35) DEFAULT '',
  `BaseinfluencerProfileadius` varchar(255) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `twitterPassword` varchar(50) DEFAULT '',
  `BaseInfluencelat` varchar(255) DEFAULT '',
  `pintrestPassword` varchar(50) DEFAULT '',
  `facebookPassword` varchar(50) DEFAULT '',
  `googleAnalyticsPassword` varchar(50) DEFAULT '',
  `blogURL` varchar(100) DEFAULT '',
  `instagramPassword` varchar(50) DEFAULT '',
  `facebookBusinesspageLink` varchar(255) DEFAULT '',
  `datemodified` datetime DEFAULT NULL,
  `BaseInfluenceZipCode` varchar(11) DEFAULT '',
  `webURL` varchar(100) DEFAULT '',
  `keywords` varchar(255) DEFAULT '',
  `datecreated` datetime DEFAULT NULL,
  `twitterUserName` varchar(50) DEFAULT '',
  `pintrestUserName` varchar(50) DEFAULT '',
  PRIMARY KEY (`influencerProfileid`),
  KEY `IX_custom_influencerProfiles_influenceraccountid` (`influenceraccountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_influencerprofiles`
--

LOCK TABLES `custom_influencerprofiles` WRITE;
/*!40000 ALTER TABLE `custom_influencerprofiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_influencerprofiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_influencersubscriptions`
--

DROP TABLE IF EXISTS `custom_influencersubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_influencersubscriptions` (
  `siteid` varchar(25) DEFAULT '',
  `InfluencerSubscriptionToAccountID` char(35) DEFAULT '',
  `level` varchar(1000) DEFAULT '',
  `transactionid` varchar(1000) DEFAULT '',
  `userid` char(35) DEFAULT '',
  `isActive` tinyint(1) DEFAULT '1',
  `isOffered` tinyint(1) DEFAULT '1',
  `name` varchar(255) NOT NULL DEFAULT '',
  `Subscriptionid` char(35) NOT NULL DEFAULT '',
  `cost` double DEFAULT NULL,
  `paymentGateway` varchar(1000) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `sort_order` float DEFAULT '1',
  `duration` float DEFAULT '12',
  PRIMARY KEY (`Subscriptionid`),
  KEY `IX_custom_InfluencerSubscriptions_siteid` (`siteid`),
  KEY `custom_InfluencerSubscriptions_InfluencerSubscriptionToAccountID` (`InfluencerSubscriptionToAccountID`),
  KEY `IX_custom_InfluencerSubscriptions_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_influencersubscriptions`
--

LOCK TABLES `custom_influencersubscriptions` WRITE;
/*!40000 ALTER TABLE `custom_influencersubscriptions` DISABLE KEYS */;
INSERT INTO `custom_influencersubscriptions` VALUES (NULL,NULL,'Premiere',NULL,NULL,1,1,'Im a good trial','FAA4C75B-8002-7D59-D5A42CE6D226CB9A',1,NULL,'Short paid trial',1,3),(NULL,NULL,'Standard',NULL,NULL,1,1,'Willing to see it over time','FAA4C820-8002-7D59-D5AAE72C823C22EA',5,NULL,'Long enough to',1,6),(NULL,NULL,'Premiere',NULL,NULL,1,1,'Im all in','FAA4C8F0-8002-7D59-D5A46F80FFB23290',10,NULL,'Im all in',1,12);
/*!40000 ALTER TABLE `custom_influencersubscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_influencersubscriptiontoaccount`
--

DROP TABLE IF EXISTS `custom_influencersubscriptiontoaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_influencersubscriptiontoaccount` (
  `siteid` varchar(25) DEFAULT '',
  `discountPercent` float DEFAULT NULL,
  `subscriptionStart` datetime DEFAULT NULL,
  `IInfluencerSubscriptionID` char(35) DEFAULT '',
  `transactionid` varchar(1000) DEFAULT '',
  `userid` char(35) DEFAULT '',
  `discountStart` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `InfluencerAccountID` char(35) DEFAULT '',
  `paymentGateway` varchar(1000) DEFAULT '',
  `InfluencerSubscriptionToAccountid` char(35) NOT NULL DEFAULT '',
  `datemodified` datetime DEFAULT NULL,
  `discountDuration` float DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  PRIMARY KEY (`InfluencerSubscriptionToAccountid`),
  KEY `IX_custom_InfluencerSubscriptionToAccount_siteid` (`siteid`),
  KEY `custom_InfluencerSubscriptionToAccount_IInfluencerSubscriptionID` (`IInfluencerSubscriptionID`),
  KEY `IX_custom_InfluencerSubscriptionToAccount_userid` (`userid`),
  KEY `IX_custom_InfluencerSubscriptionToAccount_InfluencerAccountID` (`InfluencerAccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_influencersubscriptiontoaccount`
--

LOCK TABLES `custom_influencersubscriptiontoaccount` WRITE;
/*!40000 ALTER TABLE `custom_influencersubscriptiontoaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_influencersubscriptiontoaccount` ENABLE KEYS */;
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
INSERT INTO `tclustercommands` VALUES ('F9DE2124-8002-7D59-D5A4FEDD6234D652','90D8C87C-8002-7D59-D5ADFE07194409C3','getBean(\'settingsManager\').remoteReload()','2017-10-18 20:03:46'),('F9DE213D-8002-7D59-D5ABE1B76747ABB3','C4AA3688-8002-7D59-D5A3F06BDCF0D17C','getBean(\'settingsManager\').remoteReload()','2017-10-18 20:03:46'),('FA653AB0-8002-7D59-D5ABEA82DD6E3221','F6E21558-8002-7D59-D5AB29B46707B1D2','getBean(\'settingsManager\').remoteReload()','2017-10-18 20:18:31'),('FAA4DDA5-8002-7D59-D5A170A84E54651F','FA21021D-8002-7D59-D5ACAACFB4A74F0B','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'InfluencerSubscriptionsFAA4C75B-8002-7D59-D5A42CE6D226CB9A\')','2017-10-18 20:25:28'),('FAA4E613-8002-7D59-D5A9210D68ECAB36','FA21021D-8002-7D59-D5ACAACFB4A74F0B','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'InfluencerSubscriptionsFAA4C820-8002-7D59-D5AAE72C823C22EA\')','2017-10-18 20:25:28'),('FAA4F1FB-8002-7D59-D5AD7CB77C76DE7A','FA21021D-8002-7D59-D5ACAACFB4A74F0B','getBean(\'settingsManager\').getSite(\'mediakits\').getCacheFactory(name=\'data\').purge(key=\'InfluencerSubscriptionsFAA4C8F0-8002-7D59-D5A46F80FFB23290\')','2017-10-18 20:25:29');
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
INSERT INTO `tclusterpeers` VALUES ('FA21021D-8002-7D59-D5ACAACFB4A74F0B'),('FA9407BE-8002-7D59-D5AE4F1E50F41DE6');
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontent`
--

LOCK TABLES `tcontent` WRITE;
/*!40000 ALTER TABLE `tcontent` DISABLE KEYS */;
INSERT INTO `tcontent` VALUES (1,'default','00000000000000000000000000000000003','00000000000000000000000000000000END','00000000000000000000000000000000003','6300ED4A-1320-5CC3-F9D6A2D279E386D0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Components','Components',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'Components','Components',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(2,'default','00000000000000000000000000000000004','00000000000000000000000000000000END','00000000000000000000000000000000004','6300ED59-1320-5CC3-F9706221E0EFF7A2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Forms','Forms',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,'Forms','Forms',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(3,'default','00000000000000000000000000000000000','00000000000000000000000000000000END','00000000000000000000000000000000001','6300ED69-1320-5CC3-F922E3012E2C6BAE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default.cfm','Page','Default',1,1,'Home','Home',NULL,NULL,NULL,NULL,NULL,'2017-09-24 12:41:40','System',NULL,NULL,NULL,1,1,1,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Cascade',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001',NULL,NULL,'Home','Home','2017-09-24 12:41:40',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(4,'default','00000000000000000000000000000000006','00000000000000000000000000000000END','00000000000000000000000000000000006','6300ED79-1320-5CC3-F92E6325C26664B6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Advertising','Advertising',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Advertising',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(5,'default','00000000000000000000000000000000000','00000000000000000000000000000000END','00000000000000000000000000000000000','6300ED88-1320-5CC3-F9E241684D21FEC9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Site Manager','Site Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Site Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(6,'default','00000000000000000000000000000000008','00000000000000000000000000000000END','00000000000000000000000000000000008','6300ED98-1320-5CC3-F9398EB23A57CBD0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Site Members','Site Members',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Site Members',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(7,'default','00000000000000000000000000000000005','00000000000000000000000000000000END','00000000000000000000000000000000005','6300EDA8-1320-5CC3-F93DF074187C935E',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Email Broadcaster','Email Broadcaster',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Email Broadcaster',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(8,'default','00000000000000000000000000000000009','00000000000000000000000000000000END','00000000000000000000000000000000009','6300EDB7-1320-5CC3-F9D664F38EBBD2D0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Mailing Lists','Mailing Lists',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Mailing Lists',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(9,'default','00000000000000000000000000000000010','00000000000000000000000000000000END','00000000000000000000000000000000010','6300EDC7-1320-5CC3-F9DB8034C9626B70',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Categories','Categories',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Categories',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(10,'default','00000000000000000000000000000000011','00000000000000000000000000000000END','00000000000000000000000000000000011','6300EDD6-1320-5CC3-F9625545444B880F',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Collections Manager','Collections Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Content Collections',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(11,'default','00000000000000000000000000000000012','00000000000000000000000000000000END','00000000000000000000000000000000012','6300EDE6-1320-5CC3-F94E2FCEF5DE046D',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Filemanager Manager','Filemanager Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,'Filemanager Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(12,'default','00000000000000000000000000000000014','00000000000000000000000000000000END','00000000000000000000000000000000014','1623EC99-8002-7D59-D5AEE99BC2742CB4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','default',1,NULL,'Content Staging Manager','Content Staging Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(13,'default','00000000000000000000000000000000015','00000000000000000000000000000000END','00000000000000000000000000000000015','162537E8-8002-7D59-D5A7558953FA2AA1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','default',1,NULL,'Comments Manager','Comments Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'default','00000000000000000000000000000000099','00000000000000000000000000000000END','00000000000000000000000000000000099','1625397F-8002-7D59-D5AB3509B0AD17A2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','default',1,NULL,'Remote Variations','Remote Variations',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'mediakits','00000000000000000000000000000000003','00000000000000000000000000000000END','00000000000000000000000000000000003','1640461F-8002-7D59-D5A756BA868CD33A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Components','Components',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'mediakits','00000000000000000000000000000000004','00000000000000000000000000000000END','00000000000000000000000000000000004','16404627-8002-7D59-D5A64454AF056540',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Forms','Forms',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000END','00000000000000000000000000000000001','1640462E-8002-7D59-D5AA796C18393430',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default.cfm','Page','Default',1,1,'Home','Home',NULL,NULL,NULL,NULL,NULL,'2017-09-24 12:46:01','System',NULL,NULL,NULL,1,1,1,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Cascade',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001',NULL,NULL,NULL,NULL,'2017-09-24 12:46:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'mediakits','00000000000000000000000000000000006','00000000000000000000000000000000END','00000000000000000000000000000000006','1640463A-8002-7D59-D5AECE19E0D3BD32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Advertisement Manager','Advertisement Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000END','00000000000000000000000000000000000','16404643-8002-7D59-D5A73307C52432D7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Content Manager','Content Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'mediakits','00000000000000000000000000000000008','00000000000000000000000000000000END','00000000000000000000000000000000008','1640464C-8002-7D59-D5A35AB7CD5DD1E3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Public User Manager','Public User Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'mediakits','00000000000000000000000000000000005','00000000000000000000000000000000END','00000000000000000000000000000000005','16404655-8002-7D59-D5A3D135E2E602B5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Email Broadcaster','Email Broadcaster',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'mediakits','00000000000000000000000000000000009','00000000000000000000000000000000END','00000000000000000000000000000000009','16404664-8002-7D59-D5ADBD8C732BF277',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Mailing List Manager','Mailing List Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'mediakits','00000000000000000000000000000000010','00000000000000000000000000000000END','00000000000000000000000000000000010','1640466F-8002-7D59-D5A9EAAEB71FEBA7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Category Manager','Category Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'mediakits','00000000000000000000000000000000011','00000000000000000000000000000000END','00000000000000000000000000000000011','16404677-8002-7D59-D5A02650F5A8D385',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Collections Manager','Collections Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'mediakits','00000000000000000000000000000000012','00000000000000000000000000000000END','00000000000000000000000000000000012','16404680-8002-7D59-D5A40DBC26D24C1B',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Filemanager Manager','Filemanager Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'mediakits','00000000000000000000000000000000014','00000000000000000000000000000000END','00000000000000000000000000000000014','16404689-8002-7D59-D5A3F3E8F5A5092F',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Content Staging Manager','Content Staging Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'mediakits','00000000000000000000000000000000015','00000000000000000000000000000000END','00000000000000000000000000000000015','16404694-8002-7D59-D5A68362EE374045',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Comments Manager','Comments Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'mediakits','00000000000000000000000000000000099','00000000000000000000000000000000END','00000000000000000000000000000000099','1640469C-8002-7D59-D5A5C5F3A1FA96B2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Module','Default',1,NULL,'Remote Variations','Remote Variations',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','17EEE829-8002-7D59-D5A547F60F6EF7CC','17F2FF5F-8002-7D59-D5AFE86CFA6FB27D',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Page','Default',0,1,'trips test page','trips test page',NULL,'trips-test-page',NULL,NULL,'<p>trips test page</p>','2017-09-24 13:33:30','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,17EEE829-8002-7D59-D5A547F60F6EF7CC',NULL,1,'trips-test-page','trips test page','2017-09-24 13:33:30',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(30,'mediakits','1DE5C1F2-8002-7D59-D5AA74244ECCFF07','1DE5C1F2-8002-7D59-D5AA74244ECCFF07','1DE5C1F2-8002-7D59-D5AA74244ECCFF07','1DE5C1F2-8002-7D59-D5AA74244ECCFF07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Plugin','Default',1,NULL,'mediakitsFunctions',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','17EEE829-8002-7D59-D5A547F60F6EF7CC','1E07E5AE-8002-7D59-D5AAD26837ECE6CF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Page','Default',0,3,'trips test page','trips test page',NULL,'trips-test-page',NULL,NULL,'<p>trips test page</p><div data-object=\"influencerSubscribeForm\" data-objectname=\"mediakitsFunctions Influencer sub form\" data-objecticonclass=\"mi-leaf\" data-async=\"true\" data-instanceid=\"1026C7AA-333C-4E8F-B75CB937945E576E\" class=\"mura-async-object mura-object mura-object-select\" data-objectid=\"05B1EFFA-398F-4999-A1C0458900356B26\" style=\"\" data-inited=\"true\" data-influencersubscribemessage=\"this is insedir the sub form configuraor\" data-configureddts=\"{ts \'2017-09-24 16:22:47\'}\" data-configuredby=\"User, Admin\"></div>','2017-09-24 16:23:31','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,17EEE829-8002-7D59-D5A547F60F6EF7CC',NULL,1,'trips-test-page','trips test page','2017-09-24 13:33:30',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(32,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','52DD6497-8002-7D59-D5A664082EC39DB0','52E50CE1-8002-7D59-D5A12C7B400AAF52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Folder','Default',1,4,'Influencer','Influencer',NULL,'influencer',NULL,NULL,'<p>this isthe influencer Home and profile</p>','2017-09-25 17:01:40','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,52DD6497-8002-7D59-D5A664082EC39DB0',NULL,1,'influencer','Influencer','2017-09-25 17:01:40',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(33,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','52E833B4-8002-7D59-D5A5E32546528106','52EF637B-8002-7D59-D5ADF84898973DDB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Page','Default',0,1,'Influencer Subscribe','Influencer Subscribe',NULL,'influencer-subscribe',NULL,NULL,'<p>influencer subscribe</p>','2017-09-25 17:02:48','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,52E833B4-8002-7D59-D5A5E32546528106',NULL,1,'influencer-subscribe','Influencer Subscribe','2017-09-25 17:02:47',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(34,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','17EEE829-8002-7D59-D5A547F60F6EF7CC','5303667E-8002-7D59-D5AE63D0F28D5793',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Page','Default',0,4,'trips test page','trips test page',NULL,'trips-test-page',NULL,NULL,'<p>trips test page</p>','2017-09-25 17:04:59','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,17EEE829-8002-7D59-D5A547F60F6EF7CC',NULL,1,'trips-test-page','trips test page','2017-09-24 13:33:30',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(35,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','52E833B4-8002-7D59-D5A5E32546528106','539DA8DC-8002-7D59-D5AA706E955E2067',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'one_column_plugin.cfm','Page','Default',0,2,'Influencer Subscribe','Influencer Subscribe',NULL,'influencer-subscribe',NULL,NULL,'<p>influencer subscribe</p>','2017-09-25 17:21:50','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,52E833B4-8002-7D59-D5A5E32546528106',NULL,1,'influencer-subscribe','Influencer Subscribe','2017-09-25 17:02:47',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(36,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','281327B8-8002-7D59-D5A7ECC118BA6ACF','28171584-8002-7D59-D5A6298F50B95169',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Page','Default',0,1,'Infuencer Profile','Infuencer Profile',NULL,'infuencer-profile',NULL,NULL,'<p></p>','2017-10-04 19:41:24','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,281327B8-8002-7D59-D5A7ECC118BA6ACF',NULL,1,'infuencer-profile','Infuencer Profile','2017-10-04 19:41:24',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(37,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','281327B8-8002-7D59-D5A7ECC118BA6ACF','281EEE24-8002-7D59-D5AF57F3FFC7F45B',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Page','Default',0,1,'Infuencer Profile','Infuencer Profile',NULL,'infuencer-profile',NULL,NULL,'<p>influencer profile</p>','2017-10-04 19:42:15','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,281327B8-8002-7D59-D5A7ECC118BA6ACF',NULL,1,'infuencer-profile','Infuencer Profile','2017-10-04 19:41:24',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(38,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','281327B8-8002-7D59-D5A7ECC118BA6ACF','C38EC8F7-8002-7D59-D5AA5E33656CAC96',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Page','Default',0,1,'Infuencer Profile','Infuencer Profile',NULL,'infuencer-profile',NULL,NULL,'<div data-object=\"influencerProfile\" data-objectname=\"mediakitsFunctions Influencer prifile form\" data-objecticonclass=\"mi-leaf\" data-async=\"true\" data-instanceid=\"EA27139C-4C9E-4812-AACAE3F32CCBBC56\" class=\"mura-async-object mura-object mura-object-select\" data-objectid=\"05E951E7-6A7D-43A5-907E19D429FC0E9D\" style=\"\" data-inited=\"true\" data-influencerprofilemessage=\"this is the profile page\" data-configureddts=\"{ts \'2017-10-12 19:26:19\'}\" data-configuredby=\"User, Admin\"></div><p>influencer profile</p>','2017-10-12 19:26:49','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,281327B8-8002-7D59-D5A7ECC118BA6ACF',NULL,1,'infuencer-profile','Infuencer Profile','2017-10-04 19:41:24',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(39,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','281327B8-8002-7D59-D5A7ECC118BA6ACF','C41F80E2-8002-7D59-D5A928CC58C5D31D',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'one_column_plugin.cfm','Page','Default',0,1,'Infuencer Profile','Infuencer Profile',NULL,'infuencer-profile',NULL,NULL,'<div data-object=\"influencerProfile\" data-objectname=\"mediakitsFunctions Influencer prifile form\" data-objecticonclass=\"mi-leaf\" data-async=\"true\" data-instanceid=\"EA27139C-4C9E-4812-AACAE3F32CCBBC56\" class=\"mura-async-object mura-object mura-object-select\" data-objectid=\"05E951E7-6A7D-43A5-907E19D429FC0E9D\" style=\"\" data-inited=\"true\" data-influencerprofilemessage=\"this is the profile page\" data-configureddts=\"{ts \'2017-10-12 19:26:19\'}\" data-configuredby=\"User, Admin\"></div>\r\n<p>influencer profile</p>','2017-10-12 19:42:38','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,281327B8-8002-7D59-D5A7ECC118BA6ACF',NULL,1,'infuencer-profile','Infuencer Profile','2017-10-04 19:41:24',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(40,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','281327B8-8002-7D59-D5A7ECC118BA6ACF','C4FF2165-8002-7D59-D5A774032F66CEAB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'one_column_plugin.cfm','Page','Default',0,1,'Infuencer Profile','Infuencer Profile',NULL,'infuencer-profile',NULL,NULL,'<p>influencer profile</p>','2017-10-12 20:07:03','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,281327B8-8002-7D59-D5A7ECC118BA6ACF',NULL,1,'infuencer-profile','Infuencer Profile','2017-10-04 19:41:24',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(42,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','281327B8-8002-7D59-D5A7ECC118BA6ACF','C5093699-8002-7D59-D5AB54D30ABBE25B',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'one_column_plugin.cfm','Page','Default',0,1,'Infuencer Profile','Infuencer Profile',NULL,'infuencer-profile',NULL,NULL,'<p>i am at the beg of content <div data-object=\"influencerProfile\" data-objectname=\"mediakitsFunctions Influencer prifile form\" data-objecticonclass=\"mi-leaf\" data-async=\"true\" data-instanceid=\"EA27139C-4C9E-4812-AACAE3F32CCBBC56\" class=\"mura-async-object mura-object mura-object-select\" data-objectid=\"05E951E7-6A7D-43A5-907E19D429FC0E9D\" style=\"\" data-inited=\"true\" data-influencerprofilemessage=\"this is the profile page\" data-configureddts=\"{ts \'2017-10-12 19:26:19\'}\" data-configuredby=\"User, Admin\"></div></p>\r\n\r\n<p>influencer profile</p>\r\n\r\n<p>i am at the end of content</p>','2017-10-12 20:08:09','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,281327B8-8002-7D59-D5A7ECC118BA6ACF',NULL,1,'infuencer-profile','Infuencer Profile','2017-10-04 19:41:24',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(43,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','52E833B4-8002-7D59-D5A5E32546528106','C511EC61-8002-7D59-D5A6439AD36C178D',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'one_column_plugin.cfm','Page','Default',0,2,'Influencer Subscribe','Influencer Subscribe',NULL,'influencer-subscribe',NULL,NULL,'beg content\r\n<p>influencer subscribe</p>\r\n\r\n\r\nend content','2017-10-12 20:09:06','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,52E833B4-8002-7D59-D5A5E32546528106',NULL,1,'influencer-subscribe','Influencer Subscribe','2017-09-25 17:02:47',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(44,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','52E833B4-8002-7D59-D5A5E32546528106','C519489A-8002-7D59-D5AC71F7FD830DB9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'one_column_plugin.cfm','Page','Default',0,2,'Influencer Subscribe','Influencer Subscribe',NULL,'influencer-subscribe',NULL,NULL,'beg content\n<div data-object=\"influencerSubscribeForm\" data-objectname=\"mediakitsFunctions Influencer sub form\" data-objecticonclass=\"mi-leaf\" data-async=\"true\" data-instanceid=\"F36B7CC6-AF35-4EA8-888D07CE85E32B42\" class=\"mura-async-object mura-object mura-object-select\" data-objectid=\"6EEFF1BC-272C-4CD3-B42CB399DDB14C1A\" style=\"\" data-inited=\"true\"></div><p>influencer subscribe</p>\n\n\nend content','2017-10-12 20:09:54','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,52E833B4-8002-7D59-D5A5E32546528106',NULL,1,'influencer-subscribe','Influencer Subscribe','2017-09-25 17:02:47',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(47,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','52E833B4-8002-7D59-D5A5E32546528106','C5860A90-8002-7D59-D5A52570EE9DF193',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'one_column_plugin.cfm','Page','Default',0,2,'Influencer Subscribe','Influencer Subscribe',NULL,'influencer-subscribe',NULL,NULL,'<p>beg content <div data-object=\"influencerSubscribeForm\" data-objectname=\"mediakitsFunctions Influencer sub form\" data-objecticonclass=\"mi-leaf\" data-async=\"true\" data-instanceid=\"F36B7CC6-AF35-4EA8-888D07CE85E32B42\" class=\"mura-async-object mura-object mura-object-select\" data-objectid=\"6EEFF1BC-272C-4CD3-B42CB399DDB14C1A\" style=\"\" data-inited=\"true\"></div></p>\r\n\r\n<p>influencer subscribe</p>\r\n\r\n<p>end content</p>','2017-10-12 20:21:47','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,52E833B4-8002-7D59-D5A5E32546528106',NULL,1,'influencer-subscribe','Influencer Subscribe','2017-09-25 17:02:47',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(48,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','52E833B4-8002-7D59-D5A5E32546528106','C5BBC644-8002-7D59-D5A746C1F49C2F30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'one_column_plugin.cfm','Page','Default',1,3,'Influencer Subscribe','Influencer Subscribe',NULL,'influencer-subscribe',NULL,NULL,'beg content\n<div data-object=\"influencerSubscribeForm\" data-objectname=\"mediakitsFunctions Influencer sub form\" data-objecticonclass=\"mi-leaf\" data-async=\"true\" data-instanceid=\"F36B7CC6-AF35-4EA8-888D07CE85E32B42\" class=\"mura-async-object mura-object mura-object-select\" data-objectid=\"6EEFF1BC-272C-4CD3-B42CB399DDB14C1A\" style=\"\" data-inited=\"true\"></div><p>influencer subscribe</p>\n\n\nend content','2017-10-12 20:27:39','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,52E833B4-8002-7D59-D5A5E32546528106',NULL,1,'influencer-subscribe','Influencer Subscribe','2017-09-25 17:02:47',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(49,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','281327B8-8002-7D59-D5A7ECC118BA6ACF','C5C5591C-8002-7D59-D5A76F3CB463F10D',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'one_column_plugin.cfm','Page','Default',1,2,'Infuencer Profile','Infuencer Profile',NULL,'infuencer-profile',NULL,NULL,'<p>i am at the beg of content <div data-object=\"influencerProfile\" data-objectname=\"mediakitsFunctions Influencer prifile form\" data-objecticonclass=\"mi-leaf\" data-async=\"true\" data-instanceid=\"EA27139C-4C9E-4812-AACAE3F32CCBBC56\" class=\"mura-async-object mura-object mura-object-select\" data-objectid=\"05E951E7-6A7D-43A5-907E19D429FC0E9D\" style=\"\" data-inited=\"true\" data-influencerprofilemessage=\"this is the profile page\" data-configureddts=\"{ts \'2017-10-12 19:26:19\'}\" data-configuredby=\"User, Admin\"></div></p>\r\n\r\n<p>influencer profile</p>\r\n\r\n<p>i am at the end of content</p>','2017-10-12 20:28:42','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,281327B8-8002-7D59-D5A7ECC118BA6ACF',NULL,1,'infuencer-profile','Infuencer Profile','2017-10-04 19:41:24',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(50,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','17EEE829-8002-7D59-D5A547F60F6EF7CC','F4C6C716-8002-7D59-D5AC1718F5C0F4D1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'one_column.cfm','Page','Default',0,4,'trips test page','trips test page',NULL,'trips-test-page',NULL,NULL,'<p>trips test page</p>','2017-10-13 18:23:01','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,17EEE829-8002-7D59-D5A547F60F6EF7CC',NULL,1,'trips-test-page','trips test page','2017-09-24 13:33:30',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(51,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','17EEE829-8002-7D59-D5A547F60F6EF7CC','F52119DF-8002-7D59-D5AAEFA921DADC88',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'one_column.cfm','Page','Default',1,5,'trips test page','trips test page',NULL,'trips-test-page',NULL,NULL,'<div data-object=\"influencerSubscribeForm\" data-objectname=\"mediakitsFunctions Influencer sub form\" data-objecticonclass=\"mi-leaf\" data-async=\"true\" data-instanceid=\"58FAFF91-2D99-42AC-9B476DA0B1DCC820\" class=\"mura-async-object mura-object mura-object-select\" data-objectid=\"AE35722B-9341-44A2-A3FD3A6BA16DCB0F\" style=\"\" data-inited=\"true\"></div><p>trips test page</p>','2017-10-13 18:32:53','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,17EEE829-8002-7D59-D5A547F60F6EF7CC',NULL,1,'trips-test-page','trips test page','2017-09-24 13:33:30',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(52,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','F7E95C3D-8002-7D59-D5AA6ECD31E77B35','F7F0885F-8002-7D59-D5AFA05978398D00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Page','Default',0,1,'Login','Login',NULL,'login',NULL,NULL,'<p>insert creds</p>','2017-10-13 19:51:28','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,F7E95C3D-8002-7D59-D5AA6ECD31E77B35',NULL,1,'login','Login','2017-10-13 19:51:28',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(53,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','F7E95C3D-8002-7D59-D5AA6ECD31E77B35','F82B3F75-8002-7D59-D5A52F40ED262C0D',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'one_column.cfm','Page','Default',0,1,'Login','Login',NULL,'login',NULL,NULL,'<p>insert creds</p>','2017-10-13 19:57:53','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,F7E95C3D-8002-7D59-D5AA6ECD31E77B35',NULL,1,'login','Login','2017-10-13 19:51:28',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}'),(54,'mediakits','00000000000000000000000000000000000','00000000000000000000000000000000001','F7E95C3D-8002-7D59-D5AA6ECD31E77B35','F862CE1E-8002-7D59-D5A28EAF060F715F',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'one_column.cfm','Page','Default',1,1,'Login','Login',NULL,'login',NULL,NULL,'<p>insert creds</p><div data-object=\"LoginForm\" data-objectname=\"mediakitsFunctions Influencer login form\" data-objecticonclass=\"mi-leaf\" data-async=\"true\" data-instanceid=\"E1F8CC06-9422-45BB-BEF38571EBF392F2\" class=\"mura-async-object mura-object mura-object-select\" data-objectid=\"B81431B8-DACB-4B8C-BEAD5C5BA07CE8FF\" style=\"\"></div>','2017-10-13 20:03:57','Admin User','1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,NULL,1,1,1,0,NULL,'_self',NULL,0,NULL,NULL,NULL,NULL,0,NULL,'Inherit',0,NULL,0,10,'orderno','asc',NULL,NULL,0,NULL,NULL,0,'00000000000000000000000000000000001,F7E95C3D-8002-7D59-D5AA6ECD31E77B35',NULL,1,'login','Login','2017-10-13 19:51:28',0,NULL,'small','AUTO','AUTO',NULL,0,0,NULL,'{\"daysofweek\":\"\",\"endafter\":0,\"allday\":0,\"end\":\"never\",\"endon\":\"\",\"timezone\":\"America/Los_Angeles\",\"repeats\":1,\"detectconflicts\":0,\"type\":\"daily\",\"every\":1}','{}');
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
INSERT INTO `tcontentfilenamearchive` VALUES ('mediakits','17F32EC5-8002-7D59-D5A38C5ECE02184F','17EEE829-8002-7D59-D5A547F60F6EF7CC','trips-test-page'),('mediakits','28173815-8002-7D59-D5A5042D498A9A76','281327B8-8002-7D59-D5A7ECC118BA6ACF','infuencer-profile'),('mediakits','52E5222D-8002-7D59-D5A573E271E7CEE1','52DD6497-8002-7D59-D5A664082EC39DB0','influencer'),('mediakits','52EF7B1A-8002-7D59-D5A34BD729383B82','52E833B4-8002-7D59-D5A5E32546528106','influencer-subscribe'),('mediakits','F7F0936F-8002-7D59-D5A7DE1A7DB87214','F7E95C3D-8002-7D59-D5AA6ECD31E77B35','login');
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
INSERT INTO `tcontentobjects` VALUES ('C5BBC644-8002-7D59-D5A746C1F49C2F30','9CD448FB-33DE-4AAC-A99CEDE7D0D841DB','influencerSubscribeForm','52E833B4-8002-7D59-D5A5E32546528106','mediakitsFunctions Influencer sub form',1,'mediakits',2,'{\"object\":\"influencerSubscribeForm\",\"objectname\":\"mediakitsFunctions Influencer sub form\",\"objecticonclass\":\"mi-leaf\",\"influencersubscribemessage\":\"test\",\"configureddts\":\"{ts \'2017-10-12 20:27:10\'}\",\"configuredby\":\"User, Admin\"}'),('C5C5591C-8002-7D59-D5A76F3CB463F10D','0486A100-1E3F-49B2-BCE3B4587C1E731B','influencerProfile','281327B8-8002-7D59-D5A7ECC118BA6ACF','mediakitsFunctions Influencer prifile form',1,'mediakits',2,'{\"object\":\"influencerProfile\",\"objectname\":\"mediakitsFunctions Influencer prifile form\",\"objecticonclass\":\"mi-leaf\"}');
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
INSERT INTO `tcontentsourcemaps` VALUES ('mediakits','2017-09-24 13:33:31','17F2FD63-8002-7D59-D5ADEB77B013E8AC','17F2FF5F-8002-7D59-D5AFE86CFA6FB27D','17F30AEF-8002-7D59-D5AE62F1526604CD','17EEE829-8002-7D59-D5A547F60F6EF7CC'),('mediakits','2017-09-24 16:23:31','17F2FF5F-8002-7D59-D5AFE86CFA6FB27D','1E07E5AE-8002-7D59-D5AAD26837ECE6CF','1E07F057-8002-7D59-D5A9BA2CEF4F9662','17EEE829-8002-7D59-D5A547F60F6EF7CC'),('mediakits','2017-10-04 19:41:24','2817115B-8002-7D59-D5A85061BEC1B419','28171584-8002-7D59-D5A6298F50B95169','28172B00-8002-7D59-D5A281C9C507BBD6','281327B8-8002-7D59-D5A7ECC118BA6ACF'),('mediakits','2017-10-04 19:42:15','28171584-8002-7D59-D5A6298F50B95169','281EEE24-8002-7D59-D5AF57F3FFC7F45B','281EF513-8002-7D59-D5ABED8722EB7227','281327B8-8002-7D59-D5A7ECC118BA6ACF'),('mediakits','2017-09-25 17:01:40','52E50B35-8002-7D59-D5ADEE259AE37F50','52E50CE1-8002-7D59-D5A12C7B400AAF52','52E51BB5-8002-7D59-D5A9DA7AF083B79F','52DD6497-8002-7D59-D5A664082EC39DB0'),('mediakits','2017-09-25 17:02:48','52EF61A6-8002-7D59-D5A2CB45DC868E12','52EF637B-8002-7D59-D5ADF84898973DDB','52EF7787-8002-7D59-D5A193682CB30DFF','52E833B4-8002-7D59-D5A5E32546528106'),('mediakits','2017-09-25 17:04:59','1E07E5AE-8002-7D59-D5AAD26837ECE6CF','5303667E-8002-7D59-D5AE63D0F28D5793','53036C39-8002-7D59-D5A218D44B50149A','17EEE829-8002-7D59-D5A547F60F6EF7CC'),('mediakits','2017-09-25 17:21:50','52EF637B-8002-7D59-D5ADF84898973DDB','539DA8DC-8002-7D59-D5AA706E955E2067','539DADC9-8002-7D59-D5AC2F71AB9F8AAA','52E833B4-8002-7D59-D5A5E32546528106'),('mediakits','2017-10-12 19:26:49','281EEE24-8002-7D59-D5AF57F3FFC7F45B','C38EC8F7-8002-7D59-D5AA5E33656CAC96','C38EDE1C-8002-7D59-D5A504673A5A7D21','281327B8-8002-7D59-D5A7ECC118BA6ACF'),('mediakits','2017-10-12 19:42:38','C38EC8F7-8002-7D59-D5AA5E33656CAC96','C41F80E2-8002-7D59-D5A928CC58C5D31D','C41F8AC1-8002-7D59-D5AB54F4C07C7CFB','281327B8-8002-7D59-D5A7ECC118BA6ACF'),('mediakits','2017-10-12 20:07:03','C41F80E2-8002-7D59-D5A928CC58C5D31D','C4FF2165-8002-7D59-D5A774032F66CEAB','C4FF272B-8002-7D59-D5A0CD1328E3B7FE','281327B8-8002-7D59-D5A7ECC118BA6ACF'),('mediakits','2017-10-12 20:07:48','C41F80E2-8002-7D59-D5A928CC58C5D31D','C505F527-8002-7D59-D5A96F348E1B6056','C5060979-8002-7D59-D5AEFA3879CEDC27','281327B8-8002-7D59-D5A7ECC118BA6ACF'),('mediakits','2017-10-12 20:08:09','C505F527-8002-7D59-D5A96F348E1B6056','C5093699-8002-7D59-D5AB54D30ABBE25B','C5093D5F-8002-7D59-D5ACAC809124393F','281327B8-8002-7D59-D5A7ECC118BA6ACF'),('mediakits','2017-10-12 20:09:06','539DA8DC-8002-7D59-D5AA706E955E2067','C511EC61-8002-7D59-D5A6439AD36C178D','C511F399-8002-7D59-D5AF95ACCA51563C','52E833B4-8002-7D59-D5A5E32546528106'),('mediakits','2017-10-12 20:09:54','C511EC61-8002-7D59-D5A6439AD36C178D','C519489A-8002-7D59-D5AC71F7FD830DB9','C5194E19-8002-7D59-D5A8E7C57C0D8FE8','52E833B4-8002-7D59-D5A5E32546528106'),('mediakits','2017-10-12 20:15:56','C519489A-8002-7D59-D5AC71F7FD830DB9','C5508595-8002-7D59-D5A0909F4FAC8FC3','C5508ABC-8002-7D59-D5A64CA581955415','52E833B4-8002-7D59-D5A5E32546528106'),('mediakits','2017-10-12 20:19:56','C5508595-8002-7D59-D5A0909F4FAC8FC3','C5751E49-8002-7D59-D5A9E5B2982F94BF','C5752275-8002-7D59-D5A39E002E68D67B','52E833B4-8002-7D59-D5A5E32546528106'),('mediakits','2017-10-12 20:21:47','C519489A-8002-7D59-D5AC71F7FD830DB9','C5860A90-8002-7D59-D5A52570EE9DF193','C5860FEB-8002-7D59-D5AA5F8634BB806B','52E833B4-8002-7D59-D5A5E32546528106'),('mediakits','2017-10-12 20:27:39','C519489A-8002-7D59-D5AC71F7FD830DB9','C5BBC644-8002-7D59-D5A746C1F49C2F30','C5BBCB54-8002-7D59-D5AE818DEBC03A36','52E833B4-8002-7D59-D5A5E32546528106'),('mediakits','2017-10-12 20:28:42','C5093699-8002-7D59-D5AB54D30ABBE25B','C5C5591C-8002-7D59-D5A76F3CB463F10D','C5C55D4B-8002-7D59-D5AD189A7922B904','281327B8-8002-7D59-D5A7ECC118BA6ACF'),('mediakits','2017-10-13 18:23:01','5303667E-8002-7D59-D5AE63D0F28D5793','F4C6C716-8002-7D59-D5AC1718F5C0F4D1','F4C6CCA6-8002-7D59-D5A2F830520493C7','17EEE829-8002-7D59-D5A547F60F6EF7CC'),('mediakits','2017-10-13 18:32:53','F4C6C716-8002-7D59-D5AC1718F5C0F4D1','F52119DF-8002-7D59-D5AAEFA921DADC88','F5211EB8-8002-7D59-D5A0AA12BD2186AC','17EEE829-8002-7D59-D5A547F60F6EF7CC'),('mediakits','2017-10-13 19:51:28','F7F08642-8002-7D59-D5AF855B0502483A','F7F0885F-8002-7D59-D5AFA05978398D00','F7F08EB4-8002-7D59-D5AC90194567CB3F','F7E95C3D-8002-7D59-D5AA6ECD31E77B35'),('mediakits','2017-10-13 19:57:53','F7F0885F-8002-7D59-D5AFA05978398D00','F82B3F75-8002-7D59-D5A52F40ED262C0D','F82B4405-8002-7D59-D5A0CFAE8C5C1A65','F7E95C3D-8002-7D59-D5AA6ECD31E77B35'),('mediakits','2017-10-13 20:03:57','F82B3F75-8002-7D59-D5A52F40ED262C0D','F862CE1E-8002-7D59-D5A28EAF060F715F','F862D2FB-8002-7D59-D5ACD3F22DD5A754','F7E95C3D-8002-7D59-D5AA6ECD31E77B35');
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
INSERT INTO `timagesizes` VALUES ('1626A788-8002-7D59-D5A6AFF5A1DB2185','default','carouselimage','500','1200'),('16BA48E4-8002-7D59-D5AC135731754F06','mediakits','carouselimage','500','1200');
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
INSERT INTO `tmailinglist` VALUES ('1618715B-8002-7D59-D5A9D6DE0FAEFFA2','default','Please Remove Me from All Lists','','2017-09-24 12:41:40',1,1),('16404733-8002-7D59-D5A34B163089AD64','mediakits','Please Remove Me from All Lists',NULL,'2017-09-24 12:46:01',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tplugins`
--

LOCK TABLES `tplugins` WRITE;
/*!40000 ALTER TABLE `tplugins` DISABLE KEYS */;
INSERT INTO `tplugins` VALUES (1,'1DE5C1F2-8002-7D59-D5AA74244ECCFF07','mediakitsFunctions','2017-09-24 23:21:09','Steve Withington','http://stephenwithington.com','Application','5.0.1',1,'mediakitsFunctions','mediakitsFunctions',5);
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
INSERT INTO `tpluginscripts` VALUES ('1DF24515-8002-7D59-D5A762BE17CFC070','1DE5C1F2-8002-7D59-D5AA74244ECCFF07','onApplicationLoad','model.handlers.mediakitsFunctions','false');
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
INSERT INTO `tsettings` VALUES ('default','Default',NULL,1000,'none','defaultmura.loc',NULL,NULL,'king@werwards.com',NULL,NULL,NULL,0,1,0,NULL,0,0,1,20,1,3,'Left Column^Main Content^Right Column',2,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default','default',1,0,1,'default','y',600,'s',80,'s',180,NULL,NULL,NULL,NULL,'?display=login','?display=editProfile',1,0,NULL,NULL,NULL,1,'MuraBootstrap3','25','110','false','false',NULL,NULL,0,60,'',1,'16242A31-8002-7D59-D5A995D94D03B605',0,0,'80','80','180','180','600','AUTO',NULL,NULL,0,0,'',NULL,'default','default','default',NULL,NULL,NULL,NULL,0,0,0,0,NULL,80,NULL,NULL,NULL,0,NULL,NULL),('mediakits','media Kits',NULL,1000,'none','www.mediakits.com',NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,NULL,0,0,1,20,1,3,'Left Column^Main Content^Right Column',2,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mediakits','mediakits','mediakits',2,0,1,'mediakits',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'?display=login','?display=editProfile',1,0,NULL,NULL,NULL,1,'MuraBootstrap3','25','110','false','false',NULL,'mediakits.loc\r\ntest.mediakits.com\r\nwww.mediakits.com\r\nmediakits.local',0,60,'media Kits Tageline',1,'16403EA9-8002-7D59-D5ACAD116F6B3069',0,0,'80','80','180','180','AUTO','600',NULL,NULL,1,0,'',NULL,'mediakits','mediakits','mediakits',NULL,NULL,NULL,'en',0,0,0,0,NULL,80,NULL,NULL,NULL,0,NULL,NULL);
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
INSERT INTO `tusers` VALUES ('1617BA7D-8002-7D59-D5A11A64D1C301B2',NULL,'Admin','User','admin','$2a$10$mNkIweq6w9SAItEzPPrBiOXYJujLls3/LrJxIKb.X7paT7JpDVgb.','2017-09-24 12:43:43','king@werwards.com',NULL,NULL,NULL,NULL,2,'Default',NULL,NULL,NULL,1,'2017-10-18 20:12:06','2017-09-24 12:41:40','System','22FC551F-FABE-EA01-C6EDD0885DDC1682',0,0,0,'default',0,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-24 19:41:40',NULL,NULL,NULL),('1618715C-8002-7D59-D5AD0A66A5A9C68D','Admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Default',NULL,NULL,NULL,0,NULL,'2017-09-24 12:41:40','System',NULL,1,0,0,'default',0,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-24 19:41:40',NULL,NULL,NULL),('1640473F-8002-7D59-D5A83668F289F020','Admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Default',NULL,NULL,NULL,0,NULL,'2017-09-24 12:46:01','System',NULL,1,0,0,'mediakits',0,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-24 19:46:01',NULL,NULL,NULL);
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
INSERT INTO `tuserstrikes` VALUES ('admin',0,'2017-10-18 20:11:06'),('t',1,'2017-10-17 19:48:23');
/*!40000 ALTER TABLE `tuserstrikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'muradcf8aa48cfe9e84d53300e47fbb7ea73'
--

--
-- Dumping routines for database 'muradcf8aa48cfe9e84d53300e47fbb7ea73'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-18 23:28:48
