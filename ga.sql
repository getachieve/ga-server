-- MySQL dump 10.13  Distrib 8.0.12, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: getachieve
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `artifact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `artifact_piece` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `artifact_id` int(10) unsigned NOT NULL,
  `idx` smallint(6) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `artifact_piece_fk0` (`artifact_id`),
  CONSTRAINT `artifact_piece_fk0` FOREIGN KEY (`artifact_id`) REFERENCES `artifact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `geo_materials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coord` point NOT NULL,
  `material_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `collected` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `geo_materials_fk0` (`material_id`),
  KEY `geo_materials_fk1` (`user_id`),
  SPATIAL KEY `idx_geo_materials_coord` (`coord`),
  CONSTRAINT `geo_materials_fk0` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`),
  CONSTRAINT `geo_materials_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_materials`
--

LOCK TABLES `geo_materials` WRITE;
/*!40000 ALTER TABLE `geo_materials` DISABLE KEYS */;
INSERT INTO `geo_materials` VALUES (1,_binary '\0\0\0\0\0\0\0\ÎdjØ5I@™\Û\÷‡±›>@',6,1,0),(2,_binary '\0\0\0\0\0\0\0\ÝWHm4I@¨‡\r»”ž>@',7,1,0),(3,_binary '\0\0\0\0\0\0\0\\˜>ª5I@:úF¥œ>@',4,1,0),(4,_binary '\0\0\0\0\0\0\0„¸\Õ \n5I@+\É+š>@',2,1,0),(5,_binary '\0\0\0\0\0\0\0\í@cG_4I@qjo	#ž>@',4,1,0),(6,_binary '\0\0\0\0\0\0\0uK\Ý[²3I@ “1\ã™>@',2,1,0),(7,_binary '\0\0\0\0\0\0\0\ÉPÛ§_4I@>¾@{>@',2,1,0),(8,_binary '\0\0\0\0\0\0\0¦\ö¿¯S3I@\Õ\×Ê¶™š>@',7,1,0),(9,_binary '\0\0\0\0\0\0\0§¶\í3I@¿EHY–>@',2,1,0),(10,_binary '\0\0\0\0\0\0\0O=\Äd5I@x4£Yš>@',1,1,0),(11,_binary '\0\0\0\0\0\0\0˜\Õ1…4I@†\Ê;^³ž>@',5,1,0),(12,_binary '\0\0\0\0\0\0\0™2‰\Ýk3I@’ûˆ%ž>@',2,1,0),(13,_binary '\0\0\0\0\0\0\0\ÙJ}“4I@“h›>@',7,1,0);
/*!40000 ALTER TABLE `geo_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_synthesis`
--

DROP TABLE IF EXISTS `material_synthesis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `material_synthesis` (
  `child_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `cnt` tinyint(4) NOT NULL,
  PRIMARY KEY (`child_id`,`parent_id`),
  KEY `material_synthesis_fk1` (`parent_id`),
  CONSTRAINT `material_synthesis_fk0` FOREIGN KEY (`child_id`) REFERENCES `materials` (`id`),
  CONSTRAINT `material_synthesis_fk1` FOREIGN KEY (`parent_id`) REFERENCES `materials` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_synthesis`
--

LOCK TABLES `material_synthesis` WRITE;
/*!40000 ALTER TABLE `material_synthesis` DISABLE KEYS */;
INSERT INTO `material_synthesis` VALUES (1,3,1),(2,3,1);
/*!40000 ALTER TABLE `material_synthesis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `materials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `generation` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

LOCK TABLES `materials` WRITE;
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT INTO `materials` VALUES (1,'sand','sand.jpg',0),(2,'fire','fire.jpg',0),(3,'glass','glass.jpg',1),(4,'stone','stone.jpg',0),(5,'tree','tree.jpg',0),(6,'cement','cement.jpg',0),(7,'air','air.jpg',0);
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_artifact_piece_reward`
--

DROP TABLE IF EXISTS `task_artifact_piece_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `task_artifact_piece_reward` (
  `task_id` int(10) unsigned NOT NULL,
  `artifact_piece_id` int(10) unsigned NOT NULL,
  KEY `task_artifact_piece_reward_fk0` (`task_id`),
  KEY `task_artifact_piece_reward_fk1` (`artifact_piece_id`),
  CONSTRAINT `task_artifact_piece_reward_fk0` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `task_artifact_piece_reward_fk1` FOREIGN KEY (`artifact_piece_id`) REFERENCES `artifact_piece` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `task_artifact_required` (
  `task_id` int(10) unsigned NOT NULL,
  `artifact_id` int(10) unsigned NOT NULL,
  KEY `task_artifact_required_fk0` (`task_id`),
  KEY `task_artifact_required_fk1` (`artifact_id`),
  CONSTRAINT `task_artifact_required_fk0` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `task_artifact_required_fk1` FOREIGN KEY (`artifact_id`) REFERENCES `artifact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_artifact_required`
--

LOCK TABLES `task_artifact_required` WRITE;
/*!40000 ALTER TABLE `task_artifact_required` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_artifact_required` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_material_required`
--

DROP TABLE IF EXISTS `task_material_required`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `task_material_required` (
  `task_id` int(10) unsigned NOT NULL,
  `material_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`task_id`,`material_id`),
  KEY `task_material_required_fk1` (`material_id`),
  CONSTRAINT `task_material_required_fk0` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `task_material_required_fk1` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_material_required`
--

LOCK TABLES `task_material_required` WRITE;
/*!40000 ALTER TABLE `task_material_required` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_material_required` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_material_reward`
--

DROP TABLE IF EXISTS `task_material_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `task_material_reward` (
  `task_id` int(10) unsigned NOT NULL,
  `material_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`material_id`),
  KEY `task_material_reward_fk0` (`task_id`),
  CONSTRAINT `task_material_reward_fk0` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `task_material_reward_fk1` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_material_reward`
--

LOCK TABLES `task_material_reward` WRITE;
/*!40000 ALTER TABLE `task_material_reward` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_material_reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `coord` point NOT NULL,
  `min_level` smallint(6) NOT NULL,
  `keys_amount` smallint(6) NOT NULL,
  `points_reward` mediumint(9) NOT NULL,
  `carma_reward` mediumint(9) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiles_materials`
--

DROP TABLE IF EXISTS `tiles_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tiles_materials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lat_south` decimal(4,2) NOT NULL,
  `lon_west` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tiles_materials_lat_south_lon_west` (`lat_south`,`lon_west`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiles_materials`
--

LOCK TABLES `tiles_materials` WRITE;
/*!40000 ALTER TABLE `tiles_materials` DISABLE KEYS */;
INSERT INTO `tiles_materials` VALUES (1,50.40,30.60);
/*!40000 ALTER TABLE `tiles_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_materials`
--

DROP TABLE IF EXISTS `user_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_materials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `material_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `cnt` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_materials_materials_id` (`material_id`),
  CONSTRAINT `fk_user_materials_materials_id` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_materials`
--

LOCK TABLES `user_materials` WRITE;
/*!40000 ALTER TABLE `user_materials` DISABLE KEYS */;
INSERT INTO `user_materials` VALUES (2,6,1,1),(4,3,1,2);
/*!40000 ALTER TABLE `user_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tasks`
--

DROP TABLE IF EXISTS `user_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'radalex',0,'creator','222','urafan@gmail.com',1,0,0,0,0,NULL,NULL,NULL,'lead');
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

-- Dump completed on 2018-09-28 23:36:30
