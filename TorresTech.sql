-- MySQL dump 10.17  Distrib 10.3.23-MariaDB, for debian-linux-gnueabihf (armv8l)
--
-- Host: localhost    Database: TorresTech
-- ------------------------------------------------------
-- Server version	10.3.23-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Employee',7,'add_employee'),(26,'Can change Employee',7,'change_employee'),(27,'Can delete Employee',7,'delete_employee'),(28,'Can view Employee',7,'view_employee'),(29,'Can add pagestat',8,'add_pagestat'),(30,'Can change pagestat',8,'change_pagestat'),(31,'Can delete pagestat',8,'delete_pagestat'),(32,'Can view pagestat',8,'view_pagestat'),(33,'Can add SEPTEMBER',9,'add_september'),(34,'Can change SEPTEMBER',9,'change_september'),(35,'Can delete SEPTEMBER',9,'delete_september'),(36,'Can view SEPTEMBER',9,'view_september'),(37,'Can add OCTOBER',10,'add_october'),(38,'Can change OCTOBER',10,'change_october'),(39,'Can delete OCTOBER',10,'delete_october'),(40,'Can view OCTOBER',10,'view_october'),(41,'Can add NOVEMBER',11,'add_november'),(42,'Can change NOVEMBER',11,'change_november'),(43,'Can delete NOVEMBER',11,'delete_november'),(44,'Can view NOVEMBER',11,'view_november'),(45,'Can add MAY',12,'add_may'),(46,'Can change MAY',12,'change_may'),(47,'Can delete MAY',12,'delete_may'),(48,'Can view MAY',12,'view_may'),(49,'Can add MARCH',13,'add_march'),(50,'Can change MARCH',13,'change_march'),(51,'Can delete MARCH',13,'delete_march'),(52,'Can view MARCH',13,'view_march'),(53,'Can add JUNE',14,'add_june'),(54,'Can change JUNE',14,'change_june'),(55,'Can delete JUNE',14,'delete_june'),(56,'Can view JUNE',14,'view_june'),(57,'Can add JULY',15,'add_july'),(58,'Can change JULY',15,'change_july'),(59,'Can delete JULY',15,'delete_july'),(60,'Can view JULY',15,'view_july'),(61,'Can add JANUARY',16,'add_january'),(62,'Can change JANUARY',16,'change_january'),(63,'Can delete JANUARY',16,'delete_january'),(64,'Can view JANUARY',16,'view_january'),(65,'Can add FEBRUARY',17,'add_february'),(66,'Can change FEBRUARY',17,'change_february'),(67,'Can delete FEBRUARY',17,'delete_february'),(68,'Can view FEBRUARY',17,'view_february'),(69,'Can add DECEMBER',18,'add_december'),(70,'Can change DECEMBER',18,'change_december'),(71,'Can delete DECEMBER',18,'delete_december'),(72,'Can view DECEMBER',18,'view_december'),(73,'Can add AUGUST',19,'add_august'),(74,'Can change AUGUST',19,'change_august'),(75,'Can delete AUGUST',19,'delete_august'),(76,'Can view AUGUST',19,'view_august'),(77,'Can add APRIL',20,'add_april'),(78,'Can change APRIL',20,'change_april'),(79,'Can delete APRIL',20,'delete_april'),(80,'Can view APRIL',20,'view_april'),(81,'Can add rfpg',21,'add_rfpg'),(82,'Can change rfpg',21,'change_rfpg'),(83,'Can delete rfpg',21,'delete_rfpg'),(84,'Can view rfpg',21,'view_rfpg'),(85,'Can add sale',22,'add_sale'),(86,'Can change sale',22,'change_sale'),(87,'Can delete sale',22,'delete_sale'),(88,'Can view sale',22,'view_sale'),(89,'Can add month',23,'add_rfpg'),(90,'Can change month',23,'change_rfpg'),(91,'Can delete month',23,'delete_rfpg'),(92,'Can view month',23,'view_rfpg'),(93,'Can add month',24,'add_sale'),(94,'Can change month',24,'change_sale'),(95,'Can delete month',24,'delete_sale'),(96,'Can view month',24,'view_sale'),(97,'Can add month',25,'add_rfpg'),(98,'Can change month',25,'change_rfpg'),(99,'Can delete month',25,'delete_rfpg'),(100,'Can view month',25,'view_rfpg'),(101,'Can add month',26,'add_sale'),(102,'Can change month',26,'change_sale'),(103,'Can delete month',26,'delete_sale'),(104,'Can view month',26,'view_sale'),(105,'Can add a s_of',27,'add_as_of'),(106,'Can change a s_of',27,'change_as_of'),(107,'Can delete a s_of',27,'delete_as_of'),(108,'Can view a s_of',27,'view_as_of'),(109,'Can add thc',28,'add_thc'),(110,'Can change thc',28,'change_thc'),(111,'Can delete thc',28,'delete_thc'),(112,'Can view thc',28,'view_thc'),(113,'Can add ttech',29,'add_ttech'),(114,'Can change ttech',29,'change_ttech'),(115,'Can delete ttech',29,'delete_ttech'),(116,'Can view ttech',29,'view_ttech'),(117,'Can add ytmi',30,'add_ytmi'),(118,'Can change ytmi',30,'change_ytmi'),(119,'Can delete ytmi',30,'delete_ytmi'),(120,'Can view ytmi',30,'view_ytmi'),(121,'Can add MAY',31,'add_may'),(122,'Can change MAY',31,'change_may'),(123,'Can delete MAY',31,'delete_may'),(124,'Can view MAY',31,'view_may'),(125,'Can add employee',32,'add_employee'),(126,'Can change employee',32,'change_employee'),(127,'Can delete employee',32,'delete_employee'),(128,'Can view employee',32,'view_employee'),(129,'Can add SEPTEMBER',33,'add_september'),(130,'Can change SEPTEMBER',33,'change_september'),(131,'Can delete SEPTEMBER',33,'delete_september'),(132,'Can view SEPTEMBER',33,'view_september'),(133,'Can add JANUARY',34,'add_january'),(134,'Can change JANUARY',34,'change_january'),(135,'Can delete JANUARY',34,'delete_january'),(136,'Can view JANUARY',34,'view_january'),(137,'Can add FEBRUARY',35,'add_february'),(138,'Can change FEBRUARY',35,'change_february'),(139,'Can delete FEBRUARY',35,'delete_february'),(140,'Can view FEBRUARY',35,'view_february'),(141,'Can add OCTOBER',36,'add_october'),(142,'Can change OCTOBER',36,'change_october'),(143,'Can delete OCTOBER',36,'delete_october'),(144,'Can view OCTOBER',36,'view_october'),(145,'Can add APRIL',37,'add_april'),(146,'Can change APRIL',37,'change_april'),(147,'Can delete APRIL',37,'delete_april'),(148,'Can view APRIL',37,'view_april'),(149,'Can add DECEMBER',38,'add_december'),(150,'Can change DECEMBER',38,'change_december'),(151,'Can delete DECEMBER',38,'delete_december'),(152,'Can view DECEMBER',38,'view_december'),(153,'Can add MARCH',39,'add_march'),(154,'Can change MARCH',39,'change_march'),(155,'Can delete MARCH',39,'delete_march'),(156,'Can view MARCH',39,'view_march'),(157,'Can add NOVEMBER',40,'add_november'),(158,'Can change NOVEMBER',40,'change_november'),(159,'Can delete NOVEMBER',40,'delete_november'),(160,'Can view NOVEMBER',40,'view_november'),(161,'Can add AUGUST',41,'add_august'),(162,'Can change AUGUST',41,'change_august'),(163,'Can delete AUGUST',41,'delete_august'),(164,'Can view AUGUST',41,'view_august'),(165,'Can add JULY',42,'add_july'),(166,'Can change JULY',42,'change_july'),(167,'Can delete JULY',42,'delete_july'),(168,'Can view JULY',42,'view_july'),(169,'Can add JUNE',43,'add_june'),(170,'Can change JUNE',43,'change_june'),(171,'Can delete JUNE',43,'delete_june'),(172,'Can view JUNE',43,'view_june'),(173,'Can add logbox',44,'add_logbox'),(174,'Can change logbox',44,'change_logbox'),(175,'Can delete logbox',44,'delete_logbox'),(176,'Can view logbox',44,'view_logbox'),(177,'Can add cur week',45,'add_curweek'),(178,'Can change cur week',45,'change_curweek'),(179,'Can delete cur week',45,'delete_curweek'),(180,'Can view cur week',45,'view_curweek'),(181,'Can add las week',46,'add_lasweek'),(182,'Can change las week',46,'change_lasweek'),(183,'Can delete las week',46,'delete_lasweek'),(184,'Can view las week',46,'view_lasweek'),(185,'Can add cur week ns',47,'add_curweekns'),(186,'Can change cur week ns',47,'change_curweekns'),(187,'Can delete cur week ns',47,'delete_curweekns'),(188,'Can view cur week ns',47,'view_curweekns'),(189,'Can add las week ns',48,'add_lasweekns'),(190,'Can change las week ns',48,'change_lasweekns'),(191,'Can delete las week ns',48,'delete_lasweekns'),(192,'Can view las week ns',48,'view_lasweekns'),(193,'Can add computation template non regular',49,'add_computationtemplatenonregular'),(194,'Can change computation template non regular',49,'change_computationtemplatenonregular'),(195,'Can delete computation template non regular',49,'delete_computationtemplatenonregular'),(196,'Can view computation template non regular',49,'view_computationtemplatenonregular'),(197,'Can add computation template regular',50,'add_computationtemplateregular'),(198,'Can change computation template regular',50,'change_computationtemplateregular'),(199,'Can delete computation template regular',50,'delete_computationtemplateregular'),(200,'Can view computation template regular',50,'view_computationtemplateregular');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$KTaHiPsd8IAg$MSI43fnry6SUYxFDk7Fopkm0gTqTOWQOlTaWAuGBkLk=','2020-10-05 21:02:06.096686',1,'admin','','','',1,1,'2020-08-04 13:20:26.069029'),(2,'pbkdf2_sha256$216000$j4FntEndRmqW$VOgr4o3SP0oaCJtLNj/klMuKEnWfz8NHrWL5nmoqZis=','2020-10-09 15:31:36.739952',0,'office','','','',1,1,'2020-08-04 13:43:59.000000'),(3,'pbkdf2_sha256$216000$WPu1Qplsjhuz$qSJuAGmQEsB7tZTws/06w9WGFJOc/SXg5JOkzxZa0JI=','2020-10-07 14:04:04.236288',0,'blairwin','','','',1,1,'2020-08-12 09:15:37.000000'),(4,'pbkdf2_sha256$216000$h6EVjCdgEZDt$hkGqFA7sC3GMcIZFMIcwrn0ufoq0UvTThzD+iUwaHvE=','2020-09-28 11:00:29.126418',0,'ngb','','','',1,1,'2020-08-17 10:12:58.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,2,26),(2,2,28),(23,2,34),(24,2,36),(25,2,38),(26,2,40),(27,2,42),(28,2,44),(29,2,46),(30,2,48),(31,2,50),(32,2,52),(33,2,54),(34,2,56),(35,2,58),(36,2,60),(37,2,62),(38,2,64),(39,2,66),(40,2,68),(41,2,70),(42,2,72),(43,2,74),(44,2,76),(45,2,78),(46,2,80),(4,2,82),(5,2,84),(6,2,86),(3,2,88),(8,2,90),(9,2,92),(10,2,94),(7,2,96),(11,2,98),(12,2,100),(13,2,102),(14,2,104),(15,2,106),(16,2,108),(17,2,110),(18,2,112),(19,2,114),(20,2,116),(21,2,118),(22,2,120),(137,3,121),(70,3,122),(138,3,123),(71,3,124),(72,3,125),(73,3,126),(74,3,127),(47,3,128),(115,3,129),(48,3,130),(116,3,131),(49,3,132),(117,3,133),(50,3,134),(118,3,135),(51,3,136),(119,3,137),(52,3,138),(120,3,139),(53,3,140),(121,3,141),(54,3,142),(122,3,143),(55,3,144),(123,3,145),(56,3,146),(124,3,147),(57,3,148),(125,3,149),(58,3,150),(126,3,151),(59,3,152),(127,3,153),(60,3,154),(128,3,155),(61,3,156),(129,3,157),(62,3,158),(130,3,159),(63,3,160),(131,3,161),(64,3,162),(132,3,163),(65,3,164),(133,3,165),(66,3,166),(134,3,167),(67,3,168),(135,3,169),(68,3,170),(136,3,171),(69,3,172),(76,3,173),(77,3,174),(78,3,175),(75,3,176),(80,3,180),(79,3,184),(163,3,188),(165,3,192),(167,3,196),(168,3,200),(161,4,121),(110,4,122),(162,4,123),(111,4,124),(112,4,125),(113,4,126),(114,4,127),(81,4,128),(139,4,129),(82,4,130),(140,4,131),(83,4,132),(141,4,133),(84,4,134),(142,4,135),(85,4,136),(143,4,137),(86,4,138),(144,4,139),(87,4,140),(145,4,141),(88,4,142),(146,4,143),(89,4,144),(147,4,145),(90,4,146),(148,4,147),(91,4,148),(149,4,149),(92,4,150),(150,4,151),(93,4,152),(151,4,153),(94,4,154),(152,4,155),(95,4,156),(153,4,157),(96,4,158),(154,4,159),(97,4,160),(155,4,161),(98,4,162),(156,4,163),(99,4,164),(157,4,165),(100,4,166),(158,4,167),(101,4,168),(159,4,169),(102,4,170),(160,4,171),(103,4,172),(104,4,173),(105,4,174),(106,4,175),(107,4,176),(108,4,180),(109,4,184),(164,4,188),(166,4,192);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_april`
--

DROP TABLE IF EXISTS `contractor_april`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_april` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `face_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `face_id_id` (`face_id_id`),
  CONSTRAINT `contractor_april_face_id_id_e431efa8_fk_contractor_employee_id` FOREIGN KEY (`face_id_id`) REFERENCES `contractor_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_april`
--

LOCK TABLES `contractor_april` WRITE;
/*!40000 ALTER TABLE `contractor_april` DISABLE KEYS */;
INSERT INTO `contractor_april` VALUES (9,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',9),(24,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',24),(25,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',25),(26,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',26),(27,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',27),(28,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',28),(29,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',29),(30,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',30),(31,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',31),(32,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',32),(33,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',33),(34,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',34),(35,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',35),(36,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',36),(37,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',37),(38,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',38),(39,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',39),(40,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',40),(41,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',41),(42,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',42),(43,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',43),(44,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',44),(45,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',45),(46,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',46),(47,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',47),(48,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',48),(49,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',49),(50,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',50),(53,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',53);
/*!40000 ALTER TABLE `contractor_april` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_august`
--

DROP TABLE IF EXISTS `contractor_august`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_august` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `d31` varchar(5) DEFAULT NULL,
  `face_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `face_id_id` (`face_id_id`),
  CONSTRAINT `contractor_august_face_id_id_8890e5ec_fk_contractor_employee_id` FOREIGN KEY (`face_id_id`) REFERENCES `contractor_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_august`
--

LOCK TABLES `contractor_august` WRITE;
/*!40000 ALTER TABLE `contractor_august` DISABLE KEYS */;
INSERT INTO `contractor_august` VALUES (9,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','P','NULL','NULL','NULL','NULL','NULL','NULL','P','P',NULL,'P','NULL','NULL','NULL','NULL','NULL','NULL','','NULL','NULL','NULL','NULL',9),(24,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',24),(25,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',25),(26,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',26),(27,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',27),(28,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',28),(29,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',29),(30,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',30),(31,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',31),(32,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',32),(33,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',33),(34,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',34),(35,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',35),(36,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',36),(37,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',37),(38,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',38),(39,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',39),(40,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',40),(41,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',41),(42,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',42),(43,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',43),(44,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',44),(45,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',45),(46,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',46),(47,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',47),(48,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',48),(49,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','NULL',49),(50,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',50),(53,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',53);
/*!40000 ALTER TABLE `contractor_august` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_computationtemplatenonregular`
--

DROP TABLE IF EXISTS `contractor_computationtemplatenonregular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_computationtemplatenonregular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_computationtemplatenonregular`
--

LOCK TABLES `contractor_computationtemplatenonregular` WRITE;
/*!40000 ALTER TABLE `contractor_computationtemplatenonregular` DISABLE KEYS */;
/*!40000 ALTER TABLE `contractor_computationtemplatenonregular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_computationtemplateregular`
--

DROP TABLE IF EXISTS `contractor_computationtemplateregular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_computationtemplateregular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_computationtemplateregular`
--

LOCK TABLES `contractor_computationtemplateregular` WRITE;
/*!40000 ALTER TABLE `contractor_computationtemplateregular` DISABLE KEYS */;
/*!40000 ALTER TABLE `contractor_computationtemplateregular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_curweek`
--

DROP TABLE IF EXISTS `contractor_curweek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_curweek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_curweek`
--

LOCK TABLES `contractor_curweek` WRITE;
/*!40000 ALTER TABLE `contractor_curweek` DISABLE KEYS */;
/*!40000 ALTER TABLE `contractor_curweek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_curweekns`
--

DROP TABLE IF EXISTS `contractor_curweekns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_curweekns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_curweekns`
--

LOCK TABLES `contractor_curweekns` WRITE;
/*!40000 ALTER TABLE `contractor_curweekns` DISABLE KEYS */;
/*!40000 ALTER TABLE `contractor_curweekns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_december`
--

DROP TABLE IF EXISTS `contractor_december`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_december` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `d31` varchar(5) DEFAULT NULL,
  `face_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `face_id_id` (`face_id_id`),
  CONSTRAINT `contractor_december_face_id_id_75d447f4_fk_contracto` FOREIGN KEY (`face_id_id`) REFERENCES `contractor_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_december`
--

LOCK TABLES `contractor_december` WRITE;
/*!40000 ALTER TABLE `contractor_december` DISABLE KEYS */;
INSERT INTO `contractor_december` VALUES (9,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',9),(24,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',24),(25,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',25),(26,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',26),(27,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',27),(28,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',28),(29,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',29),(30,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',30),(31,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',31),(32,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',32),(33,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',33),(34,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',34),(35,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',35),(36,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',36),(37,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',37),(38,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',38),(39,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',39),(40,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',40),(41,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',41),(42,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',42),(43,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',43),(44,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',44),(45,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',45),(46,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',46),(47,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',47),(48,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',48),(49,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',49),(50,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',50),(53,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',53);
/*!40000 ALTER TABLE `contractor_december` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_employee`
--

DROP TABLE IF EXISTS `contractor_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `face_id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `shift` varchar(2) NOT NULL,
  `status` varchar(5) DEFAULT NULL,
  `picture` varchar(100) NOT NULL,
  `id_number` int(11) NOT NULL,
  `position` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `face_id` (`face_id`),
  UNIQUE KEY `id_number` (`id_number`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_employee`
--

LOCK TABLES `contractor_employee` WRITE;
/*!40000 ALTER TABLE `contractor_employee` DISABLE KEYS */;
INSERT INTO `contractor_employee` VALUES (9,2,'RON MICHAEL','PANGANIBAN','SALAZAR','T-TECH','DS','-','contractor_pic_files/160913.jpg',160913,'NR'),(24,3,'EDMAR','T','ACOL','BLAIRWIN','DS','-','contractor_pic_files/20001.jpg',20001,'NR'),(25,4,'VON DEXTER','A','AGUILO','BLAIRWIN','DS','-','contractor_pic_files/20002.jpg',20002,'R'),(26,5,'RICHARD','S','ALEJAR','BLAIRWIN','DS','-','contractor_pic_files/20003.jpg',20003,'NR'),(27,6,'ANTHONY','M','ATIENZA','BLAIRWIN','DS','-','contractor_pic_files/20005.jpg',20005,'R'),(28,7,'DEN CEDRICK','L','BALDERAMA','BLAIRWIN','DS','-','contractor_pic_files/20006.jpg',20006,'NR'),(29,8,'ENRICO JR.','A','DE LUNA','BLAIRWIN','DS','-','contractor_pic_files/20007.jpg',20007,'NR'),(30,9,'ROYCE ALLEN','A','DE LUNA','BLAIRWIN','DS','-','contractor_pic_files/20008.jpg',20008,'NR'),(31,10,'FRANCIOUS MANUEL','R','DE VILLA','BLAIRWIN','DS','-','contractor_pic_files/20009.jpg',20009,'NR'),(32,11,'DEANIEL MATHEW','A','DELA CRUZ','BLAIRWIN','DS','-','contractor_pic_files/20010.jpg',20010,'NR'),(33,12,'JOHN REY','A','JOMOCAN','BLAIRWIN','DS','-','contractor_pic_files/20011.jpg',20011,'NR'),(34,13,'ALJON','S','JUMAQUIO','BLAIRWIN','DS','-','contractor_pic_files/20012.jpg',20012,'R'),(35,14,'DANIELLE ANGELO','B','LLACUNA','BLAIRWIN','DS','-','contractor_pic_files/20013.jpg',20013,'NR'),(36,15,'JAYSON','R','LOZA','BLAIRWIN','DS','-','contractor_pic_files/20014.jpg',20014,'NR'),(37,16,'BRYAN','A','MAGSINO','BLAIRWIN','DS','-','contractor_pic_files/20015.jpg',20015,'R'),(38,17,'MARLOU','M','MAGSINO','BLAIRWIN','DS','-','contractor_pic_files/20016.jpg',20016,'R'),(39,18,'MARIO','M','MALIGAYA','BLAIRWIN','DS','-','contractor_pic_files/20017.jpg',20017,'NR'),(40,19,'JESTER','L','RAMOS','BLAIRWIN','DS','-','contractor_pic_files/20020.jpg',20020,'NR'),(41,20,'EDISON','N','RAYMUNDO','BLAIRWIN','DS','-','contractor_pic_files/20021.jpg',20021,'NR'),(42,21,'DEXTER','P','SILONES','BLAIRWIN','DS','-','contractor_pic_files/20022.jpg',20022,'NR'),(43,22,'MARLON','F','SILONES','BLAIRWIN','DS','-','contractor_pic_files/20023.jpg',20023,'R'),(44,23,'ROYCE','A','SILONES','BLAIRWIN','DS','-','contractor_pic_files/20024.jpg',20024,'NR'),(45,24,'ANGELO CEASAR','P','SULIT','BLAIRWIN','DS','-','contractor_pic_files/20025.jpg',20025,'NR'),(46,25,'CHRISTIAN PAUL','T','TAYAM','BLAIRWIN','DS','-','contractor_pic_files/20026.jpg',20026,'NR'),(47,26,'JAY-R','O','TORRENTE','BLAIRWIN','DS','-','contractor_pic_files/20027.jpg',20027,'NR'),(48,27,'VINCENT','A','VALENA','BLAIRWIN','DS','-','contractor_pic_files/20028.jpg',20028,'R'),(49,28,'AL CHRISTIAN','E','VALENZUELA','BLAIRWIN','DS','-','contractor_pic_files/20029.jpg',20029,'NR'),(50,29,'PEBRERO NINO GEORGE','P','MANISCAN','BLAIRWIN','DS','-','contractor_pic_files/20018.jpg',20018,'NR'),(53,30,'ANGELITO','CARAAN','LANDAOS','T-TECH','DS','-','contractor_pic_files/100006.jpg',100006,'NR');
/*!40000 ALTER TABLE `contractor_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_february`
--

DROP TABLE IF EXISTS `contractor_february`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_february` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `face_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `face_id_id` (`face_id_id`),
  CONSTRAINT `contractor_february_face_id_id_869822ea_fk_contracto` FOREIGN KEY (`face_id_id`) REFERENCES `contractor_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_february`
--

LOCK TABLES `contractor_february` WRITE;
/*!40000 ALTER TABLE `contractor_february` DISABLE KEYS */;
INSERT INTO `contractor_february` VALUES (9,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',9),(24,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',24),(25,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',25),(26,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',26),(27,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',27),(28,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',28),(29,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',29),(30,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',30),(31,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',31),(32,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',32),(33,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',33),(34,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',34),(35,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',35),(36,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',36),(37,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',37),(38,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',38),(39,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',39),(40,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',40),(41,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',41),(42,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',42),(43,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',43),(44,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',44),(45,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',45),(46,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',46),(47,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',47),(48,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',48),(49,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',49),(50,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',50),(53,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',53);
/*!40000 ALTER TABLE `contractor_february` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_january`
--

DROP TABLE IF EXISTS `contractor_january`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_january` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `d31` varchar(5) DEFAULT NULL,
  `face_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `face_id_id` (`face_id_id`),
  CONSTRAINT `contractor_january_face_id_id_e6c1fa7b_fk_contractor_employee_id` FOREIGN KEY (`face_id_id`) REFERENCES `contractor_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_january`
--

LOCK TABLES `contractor_january` WRITE;
/*!40000 ALTER TABLE `contractor_january` DISABLE KEYS */;
INSERT INTO `contractor_january` VALUES (9,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',9),(24,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',24),(25,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',25),(26,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',26),(27,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',27),(28,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',28),(29,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',29),(30,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',30),(31,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',31),(32,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',32),(33,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',33),(34,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',34),(35,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',35),(36,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',36),(37,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',37),(38,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',38),(39,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',39),(40,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',40),(41,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',41),(42,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',42),(43,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',43),(44,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',44),(45,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',45),(46,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',46),(47,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',47),(48,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',48),(49,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',49),(50,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',50),(53,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',53);
/*!40000 ALTER TABLE `contractor_january` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_july`
--

DROP TABLE IF EXISTS `contractor_july`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_july` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `d31` varchar(5) DEFAULT NULL,
  `face_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `face_id_id` (`face_id_id`),
  CONSTRAINT `contractor_july_face_id_id_6b638d09_fk_contractor_employee_id` FOREIGN KEY (`face_id_id`) REFERENCES `contractor_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_july`
--

LOCK TABLES `contractor_july` WRITE;
/*!40000 ALTER TABLE `contractor_july` DISABLE KEYS */;
INSERT INTO `contractor_july` VALUES (9,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',9),(24,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',24),(25,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',25),(26,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',26),(27,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',27),(28,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',28),(29,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',29),(30,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',30),(31,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',31),(32,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',32),(33,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',33),(34,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',34),(35,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',35),(36,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',36),(37,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',37),(38,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',38),(39,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',39),(40,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',40),(41,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',41),(42,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',42),(43,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',43),(44,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',44),(45,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',45),(46,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',46),(47,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',47),(48,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',48),(49,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',49),(50,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',50),(53,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',53);
/*!40000 ALTER TABLE `contractor_july` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_june`
--

DROP TABLE IF EXISTS `contractor_june`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_june` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `face_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `face_id_id` (`face_id_id`),
  CONSTRAINT `contractor_june_face_id_id_55201539_fk_contractor_employee_id` FOREIGN KEY (`face_id_id`) REFERENCES `contractor_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_june`
--

LOCK TABLES `contractor_june` WRITE;
/*!40000 ALTER TABLE `contractor_june` DISABLE KEYS */;
INSERT INTO `contractor_june` VALUES (9,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',9),(24,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',24),(25,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',25),(26,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',26),(27,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',27),(28,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',28),(29,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',29),(30,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',30),(31,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',31),(32,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',32),(33,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',33),(34,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',34),(35,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',35),(36,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',36),(37,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',37),(38,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',38),(39,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',39),(40,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',40),(41,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',41),(42,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',42),(43,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',43),(44,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',44),(45,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',45),(46,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',46),(47,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',47),(48,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',48),(49,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',49),(50,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',50),(53,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',53);
/*!40000 ALTER TABLE `contractor_june` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_lasweek`
--

DROP TABLE IF EXISTS `contractor_lasweek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_lasweek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_lasweek`
--

LOCK TABLES `contractor_lasweek` WRITE;
/*!40000 ALTER TABLE `contractor_lasweek` DISABLE KEYS */;
/*!40000 ALTER TABLE `contractor_lasweek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_lasweekns`
--

DROP TABLE IF EXISTS `contractor_lasweekns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_lasweekns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_lasweekns`
--

LOCK TABLES `contractor_lasweekns` WRITE;
/*!40000 ALTER TABLE `contractor_lasweekns` DISABLE KEYS */;
/*!40000 ALTER TABLE `contractor_lasweekns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_logbox`
--

DROP TABLE IF EXISTS `contractor_logbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_logbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` datetime(6) DEFAULT NULL,
  `transaction` varchar(1) NOT NULL,
  `face_id` int(11) NOT NULL,
  `shift` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contractor_logbox_face_id_1176f428_fk_contracto` (`face_id`),
  CONSTRAINT `contractor_logbox_face_id_1176f428_fk_contracto` FOREIGN KEY (`face_id`) REFERENCES `contractor_employee` (`face_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_logbox`
--

LOCK TABLES `contractor_logbox` WRITE;
/*!40000 ALTER TABLE `contractor_logbox` DISABLE KEYS */;
INSERT INTO `contractor_logbox` VALUES (26,'2020-08-18 17:43:12.000000','I',2,'NS'),(30,'2020-08-17 19:00:00.000000','I',2,'NS'),(31,'2020-08-18 05:00:00.000000','O',2,'NS'),(38,'2020-08-10 06:23:00.000000','I',2,'DS'),(39,'2020-08-10 17:11:00.000000','O',2,'DS'),(40,'2020-08-19 14:30:42.000000','I',2,'NS'),(43,'2020-08-19 06:00:00.000000','O',2,'NS'),(58,'2020-08-20 13:09:32.449052','I',2,'NS'),(60,'2020-08-27 06:00:00.000000','I',2,'DS'),(61,'2020-08-27 16:00:00.000000','O',2,'DS'),(62,'2020-08-27 18:00:00.000000','I',2,'NS'),(63,'2020-08-28 04:00:00.000000','O',2,'NS'),(64,'2020-09-01 17:50:00.000000','I',2,'NS'),(65,'2020-09-02 04:10:00.000000','O',2,'NS'),(66,'2020-09-02 07:34:57.000000','I',2,'DS'),(67,'2020-09-02 20:00:00.000000','O',2,'DS'),(68,'2020-09-01 08:52:48.000000','I',3,'DS'),(69,'2020-09-01 18:00:00.000000','O',3,'DS'),(70,'2020-09-03 06:00:00.000000','I',2,'DS'),(71,'2020-09-03 16:38:00.000000','O',2,'DS'),(72,'2020-09-04 06:30:00.000000','I',2,'DS'),(73,'2020-09-04 15:59:00.000000','O',2,'DS'),(74,'2020-09-01 06:00:00.000000','I',4,'DS'),(75,'2020-09-01 16:05:00.000000','O',4,'DS'),(76,'2020-09-01 19:01:00.000000','I',5,'NS'),(77,'2020-09-02 04:12:00.000000','O',5,'NS'),(78,'2020-09-02 18:29:00.000000','I',5,'NS'),(79,'2020-09-03 06:00:00.000000','O',5,'NS'),(80,'2020-09-01 14:59:59.382940','O',2,'DS'),(81,'2020-09-01 15:40:02.278249','O',30,'DS'),(82,'2020-09-14 06:00:00.000000','I',3,'DS'),(83,'2020-09-14 16:00:00.000000','O',3,'DS'),(84,'2020-09-21 06:40:00.000000','I',4,'DS'),(85,'2020-09-21 18:00:00.000000','O',4,'DS'),(86,'2020-09-25 06:50:00.000000','I',4,'DS'),(87,'2020-09-25 17:10:00.000000','O',4,'DS'),(88,'2020-09-21 15:52:26.000000','I',8,'NS'),(89,'2020-09-22 04:00:00.000000','O',8,'NS'),(90,'2020-09-18 18:00:00.000000','I',9,'NS'),(91,'2020-09-19 06:00:00.000000','O',9,'NS'),(93,'2020-09-28 06:00:00.000000','I',4,'DS');
/*!40000 ALTER TABLE `contractor_logbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_march`
--

DROP TABLE IF EXISTS `contractor_march`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_march` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `d31` varchar(5) DEFAULT NULL,
  `face_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `face_id_id` (`face_id_id`),
  CONSTRAINT `contractor_march_face_id_id_784acf0f_fk_contractor_employee_id` FOREIGN KEY (`face_id_id`) REFERENCES `contractor_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_march`
--

LOCK TABLES `contractor_march` WRITE;
/*!40000 ALTER TABLE `contractor_march` DISABLE KEYS */;
INSERT INTO `contractor_march` VALUES (9,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',9),(24,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',24),(25,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',25),(26,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',26),(27,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',27),(28,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',28),(29,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',29),(30,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',30),(31,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',31),(32,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',32),(33,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',33),(34,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',34),(35,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',35),(36,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',36),(37,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',37),(38,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',38),(39,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',39),(40,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',40),(41,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',41),(42,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',42),(43,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',43),(44,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',44),(45,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',45),(46,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',46),(47,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',47),(48,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',48),(49,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',49),(50,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',50),(53,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',53);
/*!40000 ALTER TABLE `contractor_march` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_may`
--

DROP TABLE IF EXISTS `contractor_may`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_may` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `d31` varchar(5) DEFAULT NULL,
  `face_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `face_id_id` (`face_id_id`),
  CONSTRAINT `contractor_may_face_id_id_7195a67d_fk_contractor_employee_id` FOREIGN KEY (`face_id_id`) REFERENCES `contractor_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_may`
--

LOCK TABLES `contractor_may` WRITE;
/*!40000 ALTER TABLE `contractor_may` DISABLE KEYS */;
INSERT INTO `contractor_may` VALUES (9,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',9),(24,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',24),(25,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',25),(26,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',26),(27,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',27),(28,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',28),(29,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',29),(30,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',30),(31,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',31),(32,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',32),(33,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',33),(34,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',34),(35,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',35),(36,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',36),(37,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',37),(38,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',38),(39,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',39),(40,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',40),(41,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',41),(42,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',42),(43,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',43),(44,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',44),(45,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',45),(46,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',46),(47,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',47),(48,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',48),(49,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',49),(50,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',50),(53,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',53);
/*!40000 ALTER TABLE `contractor_may` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_november`
--

DROP TABLE IF EXISTS `contractor_november`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_november` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `face_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `face_id_id` (`face_id_id`),
  CONSTRAINT `contractor_november_face_id_id_ab8dd6f0_fk_contracto` FOREIGN KEY (`face_id_id`) REFERENCES `contractor_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_november`
--

LOCK TABLES `contractor_november` WRITE;
/*!40000 ALTER TABLE `contractor_november` DISABLE KEYS */;
INSERT INTO `contractor_november` VALUES (9,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',9),(24,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',24),(25,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',25),(26,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',26),(27,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',27),(28,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',28),(29,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',29),(30,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',30),(31,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',31),(32,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',32),(33,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',33),(34,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',34),(35,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',35),(36,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',36),(37,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',37),(38,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',38),(39,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',39),(40,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',40),(41,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',41),(42,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',42),(43,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',43),(44,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',44),(45,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',45),(46,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',46),(47,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',47),(48,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',48),(49,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',49),(50,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',50),(53,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',53);
/*!40000 ALTER TABLE `contractor_november` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_october`
--

DROP TABLE IF EXISTS `contractor_october`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_october` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `d31` varchar(5) DEFAULT NULL,
  `face_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `face_id_id` (`face_id_id`),
  CONSTRAINT `contractor_october_face_id_id_e3d694a5_fk_contractor_employee_id` FOREIGN KEY (`face_id_id`) REFERENCES `contractor_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_october`
--

LOCK TABLES `contractor_october` WRITE;
/*!40000 ALTER TABLE `contractor_october` DISABLE KEYS */;
INSERT INTO `contractor_october` VALUES (9,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',9),(24,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',24),(25,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',25),(26,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',26),(27,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',27),(28,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',28),(29,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',29),(30,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',30),(31,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',31),(32,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',32),(33,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',33),(34,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',34),(35,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',35),(36,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',36),(37,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',37),(38,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',38),(39,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',39),(40,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',40),(41,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',41),(42,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',42),(43,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',43),(44,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',44),(45,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',45),(46,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',46),(47,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',47),(48,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',48),(49,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',49),(50,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',50),(53,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',53);
/*!40000 ALTER TABLE `contractor_october` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor_september`
--

DROP TABLE IF EXISTS `contractor_september`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor_september` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `face_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `face_id_id` (`face_id_id`),
  CONSTRAINT `contractor_september_face_id_id_6b01bbf1_fk_contracto` FOREIGN KEY (`face_id_id`) REFERENCES `contractor_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor_september`
--

LOCK TABLES `contractor_september` WRITE;
/*!40000 ALTER TABLE `contractor_september` DISABLE KEYS */;
INSERT INTO `contractor_september` VALUES (9,NULL,'L','P','P','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',9),(24,'L','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',NULL,'NULL','NULL','NULL','P','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',24),(25,'P','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','P','NULL','NULL','NULL','P','NULL','NULL','P','NULL','NULL',25),(26,'L','P','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',26),(27,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',27),(28,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',28),(29,NULL,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','P','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',29),(30,NULL,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','P','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',30),(31,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',31),(32,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',32),(33,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',33),(34,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',34),(35,NULL,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',35),(36,NULL,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',36),(37,NULL,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',37),(38,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',38),(39,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',39),(40,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',40),(41,NULL,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',41),(42,NULL,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',42),(43,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',43),(44,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',44),(45,NULL,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',45),(46,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',46),(47,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',47),(48,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',48),(49,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',49),(50,NULL,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',50),(53,NULL,'NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',53);
/*!40000 ALTER TABLE `contractor_september` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creform_rfpg`
--

DROP TABLE IF EXISTS `creform_rfpg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creform_rfpg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ISSUED` int(11) NOT NULL,
  `CLOSED` int(11) NOT NULL,
  `CLOSED_WITH_IN_TARGET_DATE` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creform_rfpg`
--

LOCK TABLES `creform_rfpg` WRITE;
/*!40000 ALTER TABLE `creform_rfpg` DISABLE KEYS */;
INSERT INTO `creform_rfpg` VALUES (1,'JANUARY',120,120,100),(2,'FEBRUARY',55,51,51),(3,'MARCH',221,221,116),(4,'APRIL',261,261,100),(5,'MAY',156,156,56),(6,'JUNE',191,191,150),(7,'JULY',350,320,303),(8,'AUGUST',214,214,67),(9,'SEPTEMBER',166,163,50),(10,'OCTOBER',227,201,88),(11,'NOVEMBER',0,0,0),(12,'DECEMBER',0,0,0);
/*!40000 ALTER TABLE `creform_rfpg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creform_sale`
--

DROP TABLE IF EXISTS `creform_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creform_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creform_sale`
--

LOCK TABLES `creform_sale` WRITE;
/*!40000 ALTER TABLE `creform_sale` DISABLE KEYS */;
INSERT INTO `creform_sale` VALUES (3,'JANUARY',9000003),(4,'FEBRUARY',13000000),(5,'MARCH',2555555),(6,'APRIL',12000000),(7,'MAY',333333),(8,'JUNE',7777773),(9,'JULY',9500500),(10,'AUGUST',9000234),(11,'SEPTEMBER',15555555),(12,'OCTOBER',2300123),(13,'NOVEMBER',0),(14,'DECEMBER',0),(15,'TARGET',5000000);
/*!40000 ALTER TABLE `creform_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-08-04 13:37:31.076919','1','catuira, arnold v. ',1,'[{\"added\": {}}]',7,1),(2,'2020-08-04 13:38:47.904781','1','CATUIRA, ARNOLD V. ',2,'[]',7,1),(3,'2020-08-04 13:49:54.373307','2','office',2,'[{\"changed\": {\"fields\": [\"Superuser status\", \"User permissions\"]}}]',4,1),(4,'2020-08-04 13:56:00.941971','1','CATUIRA, ARNOLD V. ',2,'[]',7,2),(5,'2020-08-04 14:00:42.469314','1','CATUIRA, ARNOLD V. ',2,'[]',7,2),(6,'2020-08-04 14:10:21.719081','1','CATUIRA, ARNOLD V. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,2),(7,'2020-08-04 14:33:35.363040','1','CATUIRA, ARNOLD V. ',3,'',7,1),(8,'2020-08-04 14:48:11.774614','1','CATUIRA, ARNOLD V. ',1,'[{\"added\": {}}]',7,1),(9,'2020-08-04 14:52:01.877496','2','PADOLINA, JAQUELINE A. ',1,'[{\"added\": {}}]',7,1),(10,'2020-08-04 14:52:09.634380','1','CATUIRA, ARNOLD V. ',2,'[{\"changed\": {\"fields\": [\"Birthday\"]}}]',7,1),(11,'2020-08-04 14:54:26.851784','3','MULAWIN, MA. TERESA M. ',1,'[{\"added\": {}}]',7,1),(12,'2020-08-04 14:56:19.859839','4','VILLANUEVA, NEMER M. ',1,'[{\"added\": {}}]',7,1),(13,'2020-08-04 14:56:43.448416','3','MULAWIN, MA. TERESA M. ',2,'[{\"changed\": {\"fields\": [\"Birthday\"]}}]',7,1),(14,'2020-08-04 14:59:41.024863','5','LANDAOS, ANGELITO C. ',1,'[{\"added\": {}}]',7,1),(15,'2020-08-04 15:01:11.780872','6','FERATERO, ELLEN F. ',1,'[{\"added\": {}}]',7,1),(16,'2020-08-04 15:02:41.841515','7','SONGCUAN, NARESSA R. ',1,'[{\"added\": {}}]',7,1),(17,'2020-08-04 15:04:07.607278','8','AVANZADO, ODILON V. ',1,'[{\"added\": {}}]',7,1),(18,'2020-08-04 15:05:59.628471','9','DE GUIA, PELAGIA DOMINIQUE V. ',1,'[{\"added\": {}}]',7,1),(19,'2020-08-04 15:07:31.949177','10','FALAMIG, MARY ANN A. ',1,'[{\"added\": {}}]',7,1),(20,'2020-08-04 15:08:23.946831','10','FALAMIG, MARY ANN A. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(21,'2020-08-04 15:08:48.987895','2','PADOLINA, JAQUELINE A. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(22,'2020-08-04 15:08:57.715473','3','MULAWIN, MA. TERESA M. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(23,'2020-08-04 15:09:13.951160','4','VILLANUEVA, NEMER M. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(24,'2020-08-04 15:09:22.651681','5','LANDAOS, ANGELITO C. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(25,'2020-08-04 15:09:30.834584','6','FERATERO, ELLEN F. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(26,'2020-08-04 15:09:37.850164','7','SONGCUAN, NARESSA R. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(27,'2020-08-04 15:09:51.487343','8','AVANZADO, ODILON V. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(28,'2020-08-04 15:10:01.669818','9','DE GUIA, PELAGIA DOMINIQUE V. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(29,'2020-08-04 15:10:14.325190','10','FALAMIG, MARY ANN A. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(30,'2020-08-04 15:12:05.137103','11','LEYCANO, CAMILE C. ',1,'[{\"added\": {}}]',7,1),(31,'2020-08-04 15:12:31.407690','1','CATUIRA, ARNOLD V. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(32,'2020-08-04 15:12:37.246389','2','PADOLINA, JAQUELINE A. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(33,'2020-08-04 15:12:40.812242','3','MULAWIN, MA. TERESA M. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(34,'2020-08-04 15:12:44.009631','4','VILLANUEVA, NEMER M. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(35,'2020-08-04 15:12:48.421373','5','LANDAOS, ANGELITO C. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(36,'2020-08-04 15:12:52.641126','6','FERATERO, ELLEN F. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(37,'2020-08-04 15:13:01.678277','7','SONGCUAN, NARESSA R. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(38,'2020-08-04 15:13:05.749781','8','AVANZADO, ODILON V. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(39,'2020-08-04 15:13:09.619689','9','DE GUIA, PELAGIA DOMINIQUE V. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(40,'2020-08-04 15:13:14.802185','10','FALAMIG, MARY ANN A. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(41,'2020-08-04 15:13:19.578838','11','LEYCANO, CAMILE C. ',2,'[{\"changed\": {\"fields\": [\"Rfid\"]}}]',7,1),(42,'2020-08-04 15:14:05.623040','12','PAGASPAS, ARRIANE D. ',1,'[{\"added\": {}}]',7,1),(43,'2020-08-04 15:15:32.595006','13','CASTILLO, CRESYLLIE D. ',1,'[{\"added\": {}}]',7,1),(44,'2020-08-04 15:17:16.024521','14','BACONG, KIMBERLY C. ',1,'[{\"added\": {}}]',7,1),(45,'2020-08-04 15:20:21.770074','15','ROMERO, ROSE MEI J. ',1,'[{\"added\": {}}]',7,1),(46,'2020-08-04 15:21:06.401011','16','BENZON, JOHN BRIAN A. ',1,'[{\"added\": {}}]',7,1),(47,'2020-08-04 15:21:45.392812','17','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',7,1),(48,'2020-08-04 16:23:43.402866','2','office',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(49,'2020-08-04 16:24:35.766894','2','office',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,1),(50,'2020-08-04 16:25:18.061995','2','office',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,2),(51,'2020-08-04 16:42:19.775533','2','office',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(52,'2020-08-04 17:17:22.262776','2','office',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(53,'2020-08-04 17:17:22.339296','2','office',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(54,'2020-08-04 17:18:19.528457','2','office',2,'[]',4,1),(55,'2020-08-05 07:18:41.615473','17','SALAZAR, RON MICHAEL P. ',2,'[]',7,1),(56,'2020-08-05 07:26:20.840532','16','BENZON, JOHN BRIAN A. ',2,'[]',7,1),(57,'2020-08-05 07:29:44.837474','17','SALAZAR, RON MICHAEL P. ',2,'[]',7,1),(58,'2020-08-05 07:41:58.685189','16','BENZON, JOHN BRIAN A. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(59,'2020-08-05 07:42:21.064103','17','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Birthday\", \"Status\"]}}]',7,1),(60,'2020-08-05 10:48:58.938106','3','JAN',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',26,1),(61,'2020-08-05 10:49:12.646863','4','FEB',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',26,1),(62,'2020-08-05 10:49:22.414489','5','MAR',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',26,1),(63,'2020-08-05 10:49:29.081654','6','APR',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',26,1),(64,'2020-08-05 10:50:02.168167','7','MAY',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',26,1),(65,'2020-08-05 10:50:11.973200','13','NOV',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',26,1),(66,'2020-08-05 10:50:18.287510','14','DEC',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',26,1),(67,'2020-08-05 10:50:40.068854','11','NOV',2,'[{\"changed\": {\"fields\": [\"CLOSED WITH IN TARGET DATE\"]}}]',25,1),(68,'2020-08-05 10:50:53.102219','5','MAY',2,'[{\"changed\": {\"fields\": [\"CLOSED WITH IN TARGET DATE\"]}}]',25,1),(69,'2020-08-05 10:51:00.061170','1','JAN',2,'[{\"changed\": {\"fields\": [\"CLOSED WITH IN TARGET DATE\"]}}]',25,1),(70,'2020-08-05 10:51:03.792821','3','MAR',2,'[{\"changed\": {\"fields\": [\"CLOSED WITH IN TARGET DATE\"]}}]',25,1),(71,'2020-08-05 10:51:13.475347','7','JUL',2,'[{\"changed\": {\"fields\": [\"CLOSED WITH IN TARGET DATE\"]}}]',25,1),(72,'2020-08-05 10:51:22.293574','8','AUG',2,'[{\"changed\": {\"fields\": [\"CLOSED WITH IN TARGET DATE\"]}}]',25,1),(73,'2020-08-05 10:51:31.702980','10','OCT',2,'[{\"changed\": {\"fields\": [\"CLOSED WITH IN TARGET DATE\"]}}]',25,1),(74,'2020-08-05 10:54:21.688654','11','NOV',2,'[{\"changed\": {\"fields\": [\"ISSUED\", \"CLOSED\", \"CLOSED WITH IN TARGET DATE\"]}}]',25,1),(75,'2020-08-05 11:42:40.035175','14','DEC',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',22,1),(76,'2020-08-05 11:42:55.588974','13','NOV',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',24,1),(77,'2020-08-05 11:43:01.936933','12','OCT',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',24,1),(78,'2020-08-05 11:45:33.785729','13','NOV',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',26,1),(79,'2020-08-05 11:45:38.832755','12','OCT',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',26,1),(80,'2020-08-05 12:01:06.264500','14','DEC',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',22,1),(81,'2020-08-05 13:10:57.567569','11','SEP',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',24,1),(82,'2020-08-05 13:12:12.335148','13','NOV',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',22,1),(83,'2020-08-05 13:12:28.699056','12','OCT',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',22,1),(84,'2020-08-05 13:12:36.178604','11','SEP',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',22,1),(85,'2020-08-05 13:26:47.033074','11','NOV',2,'[{\"changed\": {\"fields\": [\"ISSUED\", \"CLOSED\"]}}]',21,1),(86,'2020-08-05 13:40:49.702657','11','NOV',2,'[{\"changed\": {\"fields\": [\"ISSUED\", \"CLOSED\", \"CLOSED WITH IN TARGET DATE\"]}}]',25,1),(87,'2020-08-05 14:33:44.496217','11','SEP',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',22,1),(88,'2020-08-05 14:44:39.903205','1','JAN',2,'[{\"changed\": {\"fields\": [\"CLOSED\"]}}]',25,1),(89,'2020-08-05 15:33:05.477158','17','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(90,'2020-08-05 15:56:39.143302','1','CATUIRA, ARNOLD V. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(91,'2020-08-05 15:56:50.124417','1','CATUIRA, ARNOLD V. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(92,'2020-08-05 15:58:22.407756','1','CATUIRA, ARNOLD V. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(93,'2020-08-05 16:01:34.943177','1','CATUIRA, ARNOLD V. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(94,'2020-08-05 16:02:08.196476','1','CATUIRA, ARNOLD V. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(95,'2020-08-05 16:02:17.306706','3','MULAWIN, MA. TERESA M. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(96,'2020-08-05 16:09:18.673338','1','CATUIRA, ARNOLD V. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(97,'2020-08-05 16:09:25.304250','3','MULAWIN, MA. TERESA M. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(98,'2020-08-05 16:46:27.467924','2','office',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(99,'2020-08-06 07:19:11.288581','16','BENZON, JOHN BRIAN A. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,2),(100,'2020-08-06 07:25:31.780581','12','PAGASPAS, ARRIANE D. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,2),(101,'2020-08-06 07:37:48.555734','3','MULAWIN, MA. TERESA M. ',2,'[]',7,2),(102,'2020-08-06 08:41:42.089689','4','VILLANUEVA, NEMER M. ',2,'[]',7,2),(103,'2020-08-06 08:43:58.903581','16','BENZON, JOHN BRIAN A. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,2),(104,'2020-08-06 08:44:06.883930','12','PAGASPAS, ARRIANE D. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,2),(105,'2020-08-06 08:50:58.654675','18','QUIROL, ANGELICA JOY F. ',1,'[{\"added\": {}}]',7,1),(106,'2020-08-06 08:52:15.307358','18','QUIROL, ANGELICA JOY F. ',2,'[{\"changed\": {\"fields\": [\"D4\", \"D5\"]}}]',19,1),(107,'2020-08-06 08:52:31.151352','18','QUIROL, ANGELICA JOY F. ',2,'[{\"changed\": {\"fields\": [\"D4\"]}}]',19,1),(108,'2020-08-06 17:28:14.863976','17','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Picture\", \"Rfid\"]}}]',7,1),(109,'2020-08-12 08:29:41.941309','3','ATIENZA, ANTHONY B. ',1,'[{\"added\": {}}]',32,1),(110,'2020-08-12 08:52:59.889195','1','ATIENZA, ANTHONY B. ',1,'[{\"added\": {}}]',32,1),(111,'2020-08-12 08:53:13.346471','1','ATIENZA, ANTHONY B. ',3,'',32,1),(112,'2020-08-12 08:57:48.062232','2','ATIENZA, ANTHONY B. ',1,'[{\"added\": {}}]',32,1),(113,'2020-08-12 08:59:18.161434','2','ATIENZA, ANTHONY B. ',3,'',32,1),(114,'2020-08-12 09:02:12.632216','3','ATIENZA, ANTHONY B. ',1,'[{\"added\": {}}]',32,1),(115,'2020-08-12 09:03:02.698755','4','AGUILLO, VON D. ',1,'[{\"added\": {}}]',32,1),(116,'2020-08-12 09:03:36.349636','4','AGUILLO, VON D. ',2,'[]',32,1),(117,'2020-08-12 09:03:40.330560','3','ATIENZA, ANTHONY B. ',2,'[]',32,1),(118,'2020-08-12 09:17:12.353627','3','blairwin',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(119,'2020-08-12 09:18:38.955702','3','blairwin',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,3),(120,'2020-08-12 09:20:41.522200','4','AGUILLO, VON D. ',3,'',32,3),(121,'2020-08-12 09:20:41.535037','3','ATIENZA, ANTHONY B. ',3,'',32,3),(122,'2020-08-12 09:21:58.665832','5','ATIENZA, ANTHONY B. ',1,'[{\"added\": {}}]',32,3),(123,'2020-08-12 09:24:28.356561','3','blairwin',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(124,'2020-08-12 09:25:10.172879','1','ATIENZA, ANTHONY B. ',1,'[{\"added\": {}}]',44,3),(125,'2020-08-12 12:17:09.519185','2','ATIENZA, ANTHONY B. ',1,'[{\"added\": {}}]',44,3),(126,'2020-08-17 09:22:58.091857','3','blairwin',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,1),(127,'2020-08-17 09:23:22.143493','3','blairwin',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,3),(128,'2020-08-17 09:54:36.562048','3','blairwin',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(129,'2020-08-17 10:11:58.054475','6','CAGUICLA, ALJIN A. ',1,'[{\"added\": {}}]',32,3),(130,'2020-08-17 10:16:01.927476','4','ngb',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(131,'2020-08-17 10:16:19.176703','4','ngb',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,4),(132,'2020-08-17 10:32:18.599911','3','CAGUICLA, ALJIN A. ',1,'[{\"added\": {}}]',44,3),(133,'2020-08-17 13:51:03.129771','7','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',32,1),(134,'2020-08-17 13:58:00.303585','7','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Face id\"]}}]',32,1),(135,'2020-08-17 17:13:10.810637','4','SALAZAR, RON MICHAEL P. ',3,'',44,1),(136,'2020-08-17 17:13:22.204843','7','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Shift\"]}}]',32,1),(137,'2020-08-18 07:04:20.200853','5','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Transaction\"]}}]',44,1),(138,'2020-08-18 07:13:49.746716','8','SALAZAR, RON MICHAEL P. ',3,'',44,1),(139,'2020-08-18 07:13:52.795514','7','SALAZAR, RON MICHAEL P. ',3,'',44,1),(140,'2020-08-18 08:28:17.669698','8','LANDAOS, ANGELITO C. ',1,'[{\"added\": {}}]',32,1),(141,'2020-08-18 09:16:53.424248','8','LANDAOS, ANGELITO C. ',2,'[{\"changed\": {\"fields\": [\"D18\"]}}]',41,3),(142,'2020-08-18 13:21:59.107250','11','SALAZAR, RON MICHAEL P. ',3,'',44,3),(143,'2020-08-18 13:21:59.116695','10','SALAZAR, RON MICHAEL P. ',3,'',44,3),(144,'2020-08-18 13:22:45.145770','12','SALAZAR, RON MICHAEL P. ',3,'',44,3),(145,'2020-08-18 13:40:19.631968','7','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',32,3),(146,'2020-08-18 14:13:44.839683','3','blairwin',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(147,'2020-08-18 14:14:10.459013','4','ngb',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(148,'2020-08-18 14:29:58.403558','8','LANDAOS, ANGELITO C. ',3,'',32,3),(149,'2020-08-18 14:29:58.412188','7','SALAZAR, RON MICHAEL P. ',3,'',32,3),(150,'2020-08-18 14:31:01.989451','5','ATIENZA, ANTHONY B. ',3,'',32,3),(151,'2020-08-18 14:31:01.996159','6','CAGUICLA, ALJIN A. ',3,'',32,3),(152,'2020-08-18 14:35:14.547516','9','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',32,3),(153,'2020-08-18 14:35:48.764754','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Shift\"]}}]',32,3),(154,'2020-08-18 14:38:48.157616','14','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(155,'2020-08-18 15:36:15.276621','14','SALAZAR, RON MICHAEL P. ',3,'',44,3),(156,'2020-08-18 16:26:29.900707','15','SALAZAR, RON MICHAEL P. ',3,'',44,3),(157,'2020-08-18 16:26:46.262335','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"D18\"]}}]',41,3),(158,'2020-08-18 16:32:22.375175','16','SALAZAR, RON MICHAEL P. ',3,'',44,3),(159,'2020-08-18 16:51:25.130762','17','SALAZAR, RON MICHAEL P. ',3,'',44,3),(160,'2020-08-18 16:54:50.356195','18','SALAZAR, RON MICHAEL P. ',3,'',44,3),(161,'2020-08-18 16:57:24.808421','19','SALAZAR, RON MICHAEL P. ',3,'',44,3),(162,'2020-08-18 17:10:46.709568','20','SALAZAR, RON MICHAEL P. ',3,'',44,3),(163,'2020-08-18 17:24:51.249078','21','SALAZAR, RON MICHAEL P. ',3,'',44,3),(164,'2020-08-18 17:26:54.585544','22','SALAZAR, RON MICHAEL P. ',3,'',44,3),(165,'2020-08-18 17:43:03.664790','25','SALAZAR, RON MICHAEL P. ',3,'',44,3),(166,'2020-08-18 17:48:45.867432','27','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(167,'2020-08-18 18:14:56.266323','28','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(168,'2020-08-18 18:15:22.934856','29','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(169,'2020-08-18 18:31:42.746402','27','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Date time\"]}}]',44,3),(170,'2020-08-18 18:31:53.281656','29','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(171,'2020-08-18 19:25:01.290336','30','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(172,'2020-08-18 19:25:24.153516','31','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(173,'2020-08-18 19:42:56.816335','3','blairwin',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(174,'2020-08-18 19:43:09.520734','4','ngb',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(175,'2020-08-18 19:48:58.420313','32','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(176,'2020-08-18 19:49:19.706205','33','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(177,'2020-08-18 19:50:54.714280','29','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Date time\", \"Transaction\", \"Shift\"]}}]',44,3),(178,'2020-08-18 19:51:15.929832','28','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Date time\", \"Transaction\", \"Shift\"]}}]',44,3),(179,'2020-08-18 19:51:30.793162','28','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Date time\"]}}]',44,3),(180,'2020-08-18 19:52:46.459609','34','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(181,'2020-08-18 19:53:06.323070','35','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(182,'2020-08-18 19:53:52.615392','36','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(183,'2020-08-18 19:54:16.375776','37','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(184,'2020-08-18 19:58:19.623816','3','blairwin',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(185,'2020-08-18 19:58:35.055659','4','ngb',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(186,'2020-08-18 20:02:33.542507','38','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(187,'2020-08-18 20:02:56.873233','39','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(188,'2020-08-19 07:18:48.064471','10','LAPUS, KRISTINE J. ',1,'[{\"added\": {}}]',32,3),(189,'2020-08-19 07:28:51.328475','11','LANDAOS, ANGELITO C. ',1,'[{\"added\": {}}]',32,3),(190,'2020-08-19 07:36:10.461063','33','SALAZAR, RON MICHAEL P. ',3,'',44,3),(191,'2020-08-19 07:36:10.469134','32','SALAZAR, RON MICHAEL P. ',3,'',44,3),(192,'2020-08-19 07:36:10.474886','37','SALAZAR, RON MICHAEL P. ',3,'',44,3),(193,'2020-08-19 07:36:10.478585','36','SALAZAR, RON MICHAEL P. ',3,'',44,3),(194,'2020-08-19 07:36:10.484198','35','SALAZAR, RON MICHAEL P. ',3,'',44,3),(195,'2020-08-19 07:36:10.487863','34','SALAZAR, RON MICHAEL P. ',3,'',44,3),(196,'2020-08-19 07:36:10.493646','28','SALAZAR, RON MICHAEL P. ',3,'',44,3),(197,'2020-08-19 07:36:10.497318','29','SALAZAR, RON MICHAEL P. ',3,'',44,3),(198,'2020-08-19 07:36:10.503609','27','SALAZAR, RON MICHAEL P. ',3,'',44,3),(199,'2020-08-19 07:50:59.838068','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Shift\"]}}]',32,3),(200,'2020-08-19 07:56:58.011871','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Shift\"]}}]',32,3),(201,'2020-08-19 07:57:05.651865','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Shift\"]}}]',32,3),(202,'2020-08-19 08:03:28.459656','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',32,3),(203,'2020-08-19 08:07:09.831314','12','CAG, A A. ',1,'[{\"added\": {}}]',32,3),(204,'2020-08-19 08:07:19.919542','12','CAGUICLA, A A. ',2,'[{\"changed\": {\"fields\": [\"Lastname\"]}}]',32,3),(205,'2020-08-19 08:07:27.569050','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Shift\"]}}]',32,3),(206,'2020-08-19 08:07:36.293833','12','CAGUICLA, ALJIN A. ',2,'[{\"changed\": {\"fields\": [\"Firstname\"]}}]',32,3),(207,'2020-08-19 08:07:48.405494','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Shift\"]}}]',32,3),(208,'2020-08-19 08:15:19.572415','12','CAGUICLA, ALJIN A. ',2,'[{\"changed\": {\"fields\": [\"Id number\"]}}]',32,3),(209,'2020-08-19 09:12:37.444750','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Id number\"]}}]',32,3),(210,'2020-08-19 09:17:13.143421','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Id number\"]}}]',32,3),(211,'2020-08-19 11:07:36.024020','40','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Date time\"]}}]',44,3),(212,'2020-08-19 11:08:26.030234','41','SALAZAR, RON MICHAEL P. ',3,'',44,3),(213,'2020-08-19 11:14:42.194132','42','SALAZAR, RON MICHAEL P. ',3,'',44,3),(214,'2020-08-19 11:31:27.311808','44','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(215,'2020-08-19 11:32:43.201441','44','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(216,'2020-08-19 11:35:10.828827','44','SALAZAR, RON MICHAEL P. ',3,'',44,3),(217,'2020-08-19 11:36:11.965166','45','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(218,'2020-08-19 11:37:05.176200','12','CAGUICLA, ALJIN A. ',2,'[]',32,3),(219,'2020-08-19 11:37:33.989956','12','CAGUICLA, ALJIN A. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',32,3),(220,'2020-08-19 11:37:40.728598','11','LANDAOS, ANGELITO C. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',32,3),(221,'2020-08-19 11:37:46.083789','12','CAGUICLA, ALJIN A. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',32,3),(222,'2020-08-19 11:37:51.963728','11','LANDAOS, ANGELITO C. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',32,3),(223,'2020-08-19 11:37:56.900611','10','LAPUS, KRISTINE J. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',32,3),(224,'2020-08-19 11:38:20.210141','45','SALAZAR, RON MICHAEL P. ',3,'',44,3),(225,'2020-08-19 11:41:00.100577','46','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(226,'2020-08-19 11:42:25.050218','46','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(227,'2020-08-19 11:43:36.503888','46','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(228,'2020-08-19 11:44:14.901297','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',32,3),(229,'2020-08-19 11:45:05.377575','46','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(230,'2020-08-19 11:45:11.702957','46','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(231,'2020-08-19 11:45:20.838846','46','SALAZAR, RON MICHAEL P. ',3,'',44,3),(232,'2020-08-19 11:45:34.484996','47','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(233,'2020-08-19 11:47:08.827233','47','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(234,'2020-08-19 11:47:33.007717','47','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(235,'2020-08-19 11:54:25.915475','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"D29\"]}}]',41,3),(236,'2020-08-19 11:54:34.587195','47','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(237,'2020-08-19 13:06:04.515012','47','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(238,'2020-08-19 13:06:30.364692','47','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(239,'2020-08-19 13:21:07.729418','47','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(240,'2020-08-19 13:22:08.124771','47','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(241,'2020-08-19 13:36:04.364237','47','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(242,'2020-08-19 13:37:21.699589','48','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(243,'2020-08-19 13:37:49.942369','12','CAGUICLA, ALJIN A. ',2,'[]',32,3),(244,'2020-08-19 13:37:54.060948','11','LANDAOS, ANGELITO C. ',2,'[]',32,3),(245,'2020-08-19 13:37:57.993295','10','LAPUS, KRISTINE J. ',2,'[]',32,3),(246,'2020-08-19 13:38:17.694896','48','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Date time\"]}}]',44,3),(247,'2020-08-19 13:39:00.942829','48','SALAZAR, RON MICHAEL P. ',3,'',44,3),(248,'2020-08-19 13:39:00.961413','47','SALAZAR, RON MICHAEL P. ',3,'',44,3),(249,'2020-08-19 14:02:23.906480','49','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(250,'2020-08-19 14:02:47.374849','49','SALAZAR, RON MICHAEL P. ',3,'',44,3),(251,'2020-08-19 14:03:13.578685','50','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(252,'2020-08-19 14:03:21.061625','50','SALAZAR, RON MICHAEL P. ',3,'',44,3),(253,'2020-08-19 14:06:32.491558','51','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(254,'2020-08-19 14:07:01.356568','51','SALAZAR, RON MICHAEL P. ',3,'',44,3),(255,'2020-08-19 14:18:04.820035','43','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(256,'2020-08-19 14:18:08.303126','40','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(257,'2020-08-19 14:18:12.086217','38','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(258,'2020-08-19 14:18:17.842911','30','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(259,'2020-08-19 14:18:20.491622','26','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(260,'2020-08-19 14:19:01.946922','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"D28\", \"D29\"]}}]',41,3),(261,'2020-08-19 14:27:02.427570','38','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(262,'2020-08-19 14:28:36.862294','39','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(263,'2020-08-19 14:28:41.980470','30','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(264,'2020-08-19 14:28:44.685076','31','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(265,'2020-08-19 14:28:47.403891','26','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(266,'2020-08-19 14:28:50.063643','40','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(267,'2020-08-19 14:28:52.393855','43','SALAZAR, RON MICHAEL P. ',2,'[]',44,3),(268,'2020-08-19 14:30:45.801302','40','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Date time\", \"Shift\"]}}]',44,3),(269,'2020-08-19 14:31:17.413905','43','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Date time\", \"Shift\"]}}]',44,3),(270,'2020-08-19 14:41:57.159287','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Shift\"]}}]',32,3),(271,'2020-08-19 14:48:27.729601','53','LAPUS, KRISTINE J. ',1,'[{\"added\": {}}]',44,3),(272,'2020-08-19 14:48:56.123369','53','LAPUS, KRISTINE J. ',3,'',44,3),(273,'2020-08-19 14:50:30.814846','54','CAGUICLA, ALJIN A. ',1,'[{\"added\": {}}]',44,3),(274,'2020-08-19 14:50:41.646941','55','CAGUICLA, ALJIN A. ',1,'[{\"added\": {}}]',44,3),(275,'2020-08-19 15:28:43.113697','12','CAGUICLA, ALJIN A. ',2,'[]',32,3),(276,'2020-08-19 15:58:36.094337','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(277,'2020-08-19 16:00:47.764813','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(278,'2020-08-19 16:02:03.346950','9','SALAZAR, RON MICHAEL P. ',2,'[]',32,3),(279,'2020-08-19 16:03:33.155893','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(280,'2020-08-19 16:11:38.733662','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(281,'2020-08-19 16:12:51.735767','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Id number\"]}}]',32,3),(282,'2020-08-19 16:13:02.283503','9','SALAZAR, RON MICHAEL P. ',2,'[]',32,3),(283,'2020-08-19 16:13:10.020942','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(284,'2020-08-19 16:13:29.887434','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Id number\"]}}]',32,3),(285,'2020-08-19 16:13:37.402703','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(286,'2020-08-19 16:22:21.314616','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(287,'2020-08-19 16:23:06.033951','11','LANDAOS, ANGELITO C. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(288,'2020-08-19 16:23:15.233449','11','LANDAOS, ANGELITO C. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(289,'2020-08-19 16:23:32.738716','11','LANDAOS, ANGELITO C. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(290,'2020-08-19 16:23:40.790146','11','LANDAOS, ANGELITO C. ',2,'[{\"changed\": {\"fields\": [\"Id number\"]}}]',32,3),(291,'2020-08-19 16:23:47.415551','11','LANDAOS, ANGELITO C. ',2,'[{\"changed\": {\"fields\": [\"Id number\"]}}]',32,3),(292,'2020-08-19 16:24:34.334426','11','LANDAOS, ANGELITO C. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(293,'2020-08-19 16:24:43.982955','11','LANDAOS, ANGELITO C. ',2,'[{\"changed\": {\"fields\": [\"Id number\"]}}]',32,3),(294,'2020-08-19 16:25:00.466037','11','LANDAOS, ANGELITO C. ',2,'[{\"changed\": {\"fields\": [\"Picture\", \"Id number\"]}}]',32,3),(295,'2020-08-19 16:25:11.176822','11','LANDAOS, ANGELITO C. ',2,'[{\"changed\": {\"fields\": [\"Picture\", \"Id number\"]}}]',32,3),(296,'2020-08-19 16:25:21.512829','11','LANDAOS, ANGELITO C. ',2,'[{\"changed\": {\"fields\": [\"Picture\", \"Id number\"]}}]',32,3),(297,'2020-08-19 16:34:07.399718','10','LAPUS, KRISTINE J. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(298,'2020-08-19 16:39:26.860623','13','ATIENZA, ANTHONY A. ',1,'[{\"added\": {}}]',32,3),(299,'2020-08-19 16:39:52.969208','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(300,'2020-08-19 16:44:32.921028','12','CAGUICLA, ALJIN A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(301,'2020-08-19 16:44:55.563230','12','CAGUICLA, ALJIN A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(302,'2020-08-19 16:51:29.679260','12','CAGUICLA, ALJIN A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(303,'2020-08-19 16:53:36.917633','12','CAGUICLA, ALJIN A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(304,'2020-08-19 16:58:56.208861','12','CAGUICLA, ALJIN A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(305,'2020-08-19 16:59:35.627181','12','CAGUICLA, ALJIN A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(306,'2020-08-19 17:00:58.600987','12','CAGUICLA, ALJIN A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(307,'2020-08-19 17:02:12.364941','12','CAGUICLA, ALJIN A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(308,'2020-08-19 17:18:26.360237','14','CARANDANG, IRENEO A. ',1,'[{\"added\": {}}]',32,3),(309,'2020-08-19 17:19:16.855141','14','CARANDANG, IRENEO A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(310,'2020-08-19 17:19:28.617734','14','CARANDANG, IRENEO A. ',2,'[]',32,3),(311,'2020-08-19 17:27:11.725881','14','CARANDANG, IRENEO A. ',3,'',32,3),(312,'2020-08-19 17:28:17.583008','15','CARANDANG, IRENEO A. ',1,'[{\"added\": {}}]',32,3),(313,'2020-08-19 17:28:38.620040','15','CARANDANG, IRENEO A. ',2,'[{\"changed\": {\"fields\": [\"Picture\", \"Id number\"]}}]',32,3),(314,'2020-08-19 17:29:03.938647','15','CARANDANG, IRENEO A. ',2,'[]',32,3),(315,'2020-08-19 17:36:13.479008','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(316,'2020-08-19 17:43:15.218007','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Middlename\"]}}]',32,3),(317,'2020-08-19 17:49:15.932779','15','CARANDANG, IRENEO A. ',3,'',32,3),(318,'2020-08-19 17:53:58.827922','16','CARANDANG, IRENEO A. ',1,'[{\"added\": {}}]',32,3),(319,'2020-08-19 17:55:36.081349','16','CARANDANG, IRENEO A. ',2,'[]',32,3),(320,'2020-08-19 17:56:07.639836','16','CARANDANG, IRENEO A. ',2,'[{\"changed\": {\"fields\": [\"Picture\", \"Id number\"]}}]',32,3),(321,'2020-08-19 17:56:24.719713','16','CARANDANG, IRENEO A. ',2,'[]',32,3),(326,'2020-08-19 17:58:06.789009','16','CARANDANG, IRENEO A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(327,'2020-08-19 17:58:16.760393','16','CARANDANG, IRENEO A. ',3,'',32,3),(328,'2020-08-19 17:58:46.561059','17','CARANDAN, NEO A. ',1,'[{\"added\": {}}]',32,3),(329,'2020-08-19 17:59:02.748726','17','CARANDAN, NEO A. ',2,'[]',32,3),(330,'2020-08-20 06:58:04.970595','17','CARANDAN, NEO A. ',3,'',32,3),(331,'2020-08-20 06:58:57.944475','18','CARANDANG, NEO A. ',1,'[{\"added\": {}}]',32,3),(332,'2020-08-20 06:59:32.222489','18','CARANDANG, NEO A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(333,'2020-08-20 06:59:53.026152','18','CARANDANG, NEO A. ',3,'',32,3),(334,'2020-08-20 07:01:57.869467','19','CARANDAN, NEO A. ',1,'[{\"added\": {}}]',32,3),(335,'2020-08-20 07:02:08.586622','19','CARANDAN, NEO A. ',2,'[]',32,3),(336,'2020-08-20 07:02:18.524595','19','CARANDAN, NEO A. ',3,'',32,3),(337,'2020-08-20 07:02:41.697020','13','ATIENZA, ANTHONY A. ',2,'[]',32,3),(338,'2020-08-20 07:04:50.115305','20','CARANDANG, IRINEO A. ',1,'[{\"added\": {}}]',32,3),(339,'2020-08-20 07:08:21.447054','20','CARANDANG, IRINEO A. ',3,'',32,3),(340,'2020-08-20 07:08:44.137412','13','ATIENZA, ANTHONY A. ',2,'[]',32,3),(341,'2020-08-20 07:09:48.951395','21','CARANDANG, IRENEO A. ',1,'[{\"added\": {}}]',32,3),(342,'2020-08-20 07:10:10.524214','21','CARANDANG, IRENEO A. ',3,'',32,3),(343,'2020-08-20 07:11:23.366872','22','CRANGDANG, NEO A. ',1,'[{\"added\": {}}]',32,3),(344,'2020-08-20 07:12:07.568006','22','CRANGDANG, NEO A. ',3,'',32,3),(345,'2020-08-20 07:16:55.217991','12','CAGUICLA, ALJINGINEER A. ',2,'[{\"changed\": {\"fields\": [\"Firstname\"]}}]',32,3),(346,'2020-08-20 07:17:07.774183','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(347,'2020-08-20 07:19:02.737920','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(348,'2020-08-20 07:20:18.059943','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(349,'2020-08-20 07:21:20.339339','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(350,'2020-08-20 07:22:43.340160','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(351,'2020-08-20 07:23:25.631746','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(352,'2020-08-20 07:24:13.367418','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(353,'2020-08-20 07:24:52.278987','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(354,'2020-08-20 07:25:11.368588','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(355,'2020-08-20 07:25:25.719858','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(356,'2020-08-20 07:26:22.693573','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(357,'2020-08-20 07:27:06.063500','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(358,'2020-08-20 07:27:37.814934','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(359,'2020-08-20 07:37:39.255090','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(360,'2020-08-20 07:38:48.497186','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(361,'2020-08-20 07:39:36.144995','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(362,'2020-08-20 07:40:26.510014','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(363,'2020-08-20 07:40:45.748592','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(364,'2020-08-20 07:43:31.417211','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(365,'2020-08-20 07:44:32.736502','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(366,'2020-08-20 07:45:12.668708','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(367,'2020-08-20 07:46:12.984793','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(368,'2020-08-20 07:54:10.706267','23','SAFDSF, NRO A. ',1,'[{\"added\": {}}]',32,3),(369,'2020-08-20 07:56:17.368106','23','SAFDSF, NRO A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(370,'2020-08-20 07:56:38.707159','23','SAFDSF, NRO A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(371,'2020-08-20 08:00:04.423933','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(372,'2020-08-20 08:00:38.684517','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(373,'2020-08-20 08:03:12.268021','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(374,'2020-08-20 08:03:47.157093','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(375,'2020-08-20 08:04:29.566172','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(376,'2020-08-20 08:08:22.124240','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(377,'2020-08-20 08:09:58.582137','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(378,'2020-08-20 08:15:13.508433','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(379,'2020-08-20 08:16:34.525635','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(380,'2020-08-20 08:17:15.506050','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(381,'2020-08-20 08:20:00.806385','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(382,'2020-08-20 08:20:16.046739','13','ATIENZA, ANTHONY A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(383,'2020-08-20 08:20:23.786421','13','ATIENZA, ANTHONY A. ',2,'[]',32,3),(384,'2020-08-20 08:22:29.300757','13','ATIENZA, ANTHONY A. ',3,'',32,3),(385,'2020-08-20 08:24:13.841559','23','SAFDSF, NRO A. ',3,'',32,3),(386,'2020-08-20 13:04:47.420503','12','CAGUICLA, ALJINGINEER A. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',32,3),(387,'2020-08-20 13:04:55.693036','11','LANDAOS, ANGELITO C. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',32,3),(388,'2020-08-20 13:05:03.832865','11','LANDAOS, ANGELITO C. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',32,3),(389,'2020-08-20 13:10:15.825540','10','LAPUS, KRISTINE J. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',32,3),(390,'2020-08-20 13:35:06.354342','1','CATUIRA, ARNOLD V. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(391,'2020-08-20 13:51:37.624509','16','DEC',2,'[{\"changed\": {\"fields\": [\"ISSUED\", \"CLOSED\", \"CLOSED WITH IN TARGET DATE\"]}}]',23,1),(392,'2020-08-20 13:51:44.084867','15','NOV',2,'[{\"changed\": {\"fields\": [\"ISSUED\", \"CLOSED\", \"CLOSED WITH IN TARGET DATE\"]}}]',23,1),(393,'2020-08-20 13:51:50.952323','14','OCT',2,'[{\"changed\": {\"fields\": [\"ISSUED\", \"CLOSED\", \"CLOSED WITH IN TARGET DATE\"]}}]',23,1),(394,'2020-08-20 13:51:58.516722','13','SEP',2,'[{\"changed\": {\"fields\": [\"ISSUED\", \"CLOSED\", \"CLOSED WITH IN TARGET DATE\"]}}]',23,1),(395,'2020-08-27 07:03:10.792455','12','CAGUICLA, ALJINGINEER A. ',3,'',32,3),(396,'2020-08-27 07:03:22.147084','11','LANDAOS, ANGELITO C. ',3,'',32,3),(397,'2020-08-27 07:03:38.591856','10','LAPUS, KRISTINE J. ',3,'',32,3),(398,'2020-08-27 07:09:43.661487','24','ACOL, EDMAR T. ',1,'[{\"added\": {}}]',32,3),(399,'2020-08-27 07:10:16.438395','25','AGUILO, VON DEXTER A. ',1,'[{\"added\": {}}]',32,3),(400,'2020-08-27 07:10:58.099993','25','AGUILO, VON DEXTER A. ',2,'[{\"changed\": {\"fields\": [\"Id number\"]}}]',32,3),(401,'2020-08-27 07:11:10.906517','25','AGUILO, VON DEXTER A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(402,'2020-08-27 07:11:52.828208','26','ALEJAR, RICHARD S. ',1,'[{\"added\": {}}]',32,3),(403,'2020-08-27 07:12:25.078802','27','ATIENZA, ANTHONY M. ',1,'[{\"added\": {}}]',32,3),(404,'2020-08-27 07:13:12.210906','28','BALDERAMA, DEN CEDRICK L. ',1,'[{\"added\": {}}]',32,3),(405,'2020-08-27 07:14:01.302295','29','DE LUNA, ENRICO A. ',1,'[{\"added\": {}}]',32,3),(406,'2020-08-27 07:14:17.391214','29','DE LUNA, ENRICO JR. A. ',2,'[{\"changed\": {\"fields\": [\"Firstname\"]}}]',32,3),(407,'2020-08-27 07:14:58.493149','30','DE LUNA, ROYCE ALLEN A. ',1,'[{\"added\": {}}]',32,3),(408,'2020-08-27 07:15:52.255016','31','DE VILLA, FRANCIOUS MANUEL R. ',1,'[{\"added\": {}}]',32,3),(409,'2020-08-27 07:16:59.440548','32','DELA CRUZ, DEANIEL MATHEW A. ',1,'[{\"added\": {}}]',32,3),(410,'2020-08-27 07:17:33.016786','33','JOMOCAN, JOHN REY A. ',1,'[{\"added\": {}}]',32,3),(411,'2020-08-27 07:18:23.383086','34','JUMAQUIO, ALJON S. ',1,'[{\"added\": {}}]',32,3),(412,'2020-08-27 07:19:12.816044','35','LLACUNA,, DANIELLE ANGELO B. ',1,'[{\"added\": {}}]',32,3),(413,'2020-08-27 07:19:38.441494','36','LOZA, JAYSON R. ',1,'[{\"added\": {}}]',32,3),(414,'2020-08-27 07:21:04.626340','37','MAGSINO, BRYAN A. ',1,'[{\"added\": {}}]',32,3),(415,'2020-08-27 07:21:48.638812','38','MAGSINO, MARLOU M. ',1,'[{\"added\": {}}]',32,3),(416,'2020-08-27 07:24:05.960399','39','MALIGAYA, MARIO M. ',1,'[{\"added\": {}}]',32,3),(417,'2020-08-27 07:24:42.362569','40','RAMOS, JESTER L. ',1,'[{\"added\": {}}]',32,3),(418,'2020-08-27 07:25:24.484536','41','RAYMUNDO, EDISON N. ',1,'[{\"added\": {}}]',32,3),(419,'2020-08-27 07:25:56.910827','42','SILONES, DEXTER P. ',1,'[{\"added\": {}}]',32,3),(420,'2020-08-27 07:26:33.053018','43','SILONES, MARLON F. ',1,'[{\"added\": {}}]',32,3),(421,'2020-08-27 07:26:59.799997','44','SILONES, ROYCE A. ',1,'[{\"added\": {}}]',32,3),(422,'2020-08-27 07:27:33.638486','45','SULIT, ANGELO CEASAR P. ',1,'[{\"added\": {}}]',32,3),(423,'2020-08-27 07:28:06.139132','46','TAYAM, CHRISTIAN PAUL T. ',1,'[{\"added\": {}}]',32,3),(424,'2020-08-27 07:28:52.378027','47','TORRENTE, JAY-R O. ',1,'[{\"added\": {}}]',32,3),(425,'2020-08-27 07:29:33.223030','48','VALENA, VINCENT A. ',1,'[{\"added\": {}}]',32,3),(426,'2020-08-27 07:30:04.049347','49','VALENZUELA, AL CHRISTIAN E. ',1,'[{\"added\": {}}]',32,3),(427,'2020-08-27 07:31:26.142863','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Company\"]}}]',32,3),(428,'2020-08-27 07:33:24.363741','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Shift\"]}}]',32,3),(429,'2020-08-27 08:04:39.858580','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Id number\"]}}]',32,3),(430,'2020-08-27 08:05:30.341454','9','SALAZAR, RON MICHAEL P. ',2,'[]',32,3),(431,'2020-08-27 08:05:46.050407','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Id number\"]}}]',32,3),(432,'2020-08-27 08:06:25.039262','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Id number\"]}}]',32,3),(433,'2020-08-27 08:06:44.837026','9','SALAZAR, RON MICHAEL P. ',2,'[]',32,3),(434,'2020-08-27 08:07:03.893162','9','SALAZAR, RON MICHAEL P. ',2,'[]',32,3),(435,'2020-08-27 08:07:25.675018','9','SALAZAR, RON MICHAEL P. ',2,'[]',32,3),(436,'2020-08-27 08:07:47.171200','9','SALAZAR, RON MICHAEL P. ',2,'[]',32,3),(437,'2020-08-27 08:08:26.634870','9','SALAZAR, RON MICHAEL P. ',2,'[]',32,3),(438,'2020-08-27 08:08:53.403228','9','SALAZAR, RON MICHAEL P. ',2,'[]',32,3),(439,'2020-08-27 08:09:15.783400','9','SALAZAR, RON MICHAEL P. ',2,'[]',32,3),(440,'2020-08-27 08:09:33.173832','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Id number\"]}}]',32,3),(441,'2020-08-27 08:21:54.212603','9','SALAZAR, RON MICHAEL P. ',2,'[]',32,3),(442,'2020-08-27 08:22:50.680332','9','SALAZAR, RON MICHAEL P. ',2,'[]',32,3),(443,'2020-08-27 08:23:32.428932','9','SALAZAR, RON MICHAEL P. ',2,'[]',32,3),(444,'2020-08-27 08:24:10.393868','9','SALAZAR, RON MICHAEL P. ',2,'[]',32,3),(445,'2020-08-27 08:25:08.398317','9','SALAZAR, RON MICHAEL P. ',2,'[]',32,3),(446,'2020-08-27 08:25:16.127717','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Id number\"]}}]',32,3),(447,'2020-08-27 08:33:10.052662','9','SALAZAR, RON MICHAEL P. ',2,'[]',32,3),(448,'2020-08-27 08:49:39.923908','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Id number\"]}}]',32,3),(449,'2020-08-27 08:50:02.000705','9','SALAZAR, RON MICHAEL P. ',2,'[]',32,3),(450,'2020-08-27 16:16:33.249338','24','ACOL, EDMAR T. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',32,3),(451,'2020-08-27 16:22:42.808898','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Company\", \"Status\"]}}]',32,3),(452,'2020-08-27 16:23:25.906926','60','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(453,'2020-08-27 16:23:49.160696','61','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(454,'2020-08-27 16:24:08.598591','62','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(455,'2020-08-27 16:24:38.278788','63','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(456,'2020-08-27 16:37:46.759960','59','SALAZAR, RON MICHAEL P. ',3,'',44,3),(457,'2020-09-01 07:03:16.213131','26','ALEJAR, RICHARD S. ',2,'[{\"changed\": {\"fields\": [\"Picture\", \"Status\"]}}]',32,3),(458,'2020-09-01 07:03:42.072825','37','MAGSINO, BRYAN A. ',2,'[{\"changed\": {\"fields\": [\"Picture\", \"Status\"]}}]',32,3),(459,'2020-09-01 07:04:22.307330','42','SILONES, DEXTER P. ',2,'[{\"changed\": {\"fields\": [\"Picture\", \"Status\"]}}]',32,3),(460,'2020-09-01 07:07:28.699877','35','LLACUNA, DANIELLE ANGELO B. ',2,'[{\"changed\": {\"fields\": [\"Lastname\", \"Status\"]}}]',32,3),(461,'2020-09-01 07:09:14.605220','50','MANISCAN, PEBRERO NINO GEORGE P. ',1,'[{\"added\": {}}]',32,3),(462,'2020-09-01 07:33:47.563601','64','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(463,'2020-09-01 07:34:34.535663','65','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(464,'2020-09-01 07:35:18.716650','66','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(465,'2020-09-01 07:35:36.981994','67','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(466,'2020-09-01 08:52:50.556897','68','ACOL, EDMAR T. ',1,'[{\"added\": {}}]',44,3),(467,'2020-09-01 08:52:58.195412','69','ACOL, EDMAR T. ',1,'[{\"added\": {}}]',44,3),(468,'2020-09-01 10:13:12.432538','67','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Date time\"]}}]',44,3),(469,'2020-09-01 12:27:55.092705','70','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(470,'2020-09-01 12:28:27.600539','71','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(471,'2020-09-01 13:07:09.525661','72','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(472,'2020-09-01 13:07:32.558936','73','SALAZAR, RON MICHAEL P. ',1,'[{\"added\": {}}]',44,3),(473,'2020-09-01 13:21:23.638420','71','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Date time\"]}}]',44,3),(474,'2020-09-01 13:30:52.382082','74','AGUILO, VON DEXTER A. ',1,'[{\"added\": {}}]',44,3),(475,'2020-09-01 13:31:32.883083','75','AGUILO, VON DEXTER A. ',1,'[{\"added\": {}}]',44,3),(476,'2020-09-01 13:32:02.198273','75','AGUILO, VON DEXTER A. ',2,'[{\"changed\": {\"fields\": [\"Date time\"]}}]',44,3),(477,'2020-09-01 13:46:26.436694','76','ALEJAR, RICHARD S. ',1,'[{\"added\": {}}]',44,3),(478,'2020-09-01 13:46:47.794322','77','ALEJAR, RICHARD S. ',1,'[{\"added\": {}}]',44,3),(479,'2020-09-01 13:47:05.216354','77','ALEJAR, RICHARD S. ',2,'[{\"changed\": {\"fields\": [\"Date time\"]}}]',44,3),(480,'2020-09-01 13:47:45.205144','78','ALEJAR, RICHARD S. ',1,'[{\"added\": {}}]',44,3),(481,'2020-09-01 13:47:59.597441','79','ALEJAR, RICHARD S. ',1,'[{\"added\": {}}]',44,3),(482,'2020-09-01 14:16:22.594432','29','DE LUNA, ENRICO JR. A. ',2,'[{\"changed\": {\"fields\": [\"Picture\", \"Status\"]}}]',32,3),(483,'2020-09-01 14:16:42.536866','30','DE LUNA, ROYCE ALLEN A. ',2,'[{\"changed\": {\"fields\": [\"Picture\", \"Status\"]}}]',32,3),(484,'2020-09-01 14:17:10.221058','35','LLACUNA, DANIELLE ANGELO B. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(485,'2020-09-01 14:17:29.212278','36','LOZA, JAYSON R. ',2,'[{\"changed\": {\"fields\": [\"Picture\", \"Status\"]}}]',32,3),(486,'2020-09-01 14:17:44.798845','41','RAYMUNDO, EDISON N. ',2,'[{\"changed\": {\"fields\": [\"Picture\", \"Status\"]}}]',32,3),(487,'2020-09-01 14:17:58.860975','45','SULIT, ANGELO CEASAR P. ',2,'[{\"changed\": {\"fields\": [\"Picture\", \"Status\"]}}]',32,3),(488,'2020-09-01 14:21:13.307709','50','MANISCAN, PEBRERO NINO GEORGE P. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(489,'2020-09-01 14:25:43.372214','51','CARANDANG, IRINEO A. ',1,'[{\"added\": {}}]',32,3),(490,'2020-09-01 14:26:00.640533','51','CARANDANG, IRINEO A. ',3,'',32,3),(491,'2020-09-01 14:26:30.490097','52','CARANDANG, IRENEO A. ',1,'[{\"added\": {}}]',32,3),(492,'2020-09-01 14:26:49.533603','52','CARANDANG, IRENEO A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(493,'2020-09-01 14:27:20.860408','52','CARANDANG, IRENEO A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',32,3),(494,'2020-09-01 14:28:10.961985','52','CARANDANG, IRENEO A. ',3,'',32,3),(495,'2020-09-01 14:28:37.658543','9','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Company\"]}}]',32,3),(496,'2020-09-01 14:29:32.887751','53','LANDAOS, ANGELITO C. ',1,'[{\"added\": {}}]',32,3),(497,'2020-09-10 07:28:51.641441','3','blairwin',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(498,'2020-09-10 07:29:38.975780','3','blairwin',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(499,'2020-09-10 10:29:54.982642','24','ACOL, EDMAR T. ',2,'[{\"changed\": {\"fields\": [\"Position\"]}}]',32,3),(500,'2020-09-21 14:06:05.522111','82','ACOL, EDMAR T. ',1,'[{\"added\": {}}]',44,3),(501,'2020-09-21 14:06:24.714137','83','ACOL, EDMAR T. ',1,'[{\"added\": {}}]',44,3),(502,'2020-09-21 14:07:10.639538','84','AGUILO, VON DEXTER A. ',1,'[{\"added\": {}}]',44,3),(503,'2020-09-21 14:07:22.271654','85','AGUILO, VON DEXTER A. ',1,'[{\"added\": {}}]',44,3),(504,'2020-09-21 14:07:44.691568','86','AGUILO, VON DEXTER A. ',1,'[{\"added\": {}}]',44,3),(505,'2020-09-21 14:08:12.640054','87','AGUILO, VON DEXTER A. ',1,'[{\"added\": {}}]',44,3),(506,'2020-09-21 15:52:30.810470','88','DE LUNA, ENRICO JR. A. ',1,'[{\"added\": {}}]',44,3),(507,'2020-09-21 15:52:48.579420','89','DE LUNA, ENRICO JR. A. ',1,'[{\"added\": {}}]',44,3),(508,'2020-09-21 15:53:17.908456','90','DE LUNA, ROYCE ALLEN A. ',1,'[{\"added\": {}}]',44,3),(509,'2020-09-21 15:53:33.900163','91','DE LUNA, ROYCE ALLEN A. ',1,'[{\"added\": {}}]',44,3),(510,'2020-09-22 19:19:42.419929','17','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,1),(511,'2020-09-22 19:20:21.915987','17','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,1),(512,'2020-09-23 13:21:55.137872','17','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,1),(513,'2020-09-23 13:22:53.327555','17','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,1),(514,'2020-09-28 12:24:17.595516','11','LEYCANO, CAMILE C. ',2,'[{\"changed\": {\"fields\": [\"Birthday\"]}}]',7,2),(515,'2020-09-28 12:30:35.686778','17','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Birthday\"]}}]',7,2),(516,'2020-09-28 12:39:16.140040','17','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Birthday\"]}}]',7,2),(517,'2020-09-28 12:39:29.939885','11','LEYCANO, CAMILE C. ',2,'[{\"changed\": {\"fields\": [\"Birthday\"]}}]',7,2),(518,'2020-09-28 12:46:34.728672','11','LEYCANO, CAMILE C. ',2,'[{\"changed\": {\"fields\": [\"Birthday\"]}}]',7,2),(519,'2020-09-28 13:09:30.060935','17','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Birthday\"]}}]',7,2),(520,'2020-09-28 15:15:15.428893','92','AGUILO, VON DEXTER A. ',1,'[{\"added\": {}}]',44,3),(521,'2020-09-28 15:18:40.317424','92','AGUILO, VON DEXTER A. ',3,'',44,3),(522,'2020-09-28 15:22:44.924050','93','AGUILO, VON DEXTER A. ',1,'[{\"added\": {}}]',44,3),(523,'2020-09-29 07:09:20.996611','12','PAGASPAS, ARRIANE D. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(524,'2020-10-01 09:02:30.945437','12','PAGASPAS, ARRIANE D. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,2),(525,'2020-10-01 20:43:16.168501','16','BENZON, JOHN BRIAN A. ',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,2),(526,'2020-10-05 12:57:37.658864','17','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,2),(527,'2020-10-05 13:04:06.041826','9','DE GUIA, NIKKI V. ',2,'[{\"changed\": {\"fields\": [\"Firstname\"]}}]',7,2),(528,'2020-10-05 13:04:44.095292','17','SALAZAR, RON MICHAEL P. ',2,'[{\"changed\": {\"fields\": [\"D1\"]}}]',10,2),(529,'2020-10-05 13:04:53.135661','16','BENZON, JOHN BRIAN A. ',2,'[{\"changed\": {\"fields\": [\"D1\"]}}]',10,2),(530,'2020-10-05 13:04:57.479069','9','DE GUIA, NIKKI V. ',2,'[{\"changed\": {\"fields\": [\"D1\"]}}]',10,2),(531,'2020-10-06 16:32:05.416469','1','DATE MODIFIED',2,'[{\"changed\": {\"fields\": [\"Date modified\"]}}]',27,2),(532,'2020-10-06 16:32:39.543783','1','DATE MODIFIED',2,'[{\"changed\": {\"fields\": [\"Date modified\"]}}]',27,2),(533,'2020-10-06 17:05:55.932113','1','DATE MODIFIED',2,'[{\"changed\": {\"fields\": [\"Date modified\"]}}]',27,2),(534,'2020-10-06 17:11:51.810596','1','DATE MODIFIED',2,'[{\"changed\": {\"fields\": [\"Date modified\"]}}]',27,2),(535,'2020-10-06 17:11:51.903442','1','DATE MODIFIED',2,'[]',27,2),(536,'2020-10-06 17:13:26.752524','1','DATE MODIFIED',2,'[{\"changed\": {\"fields\": [\"Date modified\"]}}]',27,2),(537,'2020-10-06 17:14:01.016746','1','DATE MODIFIED',2,'[{\"changed\": {\"fields\": [\"Date modified\"]}}]',27,2),(538,'2020-10-06 17:39:49.472053','1','JANUARY',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',21,2),(539,'2020-10-06 17:39:55.583918','2','FEBRUARY',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',21,2),(540,'2020-10-06 17:40:00.729489','3','MARCH',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',21,2),(541,'2020-10-06 17:40:06.148125','4','APRIL',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',21,2),(542,'2020-10-06 17:40:10.095561','6','JUNE',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',21,2),(543,'2020-10-06 17:40:14.605543','7','JULY',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',21,2),(544,'2020-10-06 17:40:19.750847','8','AUGUST',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',21,2),(545,'2020-10-06 17:40:26.576984','9','SEPTEMBER',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',21,2),(546,'2020-10-06 17:40:32.170724','10','OCTOBER',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',21,2),(547,'2020-10-06 17:40:38.151818','11','NOVEMBER',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',21,2),(548,'2020-10-06 17:40:45.191332','12','DECEMBER',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',21,2),(549,'2020-10-06 17:40:53.978854','3','JANUARY',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',22,2),(550,'2020-10-06 17:41:00.739095','4','FEBRUARY',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',22,2),(551,'2020-10-06 17:41:05.558931','5','MARCH',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',22,2),(552,'2020-10-06 17:41:09.908100','6','APRIL',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',22,2),(553,'2020-10-06 17:41:14.413132','8','JUNE',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',22,2),(554,'2020-10-06 17:41:18.441505','9','JULY',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',22,2),(555,'2020-10-06 17:41:25.843239','10','AUGUST',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',22,2),(556,'2020-10-06 17:41:33.373165','11','SEPTEMBER',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',22,2),(557,'2020-10-06 17:41:39.967460','12','OCTOBER',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',22,2),(558,'2020-10-06 17:41:45.088042','13','NOVEMBER',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',22,2),(559,'2020-10-06 17:41:51.935821','14','DECEMBER',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',22,2),(560,'2020-10-06 19:44:53.035079','4','FEB',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',26,2),(561,'2020-10-06 19:44:58.207763','3','JAN',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',26,2),(562,'2020-10-06 19:45:22.972234','5','MAR',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',26,2),(563,'2020-10-06 19:45:45.093990','11','SEP',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',26,2),(564,'2020-10-06 19:49:05.794444','6','APR',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',26,2),(565,'2020-10-06 19:49:24.399961','9','JUL',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',26,2),(566,'2020-10-06 19:49:34.022830','8','JUN',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',26,2),(567,'2020-10-06 19:50:51.683698','3','JAN',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',26,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(37,'contractor','april'),(41,'contractor','august'),(49,'contractor','computationtemplatenonregular'),(50,'contractor','computationtemplateregular'),(45,'contractor','curweek'),(47,'contractor','curweekns'),(38,'contractor','december'),(32,'contractor','employee'),(35,'contractor','february'),(34,'contractor','january'),(42,'contractor','july'),(43,'contractor','june'),(46,'contractor','lasweek'),(48,'contractor','lasweekns'),(44,'contractor','logbox'),(39,'contractor','march'),(31,'contractor','may'),(40,'contractor','november'),(36,'contractor','october'),(33,'contractor','september'),(21,'creform','rfpg'),(22,'creform','sale'),(23,'fabrication','rfpg'),(24,'fabrication','sale'),(27,'hr','as_of'),(28,'hr','thc'),(29,'hr','ttech'),(30,'hr','ytmi'),(20,'office','april'),(19,'office','august'),(18,'office','december'),(7,'office','employee'),(17,'office','february'),(16,'office','january'),(15,'office','july'),(14,'office','june'),(13,'office','march'),(12,'office','may'),(11,'office','november'),(10,'office','october'),(8,'office','pagestat'),(9,'office','september'),(25,'rbf','rfpg'),(26,'rbf','sale'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-08-04 13:19:20.937766'),(2,'auth','0001_initial','2020-08-04 13:19:21.242782'),(3,'admin','0001_initial','2020-08-04 13:19:22.290015'),(4,'admin','0002_logentry_remove_auto_add','2020-08-04 13:19:22.462561'),(5,'admin','0003_logentry_add_action_flag_choices','2020-08-04 13:19:22.493927'),(6,'contenttypes','0002_remove_content_type_name','2020-08-04 13:19:22.948637'),(7,'auth','0002_alter_permission_name_max_length','2020-08-04 13:19:23.023535'),(8,'auth','0003_alter_user_email_max_length','2020-08-04 13:19:23.068787'),(9,'auth','0004_alter_user_username_opts','2020-08-04 13:19:23.115024'),(10,'auth','0005_alter_user_last_login_null','2020-08-04 13:19:23.187353'),(11,'auth','0006_require_contenttypes_0002','2020-08-04 13:19:23.194680'),(12,'auth','0007_alter_validators_add_error_messages','2020-08-04 13:19:23.226523'),(13,'auth','0008_alter_user_username_max_length','2020-08-04 13:19:23.327758'),(14,'auth','0009_alter_user_last_name_max_length','2020-08-04 13:19:23.422437'),(15,'auth','0010_alter_group_name_max_length','2020-08-04 13:19:23.464975'),(16,'auth','0011_update_proxy_permissions','2020-08-04 13:19:23.498129'),(17,'office','0001_initial','2020-08-04 13:19:23.589516'),(18,'sessions','0001_initial','2020-08-04 13:19:23.623353'),(19,'office','0002_auto_20200804_1340','2020-08-04 13:40:12.761328'),(20,'office','0003_auto_20200804_1411','2020-08-04 14:11:58.196267'),(21,'office','0004_auto_20200804_1435','2020-08-04 14:36:08.156487'),(22,'office','0005_april_august_december_february_january_july_june_march_may_november_october_september','2020-08-04 14:36:10.343256'),(23,'creform','0001_initial','2020-08-04 16:03:37.981288'),(24,'creform','0002_auto_20200804_1640','2020-08-04 16:40:32.084893'),(25,'fabrication','0001_initial','2020-08-04 16:40:32.156480'),(26,'office','0006_auto_20200804_1640','2020-08-04 16:40:32.266784'),(27,'rbf','0001_initial','2020-08-04 16:54:17.944563'),(28,'hr','0001_initial','2020-08-04 17:04:44.396465'),(29,'creform','0003_auto_20200805_1150','2020-08-05 11:50:24.137693'),(30,'creform','0003_auto_20200805_1158','2020-08-05 11:58:37.710792'),(31,'creform','0004_auto_20200805_1158','2020-08-05 11:58:54.140706'),(32,'creform','0005_auto_20200805_1159','2020-08-05 12:00:03.575872'),(33,'creform','0006_auto_20200805_1200','2020-08-05 12:00:52.222380'),(34,'creform','0007_auto_20200805_1309','2020-08-05 13:09:56.377016'),(35,'office','0007_auto_20200806_0716','2020-08-06 07:18:20.603086'),(36,'office','0008_auto_20200806_0857','2020-08-06 08:57:51.405258'),(37,'office','0009_auto_20200806_1723','2020-08-06 17:23:44.591292'),(38,'contractor','0001_initial','2020-08-12 08:01:13.955648'),(39,'contractor','0002_auto_20200812_0848','2020-08-12 08:48:46.668274'),(40,'contractor','0003_april_august_december_employee_february_january_july_june_march_may_november_october_september','2020-08-12 08:49:19.381684'),(41,'contractor','0004_auto_20200812_0900','2020-08-12 09:00:29.228584'),(42,'contractor','0005_logbox','2020-08-12 09:21:08.636137'),(43,'contractor','0006_auto_20200817_0953','2020-08-17 09:53:55.694559'),(44,'office','0010_auto_20200817_0953','2020-08-17 09:53:56.705641'),(45,'contractor','0007_auto_20200817_1357','2020-08-17 13:57:36.034085'),(46,'contractor','0008_auto_20200818_1434','2020-08-18 14:34:39.921727'),(47,'contractor','0009_logbox_shift','2020-08-18 14:38:29.518081'),(48,'contractor','0010_auto_20200818_1942','2020-08-18 19:42:19.305092'),(49,'contractor','0011_auto_20200818_1943','2020-08-18 19:44:03.794884'),(50,'contractor','0012_auto_20200818_1957','2020-08-18 19:57:34.751324'),(51,'contractor','0013_auto_20200819_0750','2020-08-19 07:50:46.786586'),(52,'contractor','0014_auto_20200819_1531','2020-08-19 15:31:16.241267'),(53,'contractor','0015_auto_20200819_1558','2020-08-19 15:58:08.936502'),(54,'contractor','0016_auto_20200910_0711','2020-09-10 07:11:10.848293'),(55,'contractor','0017_computationtemplatenonregular_computationtemplateregular','2020-09-10 07:28:18.564924'),(56,'auth','0012_alter_user_first_name_max_length','2020-09-23 11:43:48.971687'),(57,'contractor','0018_auto_20200923_1143','2020-09-23 11:43:49.053315'),(58,'contractor','0019_auto_20201006_1710','2020-10-06 17:10:34.934679'),(59,'hr','0002_auto_20201006_1710','2020-10-06 17:10:35.004323');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('00u7ptb5dqox5cugzscqz4h3gl5zecmx','MjEwOTRhMjc1NzQ0ZWM2NjQ0OWI5OGY1MWRiMWM0ZjBhZDU5NjQ4Zjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc0NGI0YjQ4M2YwMzU1OWMwMTA1MzY2OTRlODU1ZDY3NjU2YjI0In0=','2020-10-05 14:04:53.007187'),('0bhnh7nsaxdj5wqn0jroor47srs6dftu','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kMlZU:x9IGFjJqyYbN8geHssayuL4jM8F06t6JGvhwrGXCCBI','2020-10-12 13:19:32.491002'),('0laomf8ygc5lvksgr9l4ld9363bilsx0','e30:1kKxgE:9M66uTHToWE92P-WMxTcdlJ0TFnmX_R5Ql6aaSzpUFc','2020-10-07 13:51:02.138752'),('1cka78vbg7925gtnru9apkz1e50ol6pb','e30:1kPOeT:Y9B5BTuQA1n07Re7mof4H37-S13-0pDJU1ZLYJ1L6uI','2020-10-19 19:27:33.039694'),('1ekw4lhz1xk9zj5lr3mwrrk8kvick3a1','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kN3QD:JOnr_-7oST4tztQnc3WsiZqansqMbfNsRYAQHstzkeI','2020-10-13 08:23:09.603907'),('2niwpu4l1ntzutqq9v6jrsezmot9i1oq','e30:1kKfUD:BgX3dUaqFXKt0nRtrs-Gdwg9ndwAQtDrZ-1-USeD0h0','2020-10-06 18:25:25.393120'),('2p5mpfva9jwi114o1e4vbinp05mqfgvn','e30:1kKdct:3r70bMezmqDsQNSOtyOnfb92JFwdm5Ojfqrc7qzciJs','2020-10-06 16:26:15.785120'),('3c08hkuawrwfqnhzk86ihe570muwjlsl','e30:1kKxfW:72DWaz74nNxcx4DTDVgsNqxPAoSoenrJGmRplW_RPiU','2020-10-07 13:50:18.685769'),('3eu7z96cael1wdixdry1cgcijbg94m3m','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kQ30h:Y63b00mp8QAaNqXzcDcAcmyCZwEmvWU9ji5wjJO0iaQ','2020-10-21 14:33:11.669231'),('45h4vzdbtzlhz1knaj522tpdb8jnhflb','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kNVxM:pnWxNyRkxIORIkni_b8MTJm7RlF5FkkyR-c7rxPIpCQ','2020-10-14 14:51:16.426488'),('4ffrt7p08hraw08ezweq6oajtn9hbsqq','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kKyQE:tE6M4sHDDhCKJ8FmflRw_x5dnnjLpw0Q1wLtUAbLTEM','2020-10-07 14:38:34.965194'),('4oupjtm3fx0585mwimah89d0gflwfyy8','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kQ2bb:vCC76ITlnYqo-1AR2t6E98eEc5YNnmKawxJfuQRvH9A','2020-10-21 14:07:15.830903'),('4rdo7pw5jiv9wsq7b84owc6evjy34dw5','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kN3Sr:7Kt3PPtc8bcfWoLTLloaPr3VSjHyqKkYH98XK4QR-7Y','2020-10-13 08:25:53.871318'),('5111t9zsbq2i7ufo982vwb4xf2t54x1q','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kPfba:3KLLqs4EwFnaMCKx6zhR0p-v0IGv7z1bMZmMgxBtqck','2020-10-20 13:33:42.296365'),('5h1ev9jo8mr1x47laupu55dlasj41f94','YWY4NDVkZDIyYjgxZjUyYjYwMTZhMWQ5OTdiMzg0ODJiYzI2MzkzYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzg1MGY0OTgzNGQ1MDZhYWE0NWRiN2E5ZDkyNTBiMzgxYWZjZmI0In0=','2020-08-18 16:12:16.263112'),('5p0v2j1tglbeunv8t3va5m9ny3qm25eb','.eJxVjDsOwjAQRO_iGln-W0tJzxmsXXvBAWRLcVIh7k4ipYBy5r2Zt0i4LjWtg-c0FXEWWpx-O8L85LaD8sB27zL3tswTyV2RBx3y2gu_Lof7d1Bx1G1NaH0whGB1cUyusHV8Q4h-i8obFWyMGVQArWPRrNgysQbjMjhAJz5f5hk3nw:1kPQ7y:2XtqFrwIsEbYU5cWSjsFKmRD9urkQ-PVT0SM663ycnc','2020-10-19 21:02:06.113234'),('5r2pfh9or25sedw4c7rygmnr0dtq0gbm','YWY4NDVkZDIyYjgxZjUyYjYwMTZhMWQ5OTdiMzg0ODJiYzI2MzkzYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzg1MGY0OTgzNGQ1MDZhYWE0NWRiN2E5ZDkyNTBiMzgxYWZjZmI0In0=','2020-08-31 10:50:45.694717'),('5vlotdec76vfjpw841pvo6m4j6cpe88k','YWY4NDVkZDIyYjgxZjUyYjYwMTZhMWQ5OTdiMzg0ODJiYzI2MzkzYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzg1MGY0OTgzNGQ1MDZhYWE0NWRiN2E5ZDkyNTBiMzgxYWZjZmI0In0=','2020-08-20 08:44:28.412949'),('60yxfe38e16ph1p0razmrx6a0go33rf5','MjEwOTRhMjc1NzQ0ZWM2NjQ0OWI5OGY1MWRiMWM0ZjBhZDU5NjQ4Zjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc0NGI0YjQ4M2YwMzU1OWMwMTA1MzY2OTRlODU1ZDY3NjU2YjI0In0=','2020-09-24 10:26:53.080021'),('673gm89k50n2piujaixklcsjgngr051e','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kPfub:kHqFdNhQefTByItKiM1jeULedUb_C9BvZCl3dTMU3mo','2020-10-20 13:53:21.583764'),('6wvir4lc7vvgjisdjdxhsmsh56ajfjhi','MjEwOTRhMjc1NzQ0ZWM2NjQ0OWI5OGY1MWRiMWM0ZjBhZDU5NjQ4Zjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc0NGI0YjQ4M2YwMzU1OWMwMTA1MzY2OTRlODU1ZDY3NjU2YjI0In0=','2020-09-15 07:02:25.703670'),('7x0w656yh7ldte1gxfc2q9pclbbbtwlv','e30:1kKdD7:Z39l5zllyrDURVU48zfe4XKfnkstveKm7rvzvzL8hvw','2020-10-06 15:59:37.804100'),('89089v4q6du548vsui5qqxxinmpldhah','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kNlyR:7u-FIKKJKo9xMMhHurEtP1_LqnubrwCfP93T80sOBzY','2020-10-15 07:57:27.837207'),('8bjpwufaisoonx814xqgdtu6gbbakfhu','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kN8fS:rNbDSdWqoV8BV-83Jg8U4SfR1GjnioLoPcZMqzUkqdw','2020-10-13 13:59:14.872272'),('9bbqk9i645xhqfkpg74k4j67fzk0f47b','e30:1kKxfk:uSnfLxWKVxR2KNUqAu0rDgHryogH30IfUNA9gIdHgBI','2020-10-07 13:50:32.126566'),('9ncq028vihgo2jqhoe8n8kf69jgnp514','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kPOfC:sUiQWuOjIf4SWEk1kKOvzr-6ZcZMU7GqrW0kN5OxTV4','2020-10-19 19:28:18.299832'),('b74jlnret6fq2mn0qr4cq6i68wn00i73','MjEwOTRhMjc1NzQ0ZWM2NjQ0OWI5OGY1MWRiMWM0ZjBhZDU5NjQ4Zjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc0NGI0YjQ4M2YwMzU1OWMwMTA1MzY2OTRlODU1ZDY3NjU2YjI0In0=','2020-09-01 19:58:51.266732'),('bgfpx22r1krhyooitlihur3mkjx83dpy','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kOC0t:07pzkhb5J5NmovXjld6i4CQKB55x_xXV_F21JlmFubM','2020-10-16 11:45:43.836670'),('bkrkmsncyj8nob68r2yykowcetchtnno','N2NmMmFhZjJhODdmZDQ2ZDgxMDg3YjY1YWZjODZlOWQwNmQyMjQwZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YzM5NjJmYzdjMDhmYjJkZTE1ZGE2NGVkOTEyYmZmZjg5NzVkYjVkIn0=','2020-08-19 16:30:12.912842'),('bl3gzsrx25qwrx7qxu2r2blcy5yr1iyl','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kNUn4:MohS2uu5gSErn8F0FP0NLmBSMxj9qxF6EM1QtvPX5hI','2020-10-14 13:36:34.052289'),('bx8dxzi7anu2d62q3ivbnig6iae7wb3y','YWY4NDVkZDIyYjgxZjUyYjYwMTZhMWQ5OTdiMzg0ODJiYzI2MzkzYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzg1MGY0OTgzNGQ1MDZhYWE0NWRiN2E5ZDkyNTBiMzgxYWZjZmI0In0=','2020-08-18 17:17:58.155404'),('crd4bkx5u2qjaw49sadvv9z1eon4dgn9','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kQk4j:XFNGg90uk_dK9mN1Mo67ke6VrxcBzBgIKClx7t0vef4','2020-10-23 12:32:13.754465'),('em6e20cpuvakde900zhys1fn1mty4j88','MjEwOTRhMjc1NzQ0ZWM2NjQ0OWI5OGY1MWRiMWM0ZjBhZDU5NjQ4Zjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc0NGI0YjQ4M2YwMzU1OWMwMTA1MzY2OTRlODU1ZDY3NjU2YjI0In0=','2020-08-26 09:24:41.045031'),('er0blr4ccxc6gticyxxvt81a4srq44er','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kPaEA:mSE2sB3Zm5kbMUUksM1i5q6dGCVm4YQtBlUyiu96vbA','2020-10-20 07:49:10.776165'),('f9qujusss0dzekoef44h7hm6vn5afzv2','.eJxVjDsOwjAQRO_iGln-W0tJzxmsXXvBAWRLcVIh7k4ipYBy5r2Zt0i4LjWtg-c0FXEWWpx-O8L85LaD8sB27zL3tswTyV2RBx3y2gu_Lof7d1Bx1G1NaH0whGB1cUyusHV8Q4h-i8obFWyMGVQArWPRrNgysQbjMjhAJz5f5hk3nw:1kNSJ4:NZlr5JDKVA5sNz7s2GLoSgCjoW18B0jlcxgm6YJMjLw','2020-10-14 10:57:26.212371'),('g0qcypseb1jesbqvcmwiztt31kr4epst','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kNmNN:twIZ1KAbBsxjlcZAf4jlYWEvhcJlpv1uEjODK4GANQE','2020-10-15 08:23:13.313016'),('gk7dsoi042iporigss5ti51cuaqduqoq','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kO8nz:pYhbmW4xls8Omk1cFuiJQraZnqm_A_peRifYhkgdD1Y','2020-10-16 08:20:11.399710'),('h6w5agusemenyaant0h5ifvl4j3h6pjd','e30:1kKxiv:I_vCW1SKRm0ci6YmB6i4b1aGCXspD-RgVclCRYYPzM8','2020-10-07 13:53:49.201904'),('hrdoeytzffeptc5hffnhd9mltog5ybug','.eJxVjDsOwjAQRO_iGln-W0tJzxmsXXvBAWRLcVIh7k4ipYBy5r2Zt0i4LjWtg-c0FXEWWpx-O8L85LaD8sB27zL3tswTyV2RBx3y2gu_Lof7d1Bx1G1NaH0whGB1cUyusHV8Q4h-i8obFWyMGVQArWPRrNgysQbjMjhAJz5f5hk3nw:1kKWO2:kTKHAkrxB_BlQfRsxYC-_NXYXhQA_IvwBkFGjTTKr2s','2020-10-06 08:42:26.920476'),('jh561uggxu7b2s7obuz37v1exm0nq7a8','MjEwOTRhMjc1NzQ0ZWM2NjQ0OWI5OGY1MWRiMWM0ZjBhZDU5NjQ4Zjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc0NGI0YjQ4M2YwMzU1OWMwMTA1MzY2OTRlODU1ZDY3NjU2YjI0In0=','2020-09-10 16:16:17.114304'),('k27vkv3fpi8n2cg4wks4dt74y7k07kj7','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kNX6J:7akq0SKgyTmDhf3O_vOtRFd6NpLEey2DOjZKfMO5Aw4','2020-10-14 16:04:35.403267'),('kaogr2sfzmz1xriv15tpms6ks6ls3653','e30:1kPOez:gKf74CXiuMXGaGAvTevkxBCIQPYgoBxGMHb6CoCIgSM','2020-10-19 19:28:05.015347'),('kgdhjkecscx4pvnycyohr6e3kg0hvpwp','YWY4NDVkZDIyYjgxZjUyYjYwMTZhMWQ5OTdiMzg0ODJiYzI2MzkzYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzg1MGY0OTgzNGQ1MDZhYWE0NWRiN2E5ZDkyNTBiMzgxYWZjZmI0In0=','2020-09-10 09:11:01.621447'),('kwyromh11x5qortn5jdqfyu32wyzixmt','MjEwOTRhMjc1NzQ0ZWM2NjQ0OWI5OGY1MWRiMWM0ZjBhZDU5NjQ4Zjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc0NGI0YjQ4M2YwMzU1OWMwMTA1MzY2OTRlODU1ZDY3NjU2YjI0In0=','2020-09-02 14:49:35.097971'),('l48gqemo4evx7kmxsewrtyh7wvnguipd','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kNsGH:Rz4X_Tf7jSx72Kmj8mIOL3WA0o3fxPh_U00ZT-lk0Dg','2020-10-15 14:40:17.421238'),('l6x84qzdbxkdcph1cllme505yx98mgn9','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kO9AJ:2r896Ri51S31vllPE8E_-v-2exuQT3fmS_wnmoPpqes','2020-10-16 08:43:15.656927'),('lik0gwr8l7qitw4uau993a9gfxxcvugu','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kNtWp:JReW3CzAqmqBmrLrMYs_sAIWl6V9CPuIlIE_A_z6DGU','2020-10-15 16:01:27.559146'),('luhp4pe85g57p05tvnqj4hqcuwu3bbgb','MjEwOTRhMjc1NzQ0ZWM2NjQ0OWI5OGY1MWRiMWM0ZjBhZDU5NjQ4Zjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc0NGI0YjQ4M2YwMzU1OWMwMTA1MzY2OTRlODU1ZDY3NjU2YjI0In0=','2020-09-24 11:32:06.608305'),('lyhcqpkbgn5fmvvq2fij167dabxw4ooc','e30:1kKxiK:PGo8bwlyg87_dVqn5JT72WJ19EQC9jxZiL3sXIMh0iE','2020-10-07 13:53:12.005366'),('ma1agllazif3cp0in1qa5p1ad70kxl7z','MjEwOTRhMjc1NzQ0ZWM2NjQ0OWI5OGY1MWRiMWM0ZjBhZDU5NjQ4Zjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc0NGI0YjQ4M2YwMzU1OWMwMTA1MzY2OTRlODU1ZDY3NjU2YjI0In0=','2020-10-06 07:21:07.895389'),('mlpp7bi2rzuexlifhqiavg1ng8wcyfkp','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kOBoi:nT2JKBinfTZRAAMQlYXUThKoZkZY-nbUimZEQMf-MK4','2020-10-16 11:33:08.618735'),('momg9jocz18wk8izvvq2f8dilxmnjmu8','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kNmpP:J0FfI1wvkIt-qK8o5ajv6xvQcYcFl2rYICHnvpHtjOk','2020-10-15 08:52:11.021819'),('mslmdnke81t8gdbnb6wlpqwnkmur9kzi','e30:1kKdOP:ST-96KUzQvQVYjwt9niAtJ138Wb3s6s9VosUI5bV4Zk','2020-10-06 16:11:17.736953'),('nkrpwhzaijah4umwi9d4okcnveyolr74','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kN9ut:G-OmK1YNzVBy4-z-Nn02JUQsbdBJ-W_OHc5qNx-N_xw','2020-10-13 15:19:15.517301'),('nmddljs9guzcvn861arwo2drn7nth31u','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kO7jm:WvFVLF4aGmUDW_sL4gIwIZsnoel6e26CX2DtpeTdpM8','2020-10-16 07:11:46.255515'),('o173vgy96zqwo7x49tnzvfj6hbn3p0wd','YWY4NDVkZDIyYjgxZjUyYjYwMTZhMWQ5OTdiMzg0ODJiYzI2MzkzYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzg1MGY0OTgzNGQ1MDZhYWE0NWRiN2E5ZDkyNTBiMzgxYWZjZmI0In0=','2020-09-03 13:34:48.010191'),('p77p0t14e21ih7yvl7q6yu0d2jl2hr2i','.eJxVjDsOwjAQRO_iGln-W0tJzxmsXXvBAWRLcVIh7k4ipYBy5r2Zt0i4LjWtg-c0FXEWWpx-O8L85LaD8sB27zL3tswTyV2RBx3y2gu_Lof7d1Bx1G1NaH0whGB1cUyusHV8Q4h-i8obFWyMGVQArWPRrNgysQbjMjhAJz5f5hk3nw:1kKw9A:ECoaeEX3ARMCee7dJhSUeHfbyoPBznrskjXK3ikrI1I','2020-10-07 12:12:48.501914'),('pbrtbpn3cr67aoe39ddy4646byncfcn2','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kQKgP:HMQmPe54Py_VP_Ye_RJK3A45_lQW6vF_5bwErIoYI6I','2020-10-22 09:25:25.232781'),('pe48e5vyqmp7w359mcwmjb0rp6m4yol9','.eJxVjDsOwjAQRO_iGln-W0tJzxmsXXvBAWRLcVIh7k4ipYBy5r2Zt0i4LjWtg-c0FXEWWpx-O8L85LaD8sB27zL3tswTyV2RBx3y2gu_Lof7d1Bx1G1NaH0whGB1cUyusHV8Q4h-i8obFWyMGVQArWPRrNgysQbjMjhAJz5f5hk3nw:1kNRqd:nb6-6tOcPlQzzKGCjHvM272SbE7MBDljzwRbuLqDNB8','2020-10-14 10:28:03.052455'),('pxrwcbei1aqo4f70r4ojer84b8taseze','.eJxVjDsOwjAQRO_iGln-W0tJzxmsXXvBAWRLcVIh7k4ipYBy5r2Zt0i4LjWtg-c0FXEWWpx-O8L85LaD8sB27zL3tswTyV2RBx3y2gu_Lof7d1Bx1G1NaH0whGB1cUyusHV8Q4h-i8obFWyMGVQArWPRrNgysQbjMjhAJz5f5hk3nw:1kKvjG:F1iRDCbby2i2PJzFwK-svcFvcDOSy9_KtWZtCVexQdM','2020-10-07 11:46:02.844449'),('qjs1367tk9anv29qzou68at5hgcch8t3','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kPOod:8x8d_1kbi6bwA-wCmaC2HjIQqPZ-7xJFJ0I-hPikgTo','2020-10-19 19:38:03.198252'),('qkeelcyd2o36vzmeqka7iavmchuftxz9','e30:1kKxfZ:SxFx9oCaS1cdCDXGRQbXDr9zwew7zWFFkKC3W33dCao','2020-10-07 13:50:21.246841'),('r9asb1wu53spuxiq5hqmyh372ils8h2h','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kO9Br:t9XKrgVn96yXAgx2Fa9Sxfh4US8rAPHDJ7anx9G-aDI','2020-10-16 08:44:51.643610'),('ra5g6k902op8lklcgugvdggdfdjd1fmp','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kMno7:-M3cmUNGl1dYkJDpGVEC-uAgCZimzS0rQgEscmdW7F0','2020-10-12 15:42:47.086399'),('rab2dhmnjvwyulspgc2rgu1alb2llg0y','MjEwOTRhMjc1NzQ0ZWM2NjQ0OWI5OGY1MWRiMWM0ZjBhZDU5NjQ4Zjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc0NGI0YjQ4M2YwMzU1OWMwMTA1MzY2OTRlODU1ZDY3NjU2YjI0In0=','2020-09-02 15:01:30.463556'),('rzl1exgk2lz5hkn9yi074t224yfb1qrj','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kO7UJ:ZcR6Tpp-waK4jbQPWE3ARKXNcjedFWPU46dh1In3yzg','2020-10-16 06:55:47.849004'),('rzx00gaw43cb5xnzqsdxud3rqvqkfrdw','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kN2mE:tT8xOdBDwUCE4Gf9LobC53E7-D1seybgzy4ZPiIOqdA','2020-10-13 07:41:50.015309'),('s1qcn1w4cwsedgxzy0vfr83bndbu9d5r','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kN7IJ:jbMfVboLev-4KHDVXr5MViIqF4wznO1KVOA6aKzb1gY','2020-10-13 12:31:15.624972'),('tdpdt4wy464u97uujl8axco8n8b6czb3','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kN88O:Zq_GC1yvtZ0CA3V8Byc0qLQcPhbe-bhqJ_s6ffKuVTI','2020-10-13 13:25:04.688505'),('thim1xebtgtiy9zlz5gl5ivoedwypun0','.eJxVjDsOwjAQRO_iGln-W0tJzxmsXXvBAWRLcVIh7k4ipYBy5r2Zt0i4LjWtg-c0FXEWWpx-O8L85LaD8sB27zL3tswTyV2RBx3y2gu_Lof7d1Bx1G1NaH0whGB1cUyusHV8Q4h-i8obFWyMGVQArWPRrNgysQbjMjhAJz5f5hk3nw:1kN2If:KXvVOI2hRoixWKkoHPzBtxBMaPR-fMiz0ksQ8h2jUUI','2020-10-13 07:11:17.387372'),('tijmak94nc1mbmqw6l0j2kcsqanq9jrw','YWY4NDVkZDIyYjgxZjUyYjYwMTZhMWQ5OTdiMzg0ODJiYzI2MzkzYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzg1MGY0OTgzNGQ1MDZhYWE0NWRiN2E5ZDkyNTBiMzgxYWZjZmI0In0=','2020-08-20 17:27:17.211820'),('tl6chn35kor2tak0nie1kqzegqogcogv','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kPfXB:MLWY6WDfp8QD1cOofPg317KMyjp0UvCD1YLWAWC4Er8','2020-10-20 13:29:09.409642'),('tqngrzp3nvo7n4snq204bhpibls8buw3','N2NmMmFhZjJhODdmZDQ2ZDgxMDg3YjY1YWZjODZlOWQwNmQyMjQwZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YzM5NjJmYzdjMDhmYjJkZTE1ZGE2NGVkOTEyYmZmZjg5NzVkYjVkIn0=','2020-08-19 16:47:15.634862'),('tw935v7c0eghicqrl8m0k1m0yfmcfofr','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kNWWI:SPq3miyD6qUsL2M1TFXXaN-nVFTaNhGO1lsRL8yBXZM','2020-10-14 15:27:22.662803'),('u4wnthwwzu39jxvz5yxkt69wzeacfr49','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kPkmI:fAXdXza0WEqibFUt-xdSSKuuNw6VxaVA69ZC0K0M6Xg','2020-10-20 19:05:06.352300'),('u6cb1fay8kspfzp3qmtr81f0x7ucxwjv','MjEwOTRhMjc1NzQ0ZWM2NjQ0OWI5OGY1MWRiMWM0ZjBhZDU5NjQ4Zjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc0NGI0YjQ4M2YwMzU1OWMwMTA1MzY2OTRlODU1ZDY3NjU2YjI0In0=','2020-09-01 08:32:56.691646'),('u89sifhgwh5b3okg6mwp5pezkuwcykwm','.eJxVjDsOwjAQRO_iGln-W0tJzxmsXXvBAWRLcVIh7k4ipYBy5r2Zt0i4LjWtg-c0FXEWWpx-O8L85LaD8sB27zL3tswTyV2RBx3y2gu_Lof7d1Bx1G1NaH0whGB1cUyusHV8Q4h-i8obFWyMGVQArWPRrNgysQbjMjhAJz5f5hk3nw:1kPLYa:hTx6_L9afU57tvXh-7QfIFssAmOeJsSJ33HVMfyUXQU','2020-10-19 16:09:16.766569'),('vde8dv4qfx1cogoa44km4car9qpiuyeo','e30:1kKxdt:8LKlNzIwW3xc1d0KW91S1ld7MrP0kW9gQf_v2dIM1ls','2020-10-07 13:48:37.097911'),('vycvk6rcxhdyww8bpqrsyjzyej3pb5tl','N2NmMmFhZjJhODdmZDQ2ZDgxMDg3YjY1YWZjODZlOWQwNmQyMjQwZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YzM5NjJmYzdjMDhmYjJkZTE1ZGE2NGVkOTEyYmZmZjg5NzVkYjVkIn0=','2020-08-18 13:58:17.199474'),('w1acnsme2cscj43gs5g6cragnc5d9h8m','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kNRsh:ruE-V5fYZOJaDpdv8MpDdECQA_GM_eA8h63B5LXNgj4','2020-10-14 10:30:11.022206'),('wlrhwn990hoqkjuko6ao8fm474tnu82v','e30:1kKxfG:UlgyAytg9mKEnMBSqKq3ullcIcNfzgjET5itljqWFcc','2020-10-07 13:50:02.376408'),('x9ue7lts33ybwcg5yu8tv0dau7rrjc6p','e30:1kKxVU:RxapBVcREEsI0dpoG06Z2tpaRYUxyxS1EMbOou5Sr_8','2020-10-07 13:39:56.420122'),('xlmu8omuy7djsd30je2nd509egqyaj45','e30:1kKxdl:VdS9fnrDViBG1txMVovAJ_Drq5KXV8ARsSr_qqHJgVY','2020-10-07 13:48:29.652348'),('xt2f86wj4gkxn057nqz5z7h2l7qz34ka','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kN4Fa:AUZErbrZtEIQ8MJbIQbhmAgk46ljHcv9L5bXAnwTMVg','2020-10-13 09:16:14.857493'),('y998nismd4dpwc6d7dtmmtm8615z44ja','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kNOc3:i7TZLX1CSFxO37fuNElKFcWTWCYUiiQskbFYBOQ-zvY','2020-10-14 07:00:47.491533'),('ym09qk4j168rlcy6l3po5rer2ejevwaf','MjEwOTRhMjc1NzQ0ZWM2NjQ0OWI5OGY1MWRiMWM0ZjBhZDU5NjQ4Zjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc0NGI0YjQ4M2YwMzU1OWMwMTA1MzY2OTRlODU1ZDY3NjU2YjI0In0=','2020-08-26 15:59:31.279182'),('yt28ns93afc1mct5oy04kjgqajv6q4su','.eJxVjDsOwjAQRO_iGln-W0tJzxmsXXvBAWRLcVIh7k4ipYBy5r2Zt0i4LjWtg-c0FXEWWpx-O8L85LaD8sB27zL3tswTyV2RBx3y2gu_Lof7d1Bx1G1NaH0whGB1cUyusHV8Q4h-i8obFWyMGVQArWPRrNgysQbjMjhAJz5f5hk3nw:1kNWlV:G8YevQaxo2sgUPa5CunANJllhfmeN65WME7dSYeMAf4','2020-10-14 15:43:05.008946'),('z4try2cstp216o6i0l46f1clz3btjf4g','YWY4NDVkZDIyYjgxZjUyYjYwMTZhMWQ5OTdiMzg0ODJiYzI2MzkzYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzg1MGY0OTgzNGQ1MDZhYWE0NWRiN2E5ZDkyNTBiMzgxYWZjZmI0In0=','2020-08-18 16:04:08.455517'),('zocz45mq9cbj6uqwt37x2xjtc4v38rp0','.eJxVjEEKwyAQRe_iukhmokS77L5nEEfHmrYoxGQVevdGyKJdffjv8Xbh_LZmtzVe3BzFVaC4_H7kw4tLB_Hpy6PKUMu6zCS7Ik_a5L1Gft9O9y-Qfcs9a5UZExAaSKNRwMemYAFYIwVEsh51sgw8ECeGYdKThhAVHhKOLD5f0tY3nA:1kNyBZ:JM0L7GsbkGZi4SCRypeK5o5j8tO0HdtkRcsOtVUyAQw','2020-10-15 20:59:49.795868'),('zva25w8jfbqherstcza03j714pxe1r5u','MjEwOTRhMjc1NzQ0ZWM2NjQ0OWI5OGY1MWRiMWM0ZjBhZDU5NjQ4Zjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc0NGI0YjQ4M2YwMzU1OWMwMTA1MzY2OTRlODU1ZDY3NjU2YjI0In0=','2020-09-01 10:38:05.555062'),('zvg57o6rfwrscjrgt31u1ne1s7osu03j','e30:1kKxhW:9mPw-HGGOLtxehciPFLIKFhHegic_Ig3H-gGvwd_1wY','2020-10-07 13:52:22.810539');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fabrication_rfpg`
--

DROP TABLE IF EXISTS `fabrication_rfpg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fabrication_rfpg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ISSUED` int(11) NOT NULL,
  `CLOSED` int(11) NOT NULL,
  `CLOSED_WITH_IN_TARGET_DATE` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabrication_rfpg`
--

LOCK TABLES `fabrication_rfpg` WRITE;
/*!40000 ALTER TABLE `fabrication_rfpg` DISABLE KEYS */;
INSERT INTO `fabrication_rfpg` VALUES (5,'JAN',20,10,5),(6,'FEB',100,10,5),(7,'MAR',236,50,49),(8,'APR',241,120,111),(9,'MAY',100,91,91),(10,'JUN',200,125,100),(11,'JUL',222,222,222),(12,'AUG',111,101,100),(13,'SEP',0,0,0),(14,'OCT',0,0,0),(15,'NOV',0,0,0),(16,'DEC',0,0,0);
/*!40000 ALTER TABLE `fabrication_rfpg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fabrication_sale`
--

DROP TABLE IF EXISTS `fabrication_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fabrication_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabrication_sale`
--

LOCK TABLES `fabrication_sale` WRITE;
/*!40000 ALTER TABLE `fabrication_sale` DISABLE KEYS */;
INSERT INTO `fabrication_sale` VALUES (3,'JAN',1234567),(4,'FEB',12345678),(5,'MAR',8654321),(6,'APR',10000005),(7,'MAY',5555555),(8,'JUN',13600000),(9,'JUL',500500),(10,'AUG',9000234),(11,'SEP',0),(12,'OCT',0),(13,'NOV',0),(14,'DEC',0),(15,'TARGET',5000000);
/*!40000 ALTER TABLE `fabrication_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_as_of`
--

DROP TABLE IF EXISTS `hr_as_of`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_as_of` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `date_modified` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_as_of`
--

LOCK TABLES `hr_as_of` WRITE;
/*!40000 ALTER TABLE `hr_as_of` DISABLE KEYS */;
INSERT INTO `hr_as_of` VALUES (1,'DATE MODIFIED','2019-12-17 17:11:04.000000');
/*!40000 ALTER TABLE `hr_as_of` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_thc`
--

DROP TABLE IF EXISTS `hr_thc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_thc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `probationary` int(11) NOT NULL,
  `regular` int(11) NOT NULL,
  `male` int(11) NOT NULL,
  `female` int(11) NOT NULL,
  `married` int(11) NOT NULL,
  `single` int(11) NOT NULL,
  `g1` int(11) NOT NULL,
  `g2` int(11) NOT NULL,
  `g3` int(11) NOT NULL,
  `g4` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_thc`
--

LOCK TABLES `hr_thc` WRITE;
/*!40000 ALTER TABLE `hr_thc` DISABLE KEYS */;
INSERT INTO `hr_thc` VALUES (1,'HR/ADMIN',1,2,1,2,0,3,1,2,0,0),(2,'ACCTG',2,0,0,2,0,2,2,0,0,0),(3,'CFMC',1,0,1,0,1,0,1,0,0,0);
/*!40000 ALTER TABLE `hr_thc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_ttech`
--

DROP TABLE IF EXISTS `hr_ttech`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_ttech` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `probationary` int(11) NOT NULL,
  `regular` int(11) NOT NULL,
  `male` int(11) NOT NULL,
  `female` int(11) NOT NULL,
  `married` int(11) NOT NULL,
  `single` int(11) NOT NULL,
  `g1` int(11) NOT NULL,
  `g2` int(11) NOT NULL,
  `g3` int(11) NOT NULL,
  `g4` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_ttech`
--

LOCK TABLES `hr_ttech` WRITE;
/*!40000 ALTER TABLE `hr_ttech` DISABLE KEYS */;
INSERT INTO `hr_ttech` VALUES (1,'IT',5,35,28,12,10,30,27,10,3,0),(2,'CLD',2,5,3,4,4,3,7,0,0,0),(3,'CLD-MTD',0,13,10,3,0,13,13,0,0,0),(4,'ACCTG',0,2,0,2,0,2,2,0,0,0),(5,'DESIGN/FABRICATION',1,4,5,0,4,1,3,1,1,0),(6,'HR/ADMIN',1,2,1,2,0,3,3,0,0,0),(7,'MAINTENANCE',2,10,8,4,4,8,10,2,0,0),(8,'LOGISTICS',2,3,5,0,3,2,2,0,3,0),(9,'TRUCKING',0,1,0,1,0,1,1,0,0,0),(10,'CONFIDENTIAL',0,8,4,4,8,0,0,0,0,8);
/*!40000 ALTER TABLE `hr_ttech` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_ytmi`
--

DROP TABLE IF EXISTS `hr_ytmi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_ytmi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `reg_a` int(11) NOT NULL,
  `khmpc_a` int(11) NOT NULL,
  `reg_b` int(11) NOT NULL,
  `khmpc_b` int(11) NOT NULL,
  `reg_rt` int(11) NOT NULL,
  `khmpc_rt` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_ytmi`
--

LOCK TABLES `hr_ytmi` WRITE;
/*!40000 ALTER TABLE `hr_ytmi` DISABLE KEYS */;
INSERT INTO `hr_ytmi` VALUES (1,'KOMAX',34,1,33,6,4,1),(2,'FOILING/TWISTING',32,3,30,5,0,0),(3,'WIRING INITIAL~FINAL',0,0,0,0,5,0),(4,'TOOL AND DIE',1,0,1,0,9,0),(5,'BATTERY CABLE',4,0,3,0,17,0),(6,'TUBE CUTTING',8,2,7,3,0,0),(7,'CREFORM/FABRICATION',0,0,0,0,7,0),(8,'T-TECH OFFICE DIRECT',0,0,0,0,0,4),(9,'MAINTENANCE',0,0,0,0,0,1),(10,'T-TECH OFFICE',0,0,0,0,3,0),(11,'TRUCKING',0,0,0,0,3,24),(12,'IT YTMI',0,0,0,0,4,3),(13,'CLD',0,0,0,0,9,0);
/*!40000 ALTER TABLE `hr_ytmi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_april`
--

DROP TABLE IF EXISTS `office_april`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_april` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `rfid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfid_id` (`rfid_id`),
  CONSTRAINT `office_april_rfid_id_0d541594_fk_office_employee_id` FOREIGN KEY (`rfid_id`) REFERENCES `office_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_april`
--

LOCK TABLES `office_april` WRITE;
/*!40000 ALTER TABLE `office_april` DISABLE KEYS */;
INSERT INTO `office_april` VALUES (1,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',1),(2,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2),(3,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',3),(4,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',4),(5,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',5),(6,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',6),(7,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',7),(8,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',8),(9,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',9),(10,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',10),(11,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',11),(12,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',12),(13,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',13),(14,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',14),(15,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',15),(16,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',16),(17,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',17),(18,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',18);
/*!40000 ALTER TABLE `office_april` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_august`
--

DROP TABLE IF EXISTS `office_august`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_august` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `d31` varchar(5) DEFAULT NULL,
  `rfid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfid_id` (`rfid_id`),
  CONSTRAINT `office_august_rfid_id_320a8e61_fk_office_employee_id` FOREIGN KEY (`rfid_id`) REFERENCES `office_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_august`
--

LOCK TABLES `office_august` WRITE;
/*!40000 ALTER TABLE `office_august` DISABLE KEYS */;
INSERT INTO `office_august` VALUES (1,'','','','','P','P','','','','','','','','','','','','','','P','','','','','','','P','','','','',1),(2,'','','','','P','P','','','','','','','','','','','','','','A','','','','','','','A','','','','',2),(3,'','','','','P',NULL,'','','','','','','','','','','','','','A','','','','','','','A','','','','',3),(4,'','','','','A',NULL,'P','','','','','','','','','','','','','A','','','','','','','A','','','','',4),(5,'','','','','A','P','','','','','','','','','','','','','','A','','','','','','','A','','','','',5),(6,'','','','','A','P','','','','','','','','','','','','','','A','','','','','','','A','','','','',6),(7,'','','','','A','P','','','','','','','','','','','','','','A','','','','','','','A','','','','',7),(8,'','','','','A','P','','','','','','','','','','','','','','A','','','','','','','A','','','','',8),(9,'','','','','A','P','','','','','','','','','','','','','','A','','','','','','','A','','','','',9),(10,'','','','','A','P','','','','','','','','','','','','','','A','','','','','','','A','','','','',10),(11,'','','','','A','P','','','','','','','','','','','','','','A','','','','','','','A','','','','',11),(12,'','','','','A',NULL,'','','','','','','','','','','','','','A','','','','','','','A','','','','',12),(13,'','','','','A','P','','','','','','','','','','','','','','A','','','','','','','A','','','','',13),(14,'','','','','A','P','','','','','','','','','','','','','','A','','','','','','','A','','','','',14),(15,'','','','','A','P','','','','','','','','','','','','','','A','','','','','','','A','','','','',15),(16,'','','','','A',NULL,'P','','','','','','','','','','','','','A','','','','','','','A','','','','',16),(17,'','','','','A','P','','','','','','','','','','','','','','A','','','','','','','P','','','','',17),(18,NULL,NULL,NULL,NULL,'A',NULL,'P',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A',NULL,NULL,NULL,NULL,NULL,NULL,'A',NULL,NULL,NULL,NULL,18);
/*!40000 ALTER TABLE `office_august` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_december`
--

DROP TABLE IF EXISTS `office_december`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_december` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `d31` varchar(5) DEFAULT NULL,
  `rfid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfid_id` (`rfid_id`),
  CONSTRAINT `office_december_rfid_id_c795b868_fk_office_employee_id` FOREIGN KEY (`rfid_id`) REFERENCES `office_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_december`
--

LOCK TABLES `office_december` WRITE;
/*!40000 ALTER TABLE `office_december` DISABLE KEYS */;
INSERT INTO `office_december` VALUES (1,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',1),(2,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2),(3,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',3),(4,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',4),(5,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',5),(6,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',6),(7,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',7),(8,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',8),(9,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',9),(10,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',10),(11,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',11),(12,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',12),(13,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',13),(14,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',14),(15,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',15),(16,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',16),(17,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',17),(18,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',18);
/*!40000 ALTER TABLE `office_december` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_employee`
--

DROP TABLE IF EXISTS `office_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rfid` varchar(10) NOT NULL,
  `no` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `name_sound` varchar(100) DEFAULT NULL,
  `picture` varchar(100) NOT NULL,
  `status` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfid` (`rfid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_employee`
--

LOCK TABLES `office_employee` WRITE;
/*!40000 ALTER TABLE `office_employee` DISABLE KEYS */;
INSERT INTO `office_employee` VALUES (1,'1',1,'ARNOLD','V','CATUIRA','FACTORY HEAD','1963-12-23','wav_files/sir_arnold_FGw2TAb.wav','no-avatar.png',NULL),(2,'2',2,'JAQUELINE','A','PADOLINA','HR MANAGER','1976-10-03','wav_files/mam_jacquie.wav','no-avatar.png',NULL),(3,'3',3,'MA. TERESA','M','MULAWIN','DEPT. HEAD ACCOUNTING','1965-12-16','wav_files/mam_tess.wav','no-avatar.png',NULL),(4,'4',4,'NEMER','M','VILLANUEVA','DEPT. HEAD FABRICATION','1980-12-19','wav_files/sir_nemer.wav','no-avatar.png',NULL),(5,'5',5,'ANGELITO','C','LANDAOS','SR. DESIGN ENGR.','1981-05-05','wav_files/sir_angelito.wav','no-avatar.png',NULL),(6,'6',6,'ELLEN','F','FERATERO','SEC. HEAD HR','1971-02-12','wav_files/mam_ellen.wav','no-avatar.png',NULL),(7,'7',7,'NARESSA','R','SONGCUAN','CORP. PLANNING SUPPORT','1980-08-14','wav_files/mam_rezza.wav','no-avatar.png',NULL),(8,'8',8,'ODILON','V','AVANZADO','PRODUCTION ENGR.','1963-01-25','wav_files/sir_oddie.wav','no-avatar.png',NULL),(9,'9',9,'NIKKI','VATAVA','DE GUIA','HR SPECIALIST','1998-07-11','wav_files/nikki.wav','pic_files/download.png',NULL),(10,'10',10,'MARY ANN','A','FALAMIG','ACCOUNTING STAFF','1994-11-22','wav_files/mea_ann.wav','no-avatar.png',NULL),(11,'11',11,'CAMILE','C','LEYCANO','ACOUNTING STAFF','2020-09-28','wav_files/camile.wav','no-avatar.png',NULL),(12,'12',12,'ARRIANE','D','PAGASPAS','ACCOUNTING STAFF','1982-02-23','wav_files/arianne.wav','no-avatar.png',NULL),(13,'14',14,'CRESYLLIE','D','CASTILLO','PURCHASING STAFF','1985-10-15','wav_files/cresyllie.wav','no-avatar.png',NULL),(14,'15',15,'KIMBERLY','C','BACONG','PURCHASING STAFF','1998-10-11','wav_files/kim.wav','no-avatar.png',NULL),(15,'18',18,'ROSE MEI','J','ROMERO','MFG. STAFF','2020-08-04','wav_files/mei.wav','no-avatar.png',NULL),(16,'19',19,'JOHN BRIAN','A','BENZON','DESIGN ENGR.','1982-04-05','wav_files/jb.wav','pic_files/a7Zweb2_460s.jpg',NULL),(17,'B5C92F4C',25,'RON MICHAEL','PANGANIBAN','SALAZAR','DESIGN ENGR.','2020-09-30','wav_files/ron.wav','pic_files/aVD5O0M_460s.jpg',NULL),(18,'16',16,'ANGELICA JOY','F','QUIROL','PEZA','2020-08-06','wav_files/angelica.wav','no-avatar.png',NULL);
/*!40000 ALTER TABLE `office_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_february`
--

DROP TABLE IF EXISTS `office_february`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_february` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `rfid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfid_id` (`rfid_id`),
  CONSTRAINT `office_february_rfid_id_e9031661_fk_office_employee_id` FOREIGN KEY (`rfid_id`) REFERENCES `office_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_february`
--

LOCK TABLES `office_february` WRITE;
/*!40000 ALTER TABLE `office_february` DISABLE KEYS */;
INSERT INTO `office_february` VALUES (1,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',1),(2,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2),(3,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',3),(4,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',4),(5,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',5),(6,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',6),(7,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',7),(8,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',8),(9,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',9),(10,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',10),(11,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',11),(12,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',12),(13,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',13),(14,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',14),(15,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',15),(16,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',16),(17,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',17),(18,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',18);
/*!40000 ALTER TABLE `office_february` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_january`
--

DROP TABLE IF EXISTS `office_january`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_january` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `d31` varchar(5) DEFAULT NULL,
  `rfid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfid_id` (`rfid_id`),
  CONSTRAINT `office_january_rfid_id_75d02cfc_fk_office_employee_id` FOREIGN KEY (`rfid_id`) REFERENCES `office_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_january`
--

LOCK TABLES `office_january` WRITE;
/*!40000 ALTER TABLE `office_january` DISABLE KEYS */;
INSERT INTO `office_january` VALUES (1,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',1),(2,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2),(3,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',3),(4,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',4),(5,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',5),(6,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',6),(7,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',7),(8,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',8),(9,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',9),(10,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',10),(11,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',11),(12,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',12),(13,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',13),(14,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',14),(15,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',15),(16,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',16),(17,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',17),(18,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',18);
/*!40000 ALTER TABLE `office_january` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_july`
--

DROP TABLE IF EXISTS `office_july`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_july` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `d31` varchar(5) DEFAULT NULL,
  `rfid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfid_id` (`rfid_id`),
  CONSTRAINT `office_july_rfid_id_d893fac5_fk_office_employee_id` FOREIGN KEY (`rfid_id`) REFERENCES `office_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_july`
--

LOCK TABLES `office_july` WRITE;
/*!40000 ALTER TABLE `office_july` DISABLE KEYS */;
INSERT INTO `office_july` VALUES (1,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',1),(2,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2),(3,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',3),(4,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',4),(5,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',5),(6,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',6),(7,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',7),(8,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',8),(9,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',9),(10,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',10),(11,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',11),(12,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',12),(13,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',13),(14,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',14),(15,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',15),(16,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',16),(17,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',17),(18,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',18);
/*!40000 ALTER TABLE `office_july` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_june`
--

DROP TABLE IF EXISTS `office_june`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_june` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `rfid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfid_id` (`rfid_id`),
  CONSTRAINT `office_june_rfid_id_f75767a4_fk_office_employee_id` FOREIGN KEY (`rfid_id`) REFERENCES `office_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_june`
--

LOCK TABLES `office_june` WRITE;
/*!40000 ALTER TABLE `office_june` DISABLE KEYS */;
INSERT INTO `office_june` VALUES (1,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',1),(2,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2),(3,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',3),(4,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',4),(5,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',5),(6,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',6),(7,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',7),(8,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',8),(9,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',9),(10,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',10),(11,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',11),(12,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',12),(13,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',13),(14,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',14),(15,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',15),(16,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',16),(17,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',17),(18,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',18);
/*!40000 ALTER TABLE `office_june` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_march`
--

DROP TABLE IF EXISTS `office_march`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_march` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `d31` varchar(5) DEFAULT NULL,
  `rfid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfid_id` (`rfid_id`),
  CONSTRAINT `office_march_rfid_id_fc6b95ec_fk_office_employee_id` FOREIGN KEY (`rfid_id`) REFERENCES `office_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_march`
--

LOCK TABLES `office_march` WRITE;
/*!40000 ALTER TABLE `office_march` DISABLE KEYS */;
INSERT INTO `office_march` VALUES (1,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',1),(2,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2),(3,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',3),(4,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',4),(5,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',5),(6,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',6),(7,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',7),(8,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',8),(9,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',9),(10,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',10),(11,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',11),(12,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',12),(13,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',13),(14,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',14),(15,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',15),(16,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',16),(17,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',17),(18,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',18);
/*!40000 ALTER TABLE `office_march` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_may`
--

DROP TABLE IF EXISTS `office_may`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_may` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `d31` varchar(5) DEFAULT NULL,
  `rfid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfid_id` (`rfid_id`),
  CONSTRAINT `office_may_rfid_id_f65ecaad_fk_office_employee_id` FOREIGN KEY (`rfid_id`) REFERENCES `office_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_may`
--

LOCK TABLES `office_may` WRITE;
/*!40000 ALTER TABLE `office_may` DISABLE KEYS */;
INSERT INTO `office_may` VALUES (1,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',1),(2,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2),(3,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',3),(4,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',4),(5,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',5),(6,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',6),(7,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',7),(8,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',8),(9,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',9),(10,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',10),(11,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',11),(12,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',12),(13,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',13),(14,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',14),(15,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',15),(16,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',16),(17,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',17),(18,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',18);
/*!40000 ALTER TABLE `office_may` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_november`
--

DROP TABLE IF EXISTS `office_november`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_november` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `rfid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfid_id` (`rfid_id`),
  CONSTRAINT `office_november_rfid_id_5c6a0978_fk_office_employee_id` FOREIGN KEY (`rfid_id`) REFERENCES `office_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_november`
--

LOCK TABLES `office_november` WRITE;
/*!40000 ALTER TABLE `office_november` DISABLE KEYS */;
INSERT INTO `office_november` VALUES (1,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',1),(2,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',2),(3,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',3),(4,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',4),(5,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',5),(6,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',6),(7,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',7),(8,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',8),(9,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',9),(10,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',10),(11,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',11),(12,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',12),(13,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',13),(14,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',14),(15,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',15),(16,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',16),(17,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',17),(18,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',18);
/*!40000 ALTER TABLE `office_november` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_october`
--

DROP TABLE IF EXISTS `office_october`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_october` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `d31` varchar(5) DEFAULT NULL,
  `rfid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfid_id` (`rfid_id`),
  CONSTRAINT `office_october_rfid_id_610052fa_fk_office_employee_id` FOREIGN KEY (`rfid_id`) REFERENCES `office_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_october`
--

LOCK TABLES `office_october` WRITE;
/*!40000 ALTER TABLE `office_october` DISABLE KEYS */;
INSERT INTO `office_october` VALUES (1,'P','P','','','P','P','P','','','','','','','','','','','','','','','','','','','','','','','','',1),(2,'P','P','','','P','P','P','','','','','','','','','','','','','','','','','','','','','','','','',2),(3,'P','P','','','P','P','P','','','','','','','','','','','','','','','','','','','','','','','','',3),(4,'P','P','','','P','P','P','','','','','','','','','','','','','','','','','','','','','','','','',4),(5,'P','P','','','P','P','P','','','','','','','','','','','','','','','','','','','','','','','','',5),(6,'P','P','','','P','P','P','','','','','','','','','','','','','','','','','','','','','','','','',6),(7,'P','A','','','P','P','P','','','','','','','','','','','','','','','','','','','','','','','','',7),(8,'P','P','','','P','P','P','','','','','','','','','','','','','','','','','','','','','','','','',8),(9,'P','P',NULL,NULL,'P','P','A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9),(10,'P','P','','','P','P','A','','','','','','','','','','','','','','','','','','','','','','','','',10),(11,'P','P','','','P','P','P','','','','','','','','','','','','','','','','','','','','','','','','',11),(12,'A','A','','','A','A','A','','','','','','','','','','','','','','','','','','','','','','','','',12),(13,'P','P','','','P','P','P','','','','','','','','','','','','','','','','','','','','','','','','',13),(14,'P','P','','','P','P','P','','','','','','','','','','','','','','','','','','','','','','','','',14),(15,'A','A','','','P','A','A','','','','','','','','','','','','','','','','','','','','','','','','',15),(16,'A','A',NULL,NULL,'A','A','A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16),(17,'P','P',NULL,NULL,'P','P','P',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17),(18,'P','P','','','P','P','P','','','','','','','','','','','','','','','','','','','','','','','','',18);
/*!40000 ALTER TABLE `office_october` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_pagestat`
--

DROP TABLE IF EXISTS `office_pagestat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_pagestat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_pagestat`
--

LOCK TABLES `office_pagestat` WRITE;
/*!40000 ALTER TABLE `office_pagestat` DISABLE KEYS */;
INSERT INTO `office_pagestat` VALUES (1,'False');
/*!40000 ALTER TABLE `office_pagestat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_september`
--

DROP TABLE IF EXISTS `office_september`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_september` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `rfid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfid_id` (`rfid_id`),
  CONSTRAINT `office_september_rfid_id_3b5c8705_fk_office_employee_id` FOREIGN KEY (`rfid_id`) REFERENCES `office_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_september`
--

LOCK TABLES `office_september` WRITE;
/*!40000 ALTER TABLE `office_september` DISABLE KEYS */;
INSERT INTO `office_september` VALUES (1,'','','','','','','','','','','','','','','','','','','','','','','','','','','','P','P','P',1),(2,'','','','','','','','','','','','','','','','','','','','','','','','','','','','P','P','P',2),(3,'','','','','','','','','','','','','','','','','','','','','','','','','','','','P','P','P',3),(4,'','','','','','','','','','','','','','','','','','','','','','','','','','','','P','P','P',4),(5,'','','','','','','','','','','','','','','','','','','','','','','','','','','','P','P','P',5),(6,'','','','','','','','','','','','','','','','','','','','','','','','','','','','P','P','P',6),(7,'','','','','','','','','','','','','','','','','','','','','','','','','','','','P','P','P',7),(8,'','','','','','','','','','','','','','','','','','','','','','','','','','','','P','P','P',8),(9,'','','','','','','','','','','','','','','','','','','','','','','','','','','','P','P','P',9),(10,'','','','','','','','','','','','','','','','','','','','','','','','','','','','P','P','P',10),(11,'','','','','','','','','','','','','','','','','','','','','','','','','','','','P','P','P',11),(12,'','','','','','','','','','','','','','','','','','','','','','','','','','','','A','A','A',12),(13,'','','','','','','','','','','','','','','','','','','','','','','','','','','','P','P','P',13),(14,'','','','','','','','','','','','','','','','','','','','','','','','','','','','P','P','P',14),(15,'','','','','','','','','','','','','','','','','','','','','','','','','','','','A','A','A',15),(16,'','','','','','','','','','','','','','','','','','','','','','','','','','','','A','A','A',16),(17,'','','','','','','','','','','','','','','','','','','','','',NULL,NULL,'','','','','P','P','P',17),(18,'','','','','','','','','','','','','','','','','','','','','','','','','','','','P','P','P',18);
/*!40000 ALTER TABLE `office_september` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbf_rfpg`
--

DROP TABLE IF EXISTS `rbf_rfpg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbf_rfpg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ISSUED` int(11) NOT NULL,
  `CLOSED` int(11) NOT NULL,
  `CLOSED_WITH_IN_TARGET_DATE` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbf_rfpg`
--

LOCK TABLES `rbf_rfpg` WRITE;
/*!40000 ALTER TABLE `rbf_rfpg` DISABLE KEYS */;
INSERT INTO `rbf_rfpg` VALUES (1,'JAN',120,10,70),(2,'FEB',50,50,50),(3,'MAR',221,221,16),(4,'APR',261,261,100),(5,'MAY',156,156,25),(6,'JUN',191,191,150),(7,'JUL',350,320,320),(8,'AUG',214,214,27),(9,'SEP',166,163,50),(10,'OCT',227,201,201),(11,'NOV',5,5,4),(12,'DEC',0,0,0);
/*!40000 ALTER TABLE `rbf_rfpg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbf_sale`
--

DROP TABLE IF EXISTS `rbf_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbf_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbf_sale`
--

LOCK TABLES `rbf_sale` WRITE;
/*!40000 ALTER TABLE `rbf_sale` DISABLE KEYS */;
INSERT INTO `rbf_sale` VALUES (3,'JAN',5500000),(4,'FEB',7000000),(5,'MAR',2555551),(6,'APR',800000),(7,'MAY',8888888),(8,'JUN',3777773),(9,'JUL',950500),(10,'AUG',9000234),(11,'SEP',4000000),(12,'OCT',0),(13,'NOV',0),(14,'DEC',0),(15,'TARGET',5000000);
/*!40000 ALTER TABLE `rbf_sale` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-09 16:01:57
