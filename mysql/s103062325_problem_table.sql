-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 140.114.73.33    Database: s103062325
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.16-MariaDB-1~jessie

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
-- Table structure for table `problem_table`
--

DROP TABLE IF EXISTS `problem_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem_table` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `floor` int(11) NOT NULL DEFAULT '0',
  `device_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `discover_date` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `problem` text COLLATE utf8_unicode_ci NOT NULL,
  `solve_date` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `solve_description` text COLLATE utf8_unicode_ci NOT NULL,
  `report_or_not` tinyint(1) NOT NULL,
  `whoid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_table`
--

LOCK TABLES `problem_table` WRITE;
/*!40000 ALTER TABLE `problem_table` DISABLE KEYS */;
INSERT INTO `problem_table` VALUES (11,3,'f302','2016/07/19','keyboard2','2016/07/31','ok',1,334,'eric'),(12,3,'f302','2016/07/19','keyboard2','2016/07/31','ok',1,334,'eric'),(13,3,'f302','2016/07/19','keyboard2','2016/07/31','ok',1,334,'eric'),(14,3,'f302','2016/07/19','keyboard2','2016/07/31','ok',1,334,'eric'),(15,3,'f302','2016/07/19','keyboard2','2016/07/31','ok',1,334,'eric'),(16,3,'f302','2016/07/19','keyboard2','2016/07/31','ok',1,334,'eric'),(17,3,'f302','2016/07/19','keyboard2','2016/07/31','ok',1,334,'eric'),(18,3,'f302','2016/07/19','keyboard2','2016/07/31','ok',1,334,'eric'),(19,3,'f302','2016/07/19','keyboard2','2016/07/31','ok',1,334,'eric'),(20,3,'f302','2016/07/19','keyboard2','2016/07/31','ok',1,334,'eric'),(21,3,'f302','2016/07/19','keyboard2','2016/07/31','ok',1,334,'eric'),(22,3,'f302','2016/07/19','keyboard2','2016/07/31','ok',1,334,'eric'),(23,3,'f302','2016/07/19','keyboard2','2016/07/31','ok',1,334,'eric'),(24,3,'f302','2016/07/19','keyboard2','2016/07/31','ok',1,334,'eric'),(25,3,'f302','2016/07/19','keyboard2','2016/07/31','ok',1,334,'eric'),(26,3,'f302','2016/07/19','keyboard2','2016/07/31','ok',1,334,'eric'),(27,3,'f302','2016/07/19','keyboard2','2016/07/31','ok',1,334,'eric'),(28,3,'f302','2016/07/19','keyboard2','2016/07/31','ok',1,334,'eric');
/*!40000 ALTER TABLE `problem_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-01 16:11:19
