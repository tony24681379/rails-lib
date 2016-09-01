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
-- Table structure for table `daily_problems`
--

DROP TABLE IF EXISTS `daily_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `machine_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `problem_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `maintainer_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `solve_detail` varchar(255) DEFAULT NULL,
  `solve_date` datetime DEFAULT NULL,
  `maintain_state` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_daily_problems_date_machine_id` (`date`,`machine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_problems`
--

LOCK TABLES `daily_problems` WRITE;
/*!40000 ALTER TABLE `daily_problems` DISABLE KEYS */;
INSERT INTO `daily_problems` VALUES (1,'2016-07-14','Kiosk_2F','test3','螢幕不亮','','','2016-07-14 17:52:00',1),(2,'2016-07-14','C201','test3','','test2','備註','2016-07-14 17:52:00',1),(3,'2016-07-14','C201','test3','螢幕2不亮','','','2016-07-14 17:52:00',1),(4,'2016-07-18','F501',NULL,'mouse problem',NULL,'change mouse','2016-07-19 00:00:00',4),(5,'2016-07-18','F502',NULL,'key problem',NULL,'change','2016-07-19 00:00:00',4),(6,'2016-07-18','F603',NULL,'haha',NULL,'chchc','2016-07-19 00:00:00',4),(7,'2016-08-01','C221','å³å¤§å“¥','我覺得怪怪的',NULL,'重新開機','2016-08-01 00:00:00',1),(10,'2016-08-02','F604','尹君杰','滑鼠無法從電腦睡眠中醒來，必須重新插拔滑鼠USB 線',NULL,NULL,NULL,1),(11,'2016-08-04','F102','å³å¤§å“¥','VGA線被拔掉',NULL,'','2016-08-04 00:00:00',1),(12,'2016-08-05','F604','å³å¤§å“¥','滑鼠無反應，需重插USB才能work',NULL,NULL,NULL,1),(13,'2016-08-09','F201','吳大哥','test1',NULL,NULL,NULL,1),(14,'2016-08-09','F204','吳大哥','test2',NULL,NULL,NULL,1),(15,'2016-08-09','F101','吳大哥','電腦主機電源線被拔掉',NULL,'重新開機','2016-08-09 00:00:00',1),(16,'2016-08-09','F106','吳大哥','test2',NULL,NULL,NULL,1),(17,'2016-08-09','L301','吳大哥','螢幕畫面解析度錯亂',NULL,'電腦主機重新調整解析度','2016-08-09 00:00:00',1),(19,'2016-08-14','F201','吳大哥','test3',NULL,NULL,NULL,1),(20,'2016-08-14','F102','吳大哥','test',NULL,NULL,NULL,1),(21,'2016-08-16','F203','尹君杰','電腦主機電源線鬆開',NULL,'電源線重新安裝','2016-08-16 00:00:00',1),(22,'2016-08-16','F604','尹君杰','滑鼠無法在主機醒來後可以繼續使用',NULL,NULL,NULL,1),(23,'2016-09-01','F201','test111','Kiosk - Kiosk主機當機無法正常使用',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `daily_problems` ENABLE KEYS */;
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
