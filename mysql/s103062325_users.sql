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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'','$2a$10$i/bnZ0JgXxr9PB6qWpQeOuuvGHMxakZxKdEvY/XFiI9hFcpGby2xe',NULL,NULL,'2016-07-20 08:02:42',5,'2016-07-20 08:02:42','2016-07-14 17:16:05','172.17.0.1','172.17.0.1','2016-06-22 04:03:14','2016-07-20 08:02:42','123','test',NULL),(6,'test@test2.com','$2a$10$tNPSPfCSlbvjn6PvrRO87O9E871kMpgATj95eCAERHZlRvkp9iuJ6',NULL,NULL,NULL,1,'2016-06-22 04:10:25','2016-06-22 04:10:25','172.17.0.1','172.17.0.1','2016-06-22 04:10:25','2016-06-22 04:10:25','lulala','test2',NULL),(7,'1@zxc.zxc','',NULL,NULL,NULL,1,'2016-07-14 16:37:12','2016-07-14 16:37:12','172.17.0.1','172.17.0.1','2016-07-14 16:37:12','2016-07-14 16:37:12','志工A','test3',NULL),(8,'test111@11','$2a$10$lcfVu6I3JK0DCMhWuFXTe.YR6bnIRmIVMuyxKKHR.ZFaEUz6yUICS',NULL,NULL,NULL,15,'2016-09-01 07:43:41','2016-09-01 07:39:51','172.17.0.1','172.17.0.1','2016-09-01 06:53:52','2016-09-01 07:43:41','test111','test111',NULL),(9,'tp6_3846@yahoo.com.tw','$2a$10$ZputU6a2b5akJ3qMRmM5yexj9UqpX7xKPA8irU5OZaQoJXytSt.my',NULL,NULL,NULL,3,'2016-09-01 07:41:45','2016-09-01 07:08:23','172.17.0.1','172.17.0.1','2016-09-01 06:57:37','2016-09-01 07:41:45','林俊辰','peter3846',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
