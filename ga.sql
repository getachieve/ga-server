-- MySQL dump 10.16  Distrib 10.3.9-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: getachieve
-- ------------------------------------------------------
-- Server version	10.3.9-MariaDB-1:10.3.9+maria~xenial-log

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
-- Table structure for table `artifact`
--

DROP TABLE IF EXISTS `artifact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artifact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artifact`
--

LOCK TABLES `artifact` WRITE;
/*!40000 ALTER TABLE `artifact` DISABLE KEYS */;
/*!40000 ALTER TABLE `artifact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artifact_piece`
--

DROP TABLE IF EXISTS `artifact_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artifact_piece` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `artifact_id` int(10) unsigned NOT NULL,
  `idx` smallint(6) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `artifact_piece_fk0` (`artifact_id`),
  CONSTRAINT `artifact_piece_fk0` FOREIGN KEY (`artifact_id`) REFERENCES `artifact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artifact_piece`
--

LOCK TABLES `artifact_piece` WRITE;
/*!40000 ALTER TABLE `artifact_piece` DISABLE KEYS */;
/*!40000 ALTER TABLE `artifact_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_materials`
--

DROP TABLE IF EXISTS `geo_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_materials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coord` point NOT NULL,
  `material_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `geo_materials_fk0` (`material_id`),
  KEY `geo_materials_fk1` (`user_id`),
  CONSTRAINT `geo_materials_fk0` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`),
  CONSTRAINT `geo_materials_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_materials`
--

LOCK TABLES `geo_materials` WRITE;
/*!40000 ALTER TABLE `geo_materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `geo_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_resource`
--

DROP TABLE IF EXISTS `material_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_resource` (
  `material_id` int(10) unsigned NOT NULL,
  `resource_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`material_id`,`resource_id`),
  KEY `material_resource_fk1` (`resource_id`),
  CONSTRAINT `material_resource_fk0` FOREIGN KEY (`material_id`) REFERENCES `resources` (`id`),
  CONSTRAINT `material_resource_fk1` FOREIGN KEY (`resource_id`) REFERENCES `materials` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_resource`
--

LOCK TABLES `material_resource` WRITE;
/*!40000 ALTER TABLE `material_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

LOCK TABLES `materials` WRITE;
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_artifact_piece_reward`
--

DROP TABLE IF EXISTS `task_artifact_piece_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_artifact_piece_reward` (
  `task_id` int(10) unsigned NOT NULL,
  `artifact_piece_id` int(10) unsigned NOT NULL,
  KEY `task_artifact_piece_reward_fk0` (`task_id`),
  KEY `task_artifact_piece_reward_fk1` (`artifact_piece_id`),
  CONSTRAINT `task_artifact_piece_reward_fk0` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `task_artifact_piece_reward_fk1` FOREIGN KEY (`artifact_piece_id`) REFERENCES `artifact_piece` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_artifact_piece_reward`
--

LOCK TABLES `task_artifact_piece_reward` WRITE;
/*!40000 ALTER TABLE `task_artifact_piece_reward` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_artifact_piece_reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_artifact_required`
--

DROP TABLE IF EXISTS `task_artifact_required`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_artifact_required` (
  `task_id` int(10) unsigned NOT NULL,
  `artifact_id` int(10) unsigned NOT NULL,
  KEY `task_artifact_required_fk0` (`task_id`),
  KEY `task_artifact_required_fk1` (`artifact_id`),
  CONSTRAINT `task_artifact_required_fk0` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `task_artifact_required_fk1` FOREIGN KEY (`artifact_id`) REFERENCES `artifact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_artifact_required`
--

LOCK TABLES `task_artifact_required` WRITE;
/*!40000 ALTER TABLE `task_artifact_required` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_artifact_required` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `coord` point NOT NULL,
  `min_level` smallint(6) NOT NULL,
  `keys_amount` smallint(6) NOT NULL,
  `points_reward` mediumint(9) NOT NULL,
  `carma_reward` mediumint(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tasks`
--

DROP TABLE IF EXISTS `user_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `completed_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_tasks_fk0` (`task_id`),
  KEY `user_tasks_fk1` (`user_id`),
  CONSTRAINT `user_tasks_fk0` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `user_tasks_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tasks`
--

LOCK TABLES `user_tasks` WRITE;
/*!40000 ALTER TABLE `user_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(60) NOT NULL,
  `karma` mediumint(9) NOT NULL,
  `fraction` enum('creator','fanatic') NOT NULL,
  `password` char(60) NOT NULL,
  `email` varchar(255) NOT NULL,
  `level` smallint(6) NOT NULL,
  `points` mediumint(9) NOT NULL,
  `keys` smallint(6) NOT NULL,
  `gat` int(11) NOT NULL,
  `coins` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `social` varchar(255) DEFAULT NULL,
  `social_id` varchar(255) DEFAULT NULL,
  `role` enum('lead','minor','indy') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2018-09-19 21:08:53
