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
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_materials`
--

LOCK TABLES `geo_materials` WRITE;
/*!40000 ALTER TABLE `geo_materials` DISABLE KEYS */;
INSERT INTO `geo_materials` VALUES (1,'\0\0\0\0\0\0\0Xx3H\0xI@��3� ?@',2,1),(2,'\0\0\0\0\0\0\0���@RI@Lz�Q��>@',7,1),(3,'\0\0\0\0\0\0\0�e��K|I@�K���Z?@',6,1),(4,'\0\0\0\0\0\0\0Q����qI@��!�c?@',4,1),(5,'\0\0\0\0\0\0\0Z�X��JI@7#l�/?@',2,1),(6,'\0\0\0\0\0\0\0\n���]I@���y�>@',5,1),(7,'\0\0\0\0\0\0\0N1��?I@�uJQ�>@',4,1),(8,'\0\0\0\0\0\0\0+�ᜨI@�^�7?@',6,1),(9,'\0\0\0\0\0\0\0+�۪wI@�KM�߭>@',5,1),(10,'\0\0\0\0\0\0\0&�^�ɣI@�ռS�>@',4,1),(11,'\0\0\0\0\0\0\06���ŴI@ߣ��?@',4,1),(12,'\0\0\0\0\0\0\0��߆I@��\Z���>@',1,1),(13,'\0\0\0\0\0\0\0\n���I@����_?@',2,1),(14,'\0\0\0\0\0\0\0q(�w�5I@g��e�?@',7,1),(15,'\0\0\0\0\0\0\0~��I@��;�>@',4,1),(16,'\0\0\0\0\0\0\0I�UυI@Q�~ē?@',1,1),(17,'\0\0\0\0\0\0\01��yI@Bĺ��>@',6,1),(18,'\0\0\0\0\0\0\06=�m\r7I@����t�>@',5,1),(19,'\0\0\0\0\0\0\0�わ�aI@�XR�?@',2,1),(20,'\0\0\0\0\0\0\0����I@5Z��\n?@',6,1),(21,'\0\0\0\0\0\0\0|䞚��I@�Vr�?@',6,1),(22,'\0\0\0\0\0\0\0)�;�=�I@�\0�x?@',6,1),(23,'\0\0\0\0\0\0\0\"��Y��I@4����>@',1,1),(24,'\0\0\0\0\0\0\0\n�BE�I@規}m�>@',4,1),(25,'\0\0\0\0\0\0\0`�@wlI@]I�\'Ó?@',6,1),(26,'\0\0\0\0\0\0\0�u�G�<I@��+��>@',1,1),(27,'\0\0\0\0\0\0\0�yY5\0�I@��	�?@',5,1),(28,'\0\0\0\0\0\0\0��;��HI@}�<��?@',5,1),(29,'\0\0\0\0\0\0\0B�{�VI@�[�+�l?@',7,1),(30,'\0\0\0\0\0\0\0�+٬�nI@]QЫ�>@',2,1),(31,'\0\0\0\0\0\0\0pW\'U�iI@E��w[�>@',5,1),(32,'\0\0\0\0\0\0\0̳�|�I@��<\'��>@',6,1),(33,'\0\0\0\0\0\0\0X+� �LI@\\�Zj?@',2,1),(34,'\0\0\0\0\0\0\0����]HI@��!�I?@',6,1),(35,'\0\0\0\0\0\0\0�՗�<=I@ɹG�?@',1,1),(36,'\0\0\0\0\0\0\0(M?=�^I@h��S�>@',7,1),(37,'\0\0\0\0\0\0\0���3�I@�����>@',2,1),(38,'\0\0\0\0\0\0\0\"%<:�I@��k�ZP?@',1,1),(39,'\0\0\0\0\0\0\0��l-dI@�L�f�K?@',4,1),(40,'\0\0\0\0\0\0\0s}Wv�I@��<�\'�>@',1,1),(41,'\0\0\0\0\0\0\0���z�I@��\n��?@',2,1),(42,'\0\0\0\0\0\0\0�4�clI@m5���?@',1,1),(43,'\0\0\0\0\0\0\0l���yI@b1{�3W?@',6,1),(44,'\0\0\0\0\0\0\0�q��]I@�e_}�w?@',2,1),(45,'\0\0\0\0\0\0\0ɞH�I@�y+�qL?@',2,1),(46,'\0\0\0\0\0\0\0鋸ӊ�I@�Ì51�>@',5,1),(47,'\0\0\0\0\0\0\0�9L��}I@,����*?@',5,1),(48,'\0\0\0\0\0\0\0�4C�sI@|\r�t?@',1,1),(49,'\0\0\0\0\0\0\0��`�aI@M�^	��>@',5,1),(50,'\0\0\0\0\0\0\0\nϳ��TI@VR�>@',7,1),(51,'\0\0\0\0\0\0\05�rI@o�r�?@',5,1),(52,'\0\0\0\0\0\0\0߄��e�I@��Pz?@',1,1),(53,'\0\0\0\0\0\0\0�8�I@|�����>@',1,1),(54,'\0\0\0\0\0\0\0�ʽ�\ZSI@�u���>@',2,1),(55,'\0\0\0\0\0\0\0�J�g��I@�C4�\"�?@',1,1),(56,'\0\0\0\0\0\0\0�@��w�I@����?@',2,1),(57,'\0\0\0\0\0\0\0�Ũ:g?I@�e�\"\n?@',6,1),(58,'\0\0\0\0\0\0\0���nܭI@Ǻ�-��>@',7,1),(59,'\0\0\0\0\0\0\0x^%��lI@��vd��?@',5,1),(60,'\0\0\0\0\0\0\0�p����I@/���g-?@',2,1),(61,'\0\0\0\0\0\0\0#��d�I@����G�>@',2,1),(62,'\0\0\0\0\0\0\0y�3惒I@�ǃ9Ԧ>@',4,1),(63,'\0\0\0\0\0\0\0Ʒ�I�wI@���d5�>@',5,1),(64,'\0\0\0\0\0\0\0�\Z��\r[I@<♃i2?@',1,1),(65,'\0\0\0\0\0\0\0p^��3�I@��+�G�>@',5,1),(66,'\0\0\0\0\0\0\089��HI@���>@',7,1),(67,'\0\0\0\0\0\0\0��0��I@�>�6?@',7,1),(68,'\0\0\0\0\0\0\0���x�I@	�Pm��>@',1,1),(69,'\0\0\0\0\0\0\0�fܗVI@��V�?@',4,1),(70,'\0\0\0\0\0\0\0�q}OI@tW[w\'�>@',2,1),(71,'\0\0\0\0\0\0\0H�eI@\Z���=?@',5,1),(72,'\0\0\0\0\0\0\0��>��I@��\'�O?@',1,1),(73,'\0\0\0\0\0\0\0��n�CI@%\r�U?@',4,1),(74,'\0\0\0\0\0\0\0E�$ӔCI@e�ʏ�>@',2,1),(75,'\0\0\0\0\0\0\0Gy�n�I@;�^��A?@',1,1),(76,'\0\0\0\0\0\0\0VyP�y�I@9r�q��>@',5,1),(77,'\0\0\0\0\0\0\0,]�<�jI@K�M֘?@',2,1),(78,'\0\0\0\0\0\0\0�*fo|�I@FWY�m?@',2,1),(79,'\0\0\0\0\0\0\0��yfnI@,>�i�?@',6,1),(80,'\0\0\0\0\0\0\0�(��PI@\'m>7�?@',7,1),(81,'\0\0\0\0\0\0\0C��cI@\n�Wo�^?@',4,1),(82,'\0\0\0\0\0\0\00D�_�tI@N0|�ak?@',5,1),(83,'\0\0\0\0\0\0\0��o3FI@H1�N�>@',2,1),(84,'\0\0\0\0\0\0\0~ض�atI@d��0\'�>@',5,1),(85,'\0\0\0\0\0\0\0���}eSI@���Pa�?@',7,1),(86,'\0\0\0\0\0\0\0>�~�I@���+\n?@',6,1),(87,'\0\0\0\0\0\0\06���4I@�oky�>@',1,1),(88,'\0\0\0\0\0\0\0%\n��z�I@q�һ�>@',6,1),(89,'\0\0\0\0\0\0\0%��K��I@$Eg��Z?@',5,1),(90,'\0\0\0\0\0\0\0U��7�II@)+o?@',6,1),(91,'\0\0\0\0\0\0\0�Hcj�_I@�p��r�?@',1,1),(92,'\0\0\0\0\0\0\0>��j�nI@�|�]��>@',7,1),(93,'\0\0\0\0\0\0\0�r���`I@�O=�>@',5,1),(94,'\0\0\0\0\0\0\0�C\nA�QI@���_�*?@',2,1),(95,'\0\0\0\0\0\0\0\Z��I@�����?@',7,1),(96,'\0\0\0\0\0\0\0$�4�e�I@��\Z�^B?@',6,1),(97,'\0\0\0\0\0\0\0�n��RI@^s�.�>@',6,1),(98,'\0\0\0\0\0\0\0{\"�I��I@��`8U	?@',1,1),(99,'\0\0\0\0\0\0\0�<\\+2vI@�Ƣ�`8?@',4,1),(100,'\0\0\0\0\0\0\0��SI@��(?@',5,1),(101,'\0\0\0\0\0\0\0�BMш�I@s>W��?@',6,1),(102,'\0\0\0\0\0\0\0� �\0~I@�kX�?@',5,1),(103,'\0\0\0\0\0\0\0NH�!�I@���B��?@',4,1),(104,'\0\0\0\0\0\0\0Q	\\�g�I@��P��i?@',2,1);
/*!40000 ALTER TABLE `geo_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_synthesis`
--

DROP TABLE IF EXISTS `material_synthesis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_synthesis` (
  `child_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
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
INSERT INTO `material_synthesis` VALUES (1,3),(2,3);
/*!40000 ALTER TABLE `material_synthesis` ENABLE KEYS */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiles_materials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coord_sw` point NOT NULL,
  `coord_ne` point NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiles_materials`
--

LOCK TABLES `tiles_materials` WRITE;
/*!40000 ALTER TABLE `tiles_materials` DISABLE KEYS */;
INSERT INTO `tiles_materials` VALUES (1,'\0\0\0\0\0\0\0333333I@������>@','\0\0\0\0\0\0\0�(\\��5I@��Q��>@'),(2,'\0\0\0\0\0\0\0333333I@������>@','\0\0\0\0\0\0\0�(\\��5I@��Q��>@'),(3,'\0\0\0\0\0\0\0333333I@������>@','\0\0\0\0\0\0\0�(\\��5I@��Q��>@'),(4,'\0\0\0\0\0\0\0333333I@������>@','\0\0\0\0\0\0\0�(\\��5I@��Q��>@'),(5,'\0\0\0\0\0\0\0333333I@������>@','\0\0\0\0\0\0\0�(\\��5I@��Q��>@'),(6,'\0\0\0\0\0\0\0333333I@������>@','\0\0\0\0\0\0\0�(\\��5I@��Q��>@'),(7,'\0\0\0\0\0\0\0333333I@������>@','\0\0\0\0\0\0\0�(\\��5I@��Q��>@'),(8,'\0\0\0\0\0\0\0333333I@������>@','\0\0\0\0\0\0\0�(\\��5I@��Q��>@'),(9,'\0\0\0\0\0\0\0333333I@������>@','\0\0\0\0\0\0\0�(\\��5I@��Q��>@'),(10,'\0\0\0\0\0\0\0333333I@������>@','\0\0\0\0\0\0\0�(\\��5I@��Q��>@'),(11,'\0\0\0\0\0\0\0333333I@������>@','\0\0\0\0\0\0\0�(\\��5I@��Q��>@'),(12,'\0\0\0\0\0\0\0333333I@������>@','\0\0\0\0\0\0\0�(\\��5I@��Q��>@');
/*!40000 ALTER TABLE `tiles_materials` ENABLE KEYS */;
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

-- Dump completed on 2018-09-21 22:01:16
