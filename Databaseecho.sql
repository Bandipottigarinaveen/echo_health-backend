-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: echohealth
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add password reset otp',7,'add_passwordresetotp'),(26,'Can change password reset otp',7,'change_passwordresetotp'),(27,'Can delete password reset otp',7,'delete_passwordresetotp'),(28,'Can view password reset otp',7,'view_passwordresetotp'),(29,'Can add prediction result',8,'add_predictionresult'),(30,'Can change prediction result',8,'change_predictionresult'),(31,'Can delete prediction result',8,'delete_predictionresult'),(32,'Can view prediction result',8,'view_predictionresult'),(33,'Can add oral cancer prediction',9,'add_oralcancerprediction'),(34,'Can change oral cancer prediction',9,'change_oralcancerprediction'),(35,'Can delete oral cancer prediction',9,'delete_oralcancerprediction'),(36,'Can view oral cancer prediction',9,'view_oralcancerprediction'),(37,'Can add oral cancer assessment',10,'add_oralcancerassessment'),(38,'Can change oral cancer assessment',10,'change_oralcancerassessment'),(39,'Can delete oral cancer assessment',10,'delete_oralcancerassessment'),(40,'Can view oral cancer assessment',10,'view_oralcancerassessment'),(41,'Can add oral cancer chat',11,'add_oralcancerchat'),(42,'Can change oral cancer chat',11,'change_oralcancerchat'),(43,'Can delete oral cancer chat',11,'delete_oralcancerchat'),(44,'Can view oral cancer chat',11,'view_oralcancerchat'),(45,'Can add user profile',12,'add_userprofile'),(46,'Can change user profile',12,'change_userprofile'),(47,'Can delete user profile',12,'delete_userprofile'),(48,'Can view user profile',12,'view_userprofile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$rGsg8onS8zcCdnU8m48i6F$oLi1B3HIjxwjWoHDqn0+LyTyVsFkpShNGKuFxGhwPyw=',NULL,0,'naveen','','','bandipottigarinaveen@gmail.com',0,1,'2025-08-12 07:38:43.153410'),(2,'pbkdf2_sha256$1000000$y1PPchFFDqfHkrxC1LfhrZ$QM1MOWyH1U1C+32ehyX/HeJQKW9NW8y5zpcRPxBnsZ0=',NULL,0,'pavan','','','bandipottigarinaveen5098@gmail.com',0,1,'2025-08-13 03:09:22.278770'),(3,'pbkdf2_sha256$1000000$2ZBpEoGvDpowSEEc5UCZ9D$tCcvBzzo1NJHkAlZnGp45V3gWjnafAqyWwtuGE8NavY=',NULL,0,'naveenkumar','','','kpdanush8@gmail.com',0,1,'2025-08-18 15:30:56.445614'),(4,'pbkdf2_sha256$1000000$QBjexEikP2tQUbiKOCYXer$TvRX6b3k0lyKZUgHUodzPkKjdwN78nho97SFiuk03Xc=',NULL,0,'saikumar','','','bandipottigarinaveen5098.sse@saveetha.com',0,1,'2025-08-19 03:46:55.440759'),(5,'pbkdf2_sha256$1000000$N4gREbByS5LB3sEQD74wnF$x2WyzkMvvrlmHcMMbffeg9/Rh7YmioNXLIz9TvGTzQg=',NULL,0,'ramukumar','','','charankumarreddy2306@gmail.com',0,1,'2025-08-19 04:18:27.207549'),(6,'pbkdf2_sha256$1000000$Ac43jEmBWrf7SFdpFI650z$GWJ2umioxD38gsunPqyjvne4wwy8DYtiQo7z3tzatlQ=',NULL,0,'kaka','','','bandipottikaka5098@gmail.com',0,1,'2025-08-19 04:57:00.884366'),(7,'pbkdf2_sha256$1000000$qTB7JblCjmXyjYlIdaKKGG$ivjFlylQeNySiqjGE/qSWpQMXcLm/0LkhnrclVIVOhQ=',NULL,0,'uuuuu','','','kpdanush88@gmail.co',0,1,'2025-08-20 11:55:52.490264'),(8,'pbkdf2_sha256$1000000$fLqEDFcfqcAtZ7FbYa4R3R$9Z8PWzOjrLcJBiwJVKClJW9XkSVclwox7QDMDxUlnnU=',NULL,0,'ramu','','','sreedhar200411@gmail.com',0,1,'2025-09-11 06:20:30.803546');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'echohealth','oralcancerassessment'),(11,'echohealth','oralcancerchat'),(9,'echohealth','oralcancerprediction'),(7,'echohealth','passwordresetotp'),(8,'echohealth','predictionresult'),(12,'echohealth','userprofile'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-08-04 09:23:15.794489'),(2,'auth','0001_initial','2025-08-04 09:23:17.529186'),(3,'admin','0001_initial','2025-08-04 09:23:17.997640'),(4,'admin','0002_logentry_remove_auto_add','2025-08-04 09:23:18.024219'),(5,'admin','0003_logentry_add_action_flag_choices','2025-08-04 09:23:18.057710'),(6,'contenttypes','0002_remove_content_type_name','2025-08-04 09:23:18.391002'),(7,'auth','0002_alter_permission_name_max_length','2025-08-04 09:23:18.610943'),(8,'auth','0003_alter_user_email_max_length','2025-08-04 09:23:18.701449'),(9,'auth','0004_alter_user_username_opts','2025-08-04 09:23:18.726207'),(10,'auth','0005_alter_user_last_login_null','2025-08-04 09:23:18.933049'),(11,'auth','0006_require_contenttypes_0002','2025-08-04 09:23:18.939500'),(12,'auth','0007_alter_validators_add_error_messages','2025-08-04 09:23:18.968835'),(13,'auth','0008_alter_user_username_max_length','2025-08-04 09:23:19.143914'),(14,'auth','0009_alter_user_last_name_max_length','2025-08-04 09:23:19.275679'),(15,'auth','0010_alter_group_name_max_length','2025-08-04 09:23:19.318490'),(16,'auth','0011_update_proxy_permissions','2025-08-04 09:23:19.334841'),(17,'auth','0012_alter_user_first_name_max_length','2025-08-04 09:23:19.469434'),(18,'sessions','0001_initial','2025-08-04 09:23:19.553081'),(19,'echohealth','0001_initial','2025-08-04 10:18:27.240915'),(20,'echohealth','0002_predictionresult','2025-08-11 09:30:27.846355'),(21,'echohealth','0003_oralcancerprediction_delete_predictionresult','2025-08-12 07:36:25.923356'),(22,'echohealth','0004_oralcancerassessment','2025-08-12 08:40:01.705486'),(23,'echohealth','0005_oralcancerchat','2025-08-12 08:53:34.003429'),(24,'echohealth','0006_userprofile','2025-08-13 00:56:01.979269');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('12dm8g4ot4bvp1l50sbg99egw9f7f0l6','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uoQtz:ge8hTUKHM-lpvsclbbogva-CzAmdQYrZLNsjgdWZ9SI','2025-09-02 18:17:43.527964'),('1arhvtyyg7jgne7oqkdhso9y05cma8vr','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uoQnZ:v7CBIuiE6F6vSTrKC7tmQ5-kNAtmAIcnvoGJxQWnI-I','2025-09-02 18:11:05.717042'),('1h4rdbsm3ic0k2fjgwgvc6qrsci076wr','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uoOk3:NeaS4Mb9t4HafJIiXbAuIsZMIzRZkd8hmeWRUnNrWjE','2025-09-02 15:59:19.746248'),('1kge1oduj0ft67tcs31f2eer2gehc4wo','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uofxD:RLHxT7rceV9EF-jZdK8v9XFYbBVDoYGC7BvNvxfAH0g','2025-09-03 10:22:03.144316'),('227261dbchpnfioqkpzovihu27qv0mhw','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uo2bs:OPgCh6cojxfeolbUmWGEFoMsMDJFYPbVD7uB5LsUGYM','2025-09-01 16:21:24.230931'),('25y1sy2ll6slf636walj0cpl1yv9l20z','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uoO82:viyJLkgvcZikCFJIrQJWGkq2Hh5kZPPUgLjTdrVGn_A','2025-09-02 15:20:02.266579'),('280ueq7h43g9edzbqu4o6a5ufzzfnbgb','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uodwP:WWHAsqYi8HO0mBpz3uQADEgzSvcvSWmw3zZF-YXitXU','2025-09-03 08:13:05.180895'),('3q7fe8k9vxbjqzagttpaobgrhj7d0v2x','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uuNfM:8aC75fDuMm0SsNlre1zA-aUfpFekPMXsFnOhlFf8FKU','2025-09-19 04:03:12.029506'),('4siejvdlacoa7vwx8vj17pwxnr34lkfp','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1utkQZ:xiGJR-0TAO7jDaoGI7M3XUS49MGTvP91U3H-tqozrHc','2025-09-17 10:09:19.146327'),('68aht9q1mkrrp1o3hor5vds25pszc2bd','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uoObx:Yqkt6ZokYztNg-hLNSwMfhuK9x9VYcC2gSqZVjEzkqE','2025-09-02 15:50:57.074562'),('7ad4twye1ielj6c0yvlyt640deep8wd4','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uofdR:WJrX16nhWhCLoWL4tpjLCcWDXx2dRAmU_B-4YE2NnhA','2025-09-03 10:01:37.396057'),('9guv2xoignao0asx21corhbd1zexg11m','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uruA2:tYooABQUGyYf43dART--D5pEqR0KJEWwtAuyUldV_F4','2025-09-12 08:08:38.873860'),('9na7083pgxhzplg43wx6m3a6ojzm2tda','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uodaQ:7tPv1Mf5h8VbqguDxN1RtioKGhaw8YonJd8TEoWT4sA','2025-09-03 07:50:22.584222'),('a5o8eqh9ktznybzvphrbddcgnxao1ymp','eyJ2ZXJpZmllZF9lbWFpbCI6ImJhbmRpcG90dGlnYXJpbmF2ZWVuQGdtYWlsLmNvbSJ9:1uoLn3:NjS7rgnPk8SK2cZ0tNAgMaFgseMaLPu5k_fRzYr2OZg','2025-09-02 12:50:13.068467'),('co7e483g3lg915ctl19nbbfjo6fhbrq9','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uog5t:BFgfyVvYKveSbRbjm6964jc9VBkXVLWQXLYdSGWV4_g','2025-09-03 10:31:01.795604'),('ddssq25l8sjm0f6p21e0iw2b5n5wjpye','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uoEzc:WBy_acdIwjBcSWWdW5lo0eh16Wwt4WF7UK79K41Yrmo','2025-09-02 05:34:44.007733'),('exly6nfyruustd2xc8wq3siu6fg7wf3j','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uoaQV:xxt5xjKgMmVqiTe55MJ6U1ED2RWtPQTD4aiazt-BDiw','2025-09-03 04:27:55.846507'),('f853zlmq56ko27583gqk88biu24h3qyy','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uoZi7:HwArT-M4RGl7kFqx_-Zl1kfwn3MssshKSm_oIWy9csg','2025-09-03 03:42:03.049185'),('frr619zhja3fq4hdcp5lkix621xg4rop','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uoQwZ:cIFSB7WZZ1ebpFE0K72tkHvpVRZ5qI-PhJk15gIacFs','2025-09-02 18:20:23.267148'),('g95sn3bp6nm6822ddxfqjevnxzm1oq9t','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uoOCh:3tORbN-kTj99_f6O93v_1zaM8AJoBSkzVlU5LnJqENY','2025-09-02 15:24:51.256958'),('gclzvtdytdnimd7ew1qb6bf6ae870m53','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uo2BY:YLIZy-1Oz6R8Ljv0Q3Uyz8vHOCNj-n6M-LBjm9Av0sA','2025-09-01 15:54:12.976628'),('gggciwrlp8eiiyqxodyqixnbs7shfjo5','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uofXg:WB0mVbwkGmkWSLgv8wHlS3Shf9w1z8Ojghg0GaRKTKE','2025-09-03 09:55:40.438241'),('hg4ffcwzlpuu3oharswuqi32zkz1njuw','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uoOQG:tnF7K-UHNH8vRg5L1O9smt72vP1QrwY2o_Gde6imL7c','2025-09-02 15:38:52.993344'),('higocjn54a24c1wp50hrnfrcbnhez9hl','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uobVg:W6zwqmXo_gtO5Go4zgCi3uleAZIHtJsq3hp4TK1lVL0','2025-09-03 05:37:20.660014'),('hqwot20i4jtszv0e6twri7q0s7t58esz','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uodoE:fPERXDtyP856jsLCKNYqCGDt56GVuzVFa6oxBGv0H6k','2025-09-03 08:04:38.689941'),('hrq4qyjoy06t9nkf4mw0suwcpltotojx','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uvpIL:F6uAcxd57vtpCYIgPgDVlR_RVDr8DRT9lffD07bLbIs','2025-09-23 03:45:25.387279'),('iaj7ji9c0q3wwdbl4kpgz0jinf9tpotg','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uoe8W:FoQ_jLiHPrkszTs01FRMNQ4ZFTkqn5qzXDBnLTi3m9o','2025-09-03 08:25:36.335878'),('j9z5fffv4u1htfnlk73ln70k1hpbgncb','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uobSV:N230EvOIs9HSg2xSPmiBiSFxZ_FioLNaTOB5C4Fm0JQ','2025-09-03 05:34:03.091593'),('jblev1numvl27usmgmy99y8mkxmwn6w8','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uoZmU:VV64KGFWP8wyz4E0z-YTCiUa4kkrTendgUiXrQHhHIk','2025-09-03 03:46:34.251633'),('js31qp3fw0mc5mckx7pdx7hqfpgb07b4','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uo2YA:mTI0aQOMuwSBkl7deAEmSsU0m9Cx1NY-fMFzJZaxQfI','2025-09-01 16:17:34.448099'),('jszaxxx4inu8como4q90wr06ggruvz8c','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uoFEa:kqQK6pQP7t1DhaeVxkC76ueYduB3eQQ5YobcYQU5HvE','2025-09-02 05:50:12.420326'),('jtn5jyyve8kzhfdbh2ma53krnh76o7or','eyJ2ZXJpZmllZF9lbWFpbCI6ImJhbmRpcG90dGlnYXJpbmF2ZWVuQGdtYWlsLmNvbSJ9:1uoErZ:n9Pl5U-a2_WUP9YWM9xs1_BBmAVJdor-2W-G6EplSak','2025-09-02 05:26:25.851287'),('kcpcni86eqjq0nw5a05u0tqcfmt8qh79','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uvotR:tfYeORYPWiwLPHjaVxcQv_EKFmyURYqNPRsdLHXKFyw','2025-09-23 03:19:41.815469'),('l3d8059hjdnoxf6p0aeaxd58bhbhc3x5','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uoaEq:6LWM5Uv_cDBMd7cmGsGDN6KKhEFBF0xDAvoLtqsWoq0','2025-09-03 04:15:52.732868'),('n0cgn07jxpgp2we06b0gk5muprutin61','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uoRV6:kaIBtjLqsCiNsn6ULJrSqUHk_A17hUosXz0TS-MJS5E','2025-09-02 18:56:04.820142'),('n3lhw6wx3vllstit0fjyoeodsvm7hcd0','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uo2Mv:RusUcEyL6bNQuApQ90Tjm47FoTTXfRr8iyBa4KMCUtg','2025-09-01 16:05:57.165164'),('n9o532enhpo0ooazs0yi1fk1bobqmidw','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uoESX:jETQosBXln7e-ysnxJiEPpqM0JxnWb1eMy9Z_kkMk3c','2025-09-02 05:00:33.799557'),('nw4r7q0z5jj30h23dw2uyax1r1v7u1os','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uoeN2:WN0RwefXdo4EJAgCIcIywwSJmnO2iJO99S7lcWiApNo','2025-09-03 08:40:36.434208'),('octhqp65c7fqn566aw78zp7vdj57pad9','eyJ2ZXJpZmllZF9lbWFpbCI6ImJhbmRpcG90dGlnYXJpbmF2ZWVuQGdtYWlsLmNvbSJ9:1uoLZV:E0KApfYrKeJZPzvFzv49ytwljArY8rqy_BY4Ral9Lpw','2025-09-02 12:36:13.307550'),('pfxvedqsoueswaa9odn5tizb1xr9dixu','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uo2Fz:TlqBY5oNMkwf8NcdtoiNwPqiEmMP-szOV6ewek_QHnI','2025-09-01 15:58:47.602729'),('py6e5364thtttumilt9i43z34naqcpsa','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uvpNU:hDoqdvDik49YuqC9QpEAc7pOg8rFiEVxwdoQeQTGcwo','2025-09-23 03:50:44.564427'),('qn8o2yl31m5cywhl8rr5h3z1x1gk9egh','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uodSf:EqgreWlhA47ojIniXM6wW6dTlCCL03G8FP2-xazs_mA','2025-09-03 07:42:21.425699'),('rcekgpwrumplnk1p56809pdytcqn4x88','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uonFs:cyQQta1Bh3DvHjPLkfAlz-1tr_Y_EQbtIf4V12Qn91c','2025-09-03 18:09:48.393589'),('skgugajou49joktvq0f96y40o3x0xfoy','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uoa3I:cRz_teFjt5Ek1bpkw-NNWa_-QCXKyJlKIq30TdXXnAw','2025-09-03 04:03:56.500192'),('ss7117e6q6wh5dqywfloovxqwhnr5ld2','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uvp04:4k2M8LPFUBSQqvW7gaUG4EQc3lY0r78GLc46FEdgUyI','2025-09-23 03:26:32.205717'),('sslm7tzq1000xz90nkp8us4et6cbcs8j','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uoZzg:0X46hyQxd8r2z65diarU51XaxgZykb0Z_3-hAx_mrIU','2025-09-03 04:00:12.241368'),('v48vs8gdq83tyj4ryoewqa844reothrn','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uoOHy:LSuoH10J_NXR9taRtHe8m-6J1gd1YqlDYzzTGVO4RhQ','2025-09-02 15:30:18.036966'),('v8aik8du2wia8euzuwx6aox0lxlojwg3','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uoZWK:lZgM6pLhSYWdttPBOWV1iQ5sQUofSS-auSxRIHQYvRE','2025-09-03 03:29:52.258942'),('vo06tdtl2pqi3mpkuse3brzxlguvz0cy','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uoRed:-U8vudI1FiITjRAW_d0Pw8yTX2gYA-PmP90GQsypqIc','2025-09-02 19:05:55.343140'),('w85iyudyprzj5gq170dki88ysyajnvw7','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uoRFL:Y_t6yCGV9my_mbHxos-V7dpkdtTGf6chRd5DHFEzfLc','2025-09-02 18:39:47.504446'),('y1hdxs54g2oxofdq4epwxzjqpekoruho','eyJ2ZXJpZmllZF9lbWFpbCI6InN1bmthcmF1ZGF5a3VtYXI5QGdtYWlsLmNvbSJ9:1uoOU3:5utSEx54-ZtZITiUQIqT0dPOw7kZ6bATMJQ11Ng99JA','2025-09-02 15:42:47.466070'),('y225ftka7v117qctwp11hz0xa1tnbyni','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1utkbm:h3aM5TWDH6SkfWImJflMWVYc3RGwLqmV-gnH4nDskHU','2025-09-17 10:20:54.257723'),('yqa9dqz7raf9qqzdr07loqv6jko784h7','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uoOWf:jkWXe6uSGcuJV274YC1JWCnedySIPb9qhKE30daq-AM','2025-09-02 15:45:29.716874'),('z0t3td4by10aijfcsy5l4i8kduaytoh3','eyJ2ZXJpZmllZF9lbWFpbCI6ImtwZGFudXNoOEBnbWFpbC5jb20ifQ:1uoR9e:Uctw3LOE1_L5G4mtp7Fx78GWpWEh15fOKWPKxnMt604','2025-09-02 18:33:54.664177');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `echohealth_oralcancerassessment`
--

DROP TABLE IF EXISTS `echohealth_oralcancerassessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `echohealth_oralcancerassessment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `prediction` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `risk_level` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prediction_percentage` double NOT NULL,
  `mode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `echohealth_oralcancerassessment_user_id_b921c21c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `echohealth_oralcancerassessment_user_id_b921c21c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `echohealth_oralcancerassessment`
--

LOCK TABLES `echohealth_oralcancerassessment` WRITE;
/*!40000 ALTER TABLE `echohealth_oralcancerassessment` DISABLE KEYS */;
INSERT INTO `echohealth_oralcancerassessment` VALUES (1,'Cancer','High',78.95,'image','2025-08-12 08:45:06.273610',1),(2,'Cancer','High',77.03,'image','2025-09-10 01:31:31.629012',6),(3,'Cancer','Medium',64.8,'image','2025-09-10 08:04:57.574664',6),(4,'Cancer','Medium',60.44,'image','2025-09-11 09:30:42.720487',8),(5,'Non-cancer','Low',26.05,'image','2025-09-11 09:42:17.369011',8),(6,'Cancer','Medium',68.06,'image','2025-09-13 04:18:36.485395',8),(7,'Non-cancer','Low',17.25,'image','2025-09-13 04:20:50.747845',8);
/*!40000 ALTER TABLE `echohealth_oralcancerassessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `echohealth_oralcancerchat`
--

DROP TABLE IF EXISTS `echohealth_oralcancerchat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `echohealth_oralcancerchat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `echohealth_oralcancerchat_user_id_315bdff9_fk_auth_user_id` (`user_id`),
  CONSTRAINT `echohealth_oralcancerchat_user_id_315bdff9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `echohealth_oralcancerchat`
--

LOCK TABLES `echohealth_oralcancerchat` WRITE;
/*!40000 ALTER TABLE `echohealth_oralcancerchat` DISABLE KEYS */;
INSERT INTO `echohealth_oralcancerchat` VALUES (1,'What are the early signs of oral cancer?','No response from AI.','2025-08-12 08:56:22.125886',1),(2,'What are the early signs of oral cancer?','It\'s important to remember that only a healthcare professional can diagnose oral cancer. If you notice any of these signs, consult your dentist or doctor promptly. Early detection is key for successful treatment. Here are some of the early signs and symptoms of oral cancer:\n\n**Common Early Signs:**\n\n*   **A sore, ulcer, or lesion in the mouth that doesn\'t heal within 2-3 weeks:** This is one of the most common and concerning signs. It may be painless at first.\n\n*   **A white or red patch (leukoplakia or erythroplakia) on the gums, tongue, tonsils, or lining of the mouth:**\n    *   *Leukoplakia* appears as a thickened, white patch.\n    *   *Erythroplakia* appears as a flat or slightly raised, red patch. Erythroplakia has a higher risk of being precancerous or cancerous than leukoplakia.\n\n*   **A lump or thickening in the cheek, tongue, or other area of the mouth:** You may feel a change in texture or a raised area.\n\n*   **Difficulty chewing, swallowing, speaking, or moving the jaw or tongue:** This can indicate that a growth is affecting the muscles and nerves involved in these functions.\n\n*   **Numbness, pain, or tenderness in the mouth, tongue, or face:** Persistent pain or numbness, especially if unexplained, should be evaluated.\n\n*   **A change in the way your teeth fit together when you close your mouth (malocclusion):** A growth can shift teeth or alter the alignment.\n\n*   **Loose teeth or dentures that no longer fit well:** This can be caused by changes in the bone or tissues supporting the teeth.\n\n*   **Persistent hoarseness or a change in your voice:** This could suggest involvement of the larynx (voice box).\n\n*   **A sore throat or feeling that something is caught in your throat:** If persistent, this should be checked by a healthcare professional.\n\n*   **Swelling in the jaw that causes dentures to fit poorly or become uncomfortable:** This can indicate bone involvement.\n\n*   **Unexplained bleeding in the mouth:** Bleeding not related to trauma or gum disease should be investigated.\n\n*   **Enlarged lymph nodes in the neck:** Swollen lymph nodes that persist for more than a few weeks, especially if they are hard and fixed in place, can be a sign of cancer spreading.\n\n**Important Considerations:**\n\n*   **Not all of these symptoms mean you have oral cancer.** Many of these symptoms can be caused by other, less serious conditions. However, it\'s crucial to get them checked out by a dentist or doctor to rule out oral cancer.\n*   **Oral cancer can occur anywhere in the mouth.** Pay attention to all areas, including the tongue, gums, cheeks, lips, palate (roof of the mouth), and floor of the mouth (under the tongue).\n*   **Risk Factors:** Certain factors increase your risk of developing oral cancer, including:\n    *   **Tobacco use (smoking or smokeless tobacco)**\n    *   **Excessive alcohol consumption**\n    *   **Human papillomavirus (HPV) infection (especially HPV-16)**\n    *   **Sun exposure to the lips**\n    *   **A weakened immune system**\n    *   **Family history of oral cancer**\n\n**What to Do If You Notice Something:**\n\n1.  **Don\'t panic:** Many of the symptoms listed above can be caused by other conditions.\n2.  **Schedule an appointment with your dentist or doctor:** Explain your concerns and describe the symptoms you\'re experiencing.\n3.  **Be prepared to answer questions:** Your healthcare provider will ask about your medical history, lifestyle habits (tobacco and alcohol use), and the details of your symptoms.\n4.  **Follow your healthcare provider\'s recommendations:** This may include a visual examination, palpation (feeling for lumps), biopsies (taking a tissue sample for testing), and imaging tests.\n\n**Regular dental checkups are crucial for early detection.** Your dentist can often detect early signs of oral cancer during a routine examination, even before you notice any symptoms. They are trained to recognize suspicious areas and can recommend further evaluation if needed.\n\n***Disclaimer:*** *This information is intended for general knowledge and informational purposes only, and does not constitute medical advice. It is essential to consult with a qualified healthcare professional for any health concerns or before making any decisions related to your health or treatment.*\n','2025-08-12 09:16:30.513247',1),(3,'hi?','Hi there! How can I help you today?\n','2025-08-12 09:17:07.856192',1),(4,'what are the synpotomus for oral cancer i need to avoid?','Okay, let\'s discuss the symptoms of oral cancer that you should be aware of. It\'s important to remember that experiencing one or more of these symptoms doesn\'t automatically mean you have oral cancer. Many other conditions can cause similar symptoms. However, if you notice any of these, especially if they persist for more than two weeks, it\'s crucial to see a doctor or dentist for a proper evaluation. Early detection is key to successful treatment.\n\nHere are some of the key symptoms to watch out for:\n\n**Common and Persistent Symptoms:**\n\n*   **A sore, ulcer, or lesion in the mouth that doesn\'t heal:** This is one of the most common and concerning signs. It might look like a canker sore but lasts much longer (more than 2 weeks) and may bleed easily.\n*   **A white or red patch on the gums, tongue, tonsil, or lining of the mouth:** These patches, called leukoplakia (white) or erythroplakia (red), can be precancerous or cancerous. Red patches are generally considered to have a higher risk of being cancerous.\n*   **A lump or thickening in the cheek or neck:** You might feel a raised area or a hardening of the tissue.\n*   **Difficulty chewing or swallowing:** This can be due to pain, a growth, or changes in the mouth\'s structure.\n*   **Difficulty speaking:** Changes in your voice or slurred speech can occur if the cancer affects the tongue or other oral structures.\n*   **Numbness in the mouth or tongue:** A loss of sensation or tingling in any part of the mouth is a concerning symptom.\n*   **Pain in the mouth or ear that doesn\'t go away:** Persistent pain, especially if it\'s localized, should be checked out.\n*   **Loose teeth or dentures that no longer fit well:** This could indicate that the cancer is affecting the bone supporting the teeth.\n*   **A change in the way your teeth fit together when you close your mouth:** This is a sign that something is altering the structure of your mouth.\n\n**Less Common Symptoms (But Still Important):**\n\n*   **Unexplained bleeding in the mouth:** Bleeding that isn\'t related to trauma or gum disease should be investigated.\n*   **Chronic sore throat or hoarseness:** While often caused by other things, persistent throat issues can sometimes be a sign of oral cancer, particularly if it\'s located in the back of the mouth or throat.\n*   **Significant weight loss:** Unexplained weight loss can be a sign of many cancers, including oral cancer.\n*   **Swelling of the jaw:** Swelling can indicate that the cancer has spread to the bone.\n\n**Important Considerations:**\n\n*   **Location:** Oral cancer can occur in various locations, including the tongue, lips, gums, inner cheeks, the floor of the mouth, the roof of the mouth (palate), and the area behind the wisdom teeth. Be mindful of changes anywhere in these areas.\n*   **Risk Factors:** Certain factors increase your risk of developing oral cancer. These include:\n    *   **Tobacco use:** Smoking cigarettes, cigars, or pipes, as well as using chewing tobacco or snuff, significantly increases your risk.\n    *   **Excessive alcohol consumption:** Heavy drinking is a major risk factor. The risk is even higher when combined with tobacco use.\n    *   **Human papillomavirus (HPV) infection:** Certain strains of HPV, particularly HPV-16, are linked to oral cancers, especially those occurring in the back of the throat (oropharynx).\n    *   **Sun exposure:** Lip cancer is associated with prolonged sun exposure, especially without protection.\n    *   **Weakened immune system:** People with compromised immune systems are at higher risk.\n    *   **Poor nutrition:** A diet lacking in fruits and vegetables may increase your risk.\n    *   **Family history:** Having a family history of oral cancer may slightly increase your risk.\n\n**What to do:**\n\n*   **Regular Dental Checkups:** Your dentist is often the first line of defense in detecting oral cancer. They can perform an oral cancer screening during your routine checkups.\n*   **Self-Exams:** Get into the habit of regularly examining your mouth for any unusual changes. Use a mirror and a good light source. Look for any sores, patches, lumps, or changes in color or texture.\n*   **See a Doctor or Dentist Promptly:** If you notice any of the symptoms described above, especially if they persist for more than two weeks, don\'t delay in seeking professional medical or dental advice. Early diagnosis and treatment are crucial for improving outcomes.\n*   **Lifestyle Changes:** If you use tobacco, quit. Limit your alcohol consumption. Protect your lips from the sun. Maintain a healthy diet.\n\n**In summary:** Be vigilant about any changes in your mouth, and don\'t hesitate to seek professional help if you\'re concerned. Early detection is key to successful treatment. This information is not a substitute for professional medical advice. Always consult with a qualified healthcare provider for any health concerns or before making any decisions related to your health or treatment.\n','2025-08-12 09:17:55.802932',1),(5,'what food can take for oral and exercise?','Okay, let\'s break down the best food choices for oral health and how they can support your exercise routine. There\'s a surprising amount of overlap!\n\n**Foods that Support Oral Health (and Often Exercise Too!)**\n\n*   **High-Fiber Fruits and Vegetables:**\n    *   **Why for Oral Health:** These act as natural \"scrubbers\" for your teeth, helping to remove plaque and food particles. Chewing also stimulates saliva production, which neutralizes acids and helps remineralize enamel.\n    *   **Why for Exercise:** Good sources of complex carbohydrates for sustained energy. Many are also packed with vitamins, minerals, and antioxidants that aid in recovery.\n    *   **Examples:** Apples, carrots, celery, leafy greens (spinach, kale), berries.\n\n*   **Dairy (or Fortified Alternatives):**\n    *   **Why for Oral Health:** Rich in calcium and phosphorus, which are crucial for strong teeth and bones.  Casein (a protein in dairy) also helps protect enamel.\n    *   **Why for Exercise:** Protein for muscle repair and growth. Calcium and Vitamin D are also helpful.\n    *   **Examples:** Milk, yogurt (plain, unsweetened is best), cheese. If you\'re dairy-free, look for calcium-fortified plant-based milks.\n\n*   **Protein (Lean Sources):**\n    *   **Why for Oral Health:** Protein is essential for building and repairing tissues, including those in your gums.\n    *   **Why for Exercise:** Essential for muscle repair and growth after exercise.\n    *   **Examples:** Chicken, fish, lean beef, eggs, beans, lentils, tofu.\n\n*   **Nuts and Seeds:**\n    *   **Why for Oral Health:** Provide protein, minerals, and fiber. Chewing stimulates saliva production.\n    *   **Why for Exercise:** Healthy fats for energy, protein, and various vitamins and minerals.\n    *   **Examples:** Almonds, walnuts, cashews, pumpkin seeds, sunflower seeds.\n\n*   **Water:**\n    *   **Why for Oral Health:** Hydration is key for saliva production. Water also helps rinse away food particles and acids.\n    *   **Why for Exercise:** Essential for hydration, regulating body temperature, and transporting nutrients.\n\n*   **Green Tea:**\n    *   **Why for Oral Health:** Contains antioxidants (catechins) that may help fight bacteria and reduce inflammation in the mouth.\n    *   **Why for Exercise:** Can provide a mild energy boost and antioxidants for recovery.\n\n**Timing Your Food Intake Around Exercise:**\n\n*   **Before Exercise (1-3 hours before):**\n    *   **Focus:**  Carbohydrates for energy, with a moderate amount of protein and healthy fats.\n    *   **Examples:** Oatmeal with berries and nuts, whole-wheat toast with avocado and egg, a banana with peanut butter, a smoothie with fruit, yogurt, and protein powder.\n    *   **Avoid:**  Heavy, greasy foods that can cause stomach upset.\n*   **During Exercise (for longer workouts >60-90 minutes):**\n    *   **Focus:**  Easily digestible carbohydrates to maintain energy levels. Electrolytes to replace those lost through sweat.\n    *   **Examples:**  Sports drinks, energy gels, chews, a small banana.\n*   **After Exercise (within 1-2 hours):**\n    *   **Focus:**  Protein to repair muscle tissue and carbohydrates to replenish glycogen stores.\n    *   **Examples:**  Protein shake with fruit, chicken breast with sweet potato, Greek yogurt with berries and granola, a sandwich with lean meat and vegetables.\n\n**Foods to Limit or Avoid for Oral Health (and Potentially Exercise):**\n\n*   **Sugary Foods and Drinks:**\n    *   **Why:** Sugar feeds bacteria in your mouth, which produce acids that erode enamel and cause cavities.\n    *   **Examples:** Candy, soda, juice, pastries, sweetened cereals.\n    *   **For Exercise:** Avoid sugary drinks or snacks during exercise, because they cause energy crashes.\n*   **Acidic Foods and Drinks:**\n    *   **Why:** Acids can weaken enamel, making it more susceptible to erosion.\n    *   **Examples:** Citrus fruits (lemons, limes, oranges), tomatoes, vinegar, soda, sports drinks.\n    *   **For Exercise:** While citrus fruits have vitamins, consume them in moderation and rinse your mouth with water afterward.\n*   **Sticky Foods:**\n    *   **Why:** These cling to your teeth and provide a longer feeding time for bacteria.\n    *   **Examples:** Gummy candies, caramel, dried fruit (in excess).\n*   **Hard Candies:**\n    *   **Why:** Prolonged exposure to sugar and acid, and the risk of cracking a tooth.\n*   **Processed Foods:**\n   *   **Why:** Generally low in nutrients and can be high in sugar and unhealthy fats.\n   *   **For Exercise:** Offer little nutritional value and can hinder performance.\n\n**Important Considerations:**\n\n*   **Individual Needs:**  Your specific dietary needs will vary based on your activity level, exercise type, goals, and any underlying health conditions. Consult with a registered dietitian or sports nutritionist for personalized advice.\n*   **Listen to Your Body:** Pay attention to how different foods affect you during and after exercise.\n*   **Oral Hygiene Routine:**  Brush your teeth at least twice a day with fluoride toothpaste, floss daily, and visit your dentist regularly.  Consider rinsing your mouth with water after consuming acidic or sugary foods/drinks, especially when you can\'t brush immediately.\n*   **Timing is key:** Don\'t eat right before oral exercise, give it time for your food to digest!\n\nBy choosing nutrient-rich foods, hydrating adequately, and maintaining good oral hygiene, you can support both your oral health and your exercise performance!\n','2025-08-12 09:19:18.439945',1),(6,'hi','Hi there! How can I help you today?\n','2025-08-19 15:15:05.213826',6),(7,'what are the symptoms of oral cancer','Oral cancer, like many cancers, can be subtle in its early stages. It\'s important to be aware of the potential symptoms and to see a dentist or doctor if you notice anything unusual or persistent in your mouth. Here\'s a breakdown of common symptoms:\n\n**Common Symptoms:**\n\n*   **A sore or ulcer in the mouth that doesn\'t heal within 2-3 weeks.** This is one of the most common and concerning symptoms. It might be painful, or it might be painless.\n*   **A white or red patch (leukoplakia or erythroplakia) on the lining of the mouth.** Leukoplakia appears as a thickened, white patch. Erythroplakia is a red, velvety patch and is often more likely to be precancerous or cancerous.\n*   **A lump, thickening, or rough spot in the mouth.** This could be on the tongue, gums, inner cheek, or other area.\n*   **Difficulty chewing, swallowing, speaking, or moving the jaw or tongue.** This can indicate that the cancer is affecting the muscles and nerves involved in these functions.\n*   **Numbness or pain in the mouth, tongue, or jaw.** Unexplained and persistent numbness or pain should be checked out.\n*   **Changes in your voice.** Hoarseness or other voice changes can occur if the cancer is affecting the throat or voice box.\n*   **Loose teeth or dentures that no longer fit well.** This can happen if the cancer is affecting the bone that supports the teeth.\n*   **Swelling in the jaw or neck.** A lump or swelling in the neck can indicate that the cancer has spread to the lymph nodes.\n*   **Chronic sore throat or feeling that something is caught in the throat.**\n*   **Unexplained bleeding in the mouth.**\n\n**Less Common Symptoms:**\n\n*   Ear pain (especially on one side)\n*   Weight loss\n*   Bad breath (halitosis) that doesn\'t go away with regular brushing\n\n**Important Considerations:**\n\n*   **Many of these symptoms can also be caused by other, less serious conditions.** Having one of these symptoms doesn\'t automatically mean you have oral cancer.\n*   **The symptoms can vary depending on the location of the cancer within the mouth.**\n*   **Early detection is crucial for successful treatment.**\n*   **Regular dental checkups are essential for detecting oral cancer early.** Dentists are trained to look for signs of oral cancer during routine exams.\n*   **If you notice any of these symptoms lasting for more than 2-3 weeks, see a dentist or doctor immediately.** Don\'t wait to see if it goes away on its own.\n*   **Risk factors for oral cancer include tobacco use (smoking or smokeless tobacco), excessive alcohol consumption, HPV (human papillomavirus) infection, and sun exposure to the lips.** Reducing these risk factors can help lower your risk.\n\n**What to do if you suspect you have oral cancer:**\n\n1.  **Self-Exam:** Regularly examine your mouth for any of the symptoms listed above.\n2.  **See a Dentist or Doctor:** If you find anything suspicious, schedule an appointment with a dentist or doctor as soon as possible.\n3.  **Biopsy:** If your dentist or doctor suspects oral cancer, they will likely perform a biopsy. This involves taking a small tissue sample from the affected area and examining it under a microscope to check for cancer cells.\n4.  **Follow-Up:** If the biopsy confirms oral cancer, your doctor will discuss treatment options with you.\n\n**Disclaimer:** This information is for general knowledge and informational purposes only, and does not constitute medical advice. It is essential to consult with a qualified healthcare professional for any health concerns or before making any decisions related to your health or treatment.\n','2025-08-19 19:07:59.666824',6),(8,'hi','Hi there! How can I help you today?\n','2025-08-20 14:32:01.775016',6),(9,'hi','Hi there! How can I help you today?\n','2025-08-29 03:35:24.621389',6),(10,'hi','Hi there! How can I help you today?\n','2025-09-09 17:09:41.875531',6),(11,'kamal haasan','Kamal Haasan is a highly celebrated and influential figure in Indian cinema. Here\'s a breakdown of why he\'s so well-regarded:\n\n*   **Actor:** He has acted in films across multiple languages, predominantly Tamil, but also Hindi, Telugu, Malayalam, and Kannada. He\'s known for his versatility and willingness to take on challenging roles.\n*   **Director:** He has directed films like \"Hey Ram,\" \"Virumaandi,\" and \"Vishwaroopam,\" showcasing his storytelling and technical skills.\n*   **Writer:** Kamal Haasan has written screenplays and stories for many of his films, often exploring complex themes and pushing boundaries.\n*   **Producer:** He has produced films under his production company, Raaj Kamal Films International.\n*   **Dancer:** He is a trained classical dancer and incorporates dance into his performances.\n*   **Technician:** He is known for his knowledge of filmmaking technology and has experimented with special effects and innovative techniques.\n*   **Political Figure:** He founded the political party Makkal Needhi Maiam (MNM) and has contested elections.\n*   **Awards and Recognition:** He has received numerous awards, including National Film Awards, Filmfare Awards, and international recognition.\n*   **Impact:** Kamal Haasan is considered a pioneer in Indian cinema, known for his experimentation, dedication to his craft, and intellectual approach to filmmaking.','2025-09-09 17:11:23.474667',6),(12,'hi','Hi there! How can I help you today?\n','2025-09-10 14:05:19.296599',6),(13,'who is kamala hassan','Kamala Harris is the current Vice President of the United States. She assumed office on January 20, 2021.\n\nHere\'s a bit more about her:\n\n*   **Background:** She was born in Oakland, California. Her mother was a breast cancer researcher who immigrated from India, and her father is an economist who immigrated from Jamaica.\n*   **Education:** She attended Howard University and the University of California, Hastings College of the Law.\n*   **Career Before Vice President:** She served as the District Attorney of San Francisco, then as the Attorney General of California, and later as a United States Senator representing California.\n*   **Political Positions:** Generally considered a moderate Democrat, her political positions include support for affordable healthcare, criminal justice reform, and environmental protection.','2025-09-11 10:32:47.836373',6),(14,'kamal hassan','Kamal Haasan is a highly celebrated and influential Indian actor, filmmaker, dancer, writer, producer, playback singer, and politician. Here\'s a breakdown of his key achievements and impact:\n\n**Key Highlights:**\n\n*   **Acting Career:** Haasan is widely regarded as one of the greatest actors in Indian cinema. He is known for his versatility, dedication to his craft, and willingness to experiment with different roles and genres. He has acted in over 230 films in multiple languages including Tamil, Hindi, Telugu, Malayalam, and Kannada.\n\n*   **Film Production and Direction:** He has produced and directed several critically acclaimed and commercially successful films under his production company, Raaj Kamal Films International.\n\n*   **Writing and Screenwriting:** Haasan is a prolific writer and has written the screenplays for many of his films. His writing often explores complex themes and challenges societal norms.\n\n*   **Technical Expertise:** He\'s known for his pioneering efforts in bringing advanced filmmaking techniques to Indian cinema, including makeup, special effects, and sound technology.\n\n*   **Political Career:** In 2018, Haasan launched his own political party, Makkal Needhi Maiam (MNM), with a focus on good governance, anti-corruption, and social justice.\n\n**Significant Achievements and Recognition:**\n\n*   **National Film Awards:** He has won four National Film Awards for Best Actor (one of the highest honors in Indian cinema).\n*   **Filmfare Awards:** He has won a record 19 Filmfare Awards.\n*   **Padma Bhushan:** He was awarded the Padma Bhushan, one of India\'s highest civilian honors, by the Government of India.\n*   **Chevalier de l\'Ordre des Arts et des Lettres:** He was awarded the Chevalier de l\'Ordre des Arts et des Lettres by the French Government.\n\n**Notable Films:**\n\n*   **Nayagan (1987):** Inspired by *The Godfather*, this film is considered a classic of Indian cinema.\n*   **Anbe Sivam (2003):** A film exploring philosophical themes of love and service.\n*   **Indian (1996):** A vigilante action film where he played dual roles.\n*   **Dasavatharam (2008):** Haasan played ten different roles in this science fiction action film.\n*   **Vikram (2022):** A recent blockbuster action thriller.\n*   **Apoorva Sagodharargal (1989):** This film is notable for Kamal Haasan\'s portrayal of a dwarf character.\n\n**Impact and Legacy:**\n\nKamal Haasan has had a profound impact on Indian cinema and culture. He is admired for his artistic integrity, his commitment to social causes, and his willingness to push boundaries. He is a role model for aspiring actors and filmmakers and continues to be a major force in the Indian entertainment industry.\n\nIf you have any specific questions about Kamal Haasan, feel free to ask!\n','2025-09-11 10:33:14.070104',6),(15,'what is oral cancer','Oral cancer is a type of head and neck cancer that occurs when cells in the mouth (oral cavity) develop mutations that cause them to grow and divide uncontrollably. These cancerous cells can form a tumor, damage nearby tissues, and spread to other parts of the body.\n\nHere\'s a breakdown of key aspects of oral cancer:\n\n**Where it occurs:** Oral cancer can develop in several areas of the mouth:\n\n*   **Lips:**  Often on the lower lip, due to sun exposure.\n*   **Tongue:** Most commonly on the sides or underside of the tongue.\n*   **Gums:**  Can affect both the upper and lower gums.\n*   **Inner lining of the cheeks (buccal mucosa)**\n*   **Floor of the mouth (under the tongue)**\n*   **Hard palate (the bony roof of the mouth)**\n*   **Area behind the molars (retromolar trigone)**\n\n**Types of Oral Cancer:** The most common type of oral cancer is **squamous cell carcinoma**.  This type arises from the flat, scale-like cells (squamous cells) that line the surfaces of the mouth, tongue, and lips.  Less common types include:\n\n*   **Adenocarcinoma:**  Originates in salivary glands.\n*   **Sarcoma:**  Arises in bone, cartilage, or muscle.\n*   **Melanoma:**  Cancer of pigment-producing cells (less common in the mouth, but possible).\n\n**Causes and Risk Factors:**  While the exact cause of oral cancer isn\'t always clear, several factors significantly increase the risk:\n\n*   **Tobacco Use:**  Smoking cigarettes, cigars, pipes, chewing tobacco, and snuff are major risk factors.  The longer and more frequently someone uses tobacco, the greater the risk.\n*   **Excessive Alcohol Consumption:** Heavy alcohol use, especially when combined with tobacco use, dramatically increases the risk.\n*   **Human Papillomavirus (HPV):**  Certain strains of HPV, particularly HPV-16, are strongly linked to oral cancers, especially those occurring in the back of the throat (oropharynx) and tonsils. This type of cancer is often considered separately from \"oral cancer\" and is referred to as oropharyngeal cancer.\n*   **Sun Exposure:**  Prolonged sun exposure to the lips can increase the risk of lip cancer.\n*   **Weakened Immune System:**  People with compromised immune systems (e.g., due to HIV/AIDS, organ transplant medications) are at higher risk.\n*   **Poor Nutrition:**  A diet low in fruits and vegetables may increase the risk.\n*   **Previous History of Cancer:**  Having had a previous cancer, especially head and neck cancer, increases the risk of developing oral cancer.\n*   **Age:**  Oral cancer is more common in older adults (over 40), but it can occur at any age.\n*   **Gender:**  Oral cancer is more common in men than women.\n*   **Genetic Predisposition:**  A family history of cancer may slightly increase the risk.\n\n**Symptoms:**  Symptoms of oral cancer can vary depending on the location and stage of the cancer, but some common signs include:\n\n*   **A sore or ulcer in the mouth that doesn\'t heal (lasting more than 2-3 weeks)**\n*   **A white or red patch in the mouth**\n*   **A lump or thickening in the cheek**\n*   **Difficulty chewing, swallowing, or speaking**\n*   **Numbness in the mouth or tongue**\n*   **Pain in the mouth or jaw**\n*   **Loose teeth**\n*   **A change in the way your teeth fit together when you close your mouth**\n*   **Hoarseness or a change in voice**\n*   **Swollen lymph nodes in the neck**\n*   **Unexplained weight loss**\n*   **Earache**\n\n**Diagnosis:**  If oral cancer is suspected, a doctor or dentist will perform a thorough examination, including:\n\n*   **Visual Examination:**  Looking for any abnormalities in the mouth.\n*   **Palpation:**  Feeling for lumps or swellings.\n*   **Biopsy:**  Removing a small tissue sample for microscopic examination to confirm the presence of cancer cells.\n*   **Imaging Tests:**  If cancer is confirmed, imaging tests such as X-rays, CT scans, MRI scans, and PET scans may be used to determine the extent of the cancer and whether it has spread.\n\n**Treatment:**  Treatment options for oral cancer depend on the stage, location, and type of cancer, as well as the individual\'s overall health.  Common treatments include:\n\n*   **Surgery:**  To remove the tumor and surrounding tissue.  This may involve removing parts of the tongue, jaw, or other structures.\n*   **Radiation Therapy:**  Using high-energy rays to kill cancer cells.  It can be used alone or in combination with surgery.\n*   **Chemotherapy:**  Using drugs to kill cancer cells throughout the body. It is often used in combination with surgery and/or radiation therapy, especially for advanced cancers.\n*   **Targeted Therapy:**  Using drugs that target specific molecules involved in cancer cell growth and survival.\n*   **Immunotherapy:**  Using drugs that help the body\'s immune system fight cancer.\n*   **Reconstructive Surgery:**  May be needed to rebuild or restore parts of the mouth and face after surgery.\n\n**Prevention:**  The best way to reduce the risk of oral cancer is to:\n\n*   **Avoid tobacco use:**  Quit smoking and avoid smokeless tobacco.\n*   **Limit alcohol consumption:**  If you drink alcohol, do so in moderation.\n*   **Protect your lips from sun exposure:**  Use lip balm with SPF.\n*   **Get the HPV vaccine:**  If you are eligible, the HPV vaccine can protect against HPV-related oral cancers.\n*   **Maintain good oral hygiene:**  Brush and floss regularly.\n*   **See a dentist regularly:**  For routine checkups and oral cancer screenings.\n*   **Eat a healthy diet:**  Rich in fruits and vegetables.\n*   **Self-exams:**  Regularly examine your mouth for any unusual sores, lumps, or changes.\n\n**Prognosis:**  The prognosis for oral cancer depends on several factors, including the stage of the cancer, the location, and the individual\'s overall health.  Early detection and treatment are crucial for improving the chances of survival.  Oropharyngeal cancers caused by HPV tend to have a better prognosis than those caused by tobacco or alcohol.\n\n**Important Note:**  This information is for general knowledge and informational purposes only, and does not constitute medical advice. It is essential to consult with a qualified healthcare professional for any health concerns or before making any decisions related to your health or treatment. If you notice any unusual changes in your mouth, see a dentist or doctor right away.  Early detection is key for successful treatment.\n','2025-09-11 10:33:55.413995',6),(16,'who is hero of little heart','\"Hero of Little Heart\" likely refers to the character **Boboiboy**.\n\nBoboiboy is the main protagonist of the Malaysian animated series of the same name. He is known for his unique ability to split into seven different elemental forms, each representing a different aspect of nature. He is essentially the \"hero\" of the series and has a good heart and strong sense of justice.\n','2025-09-14 05:46:32.949125',6);
/*!40000 ALTER TABLE `echohealth_oralcancerchat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `echohealth_oralcancerprediction`
--

DROP TABLE IF EXISTS `echohealth_oralcancerprediction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `echohealth_oralcancerprediction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `risk_level` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prediction_percentage` double NOT NULL,
  `mode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `echohealth_oralcancerprediction_user_id_55ee2402_fk_auth_user_id` (`user_id`),
  CONSTRAINT `echohealth_oralcancerprediction_user_id_55ee2402_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `echohealth_oralcancerprediction`
--

LOCK TABLES `echohealth_oralcancerprediction` WRITE;
/*!40000 ALTER TABLE `echohealth_oralcancerprediction` DISABLE KEYS */;
INSERT INTO `echohealth_oralcancerprediction` VALUES (1,'High',100,'symptoms','2025-08-12 07:40:03.947176',1),(2,'High',100,'symptoms','2025-08-12 07:40:24.691161',1),(3,'High',100,'symptoms','2025-08-12 07:41:02.846320',1),(4,'High',100,'symptoms','2025-08-12 07:41:58.206799',1),(5,'Low',100,'symptoms','2025-08-12 07:43:27.054164',1),(6,'Low',78.96,'symptoms','2025-08-12 07:48:10.618436',1),(7,'Low',69.33,'symptoms','2025-08-12 07:48:15.949107',1),(8,'Low',62.98,'symptoms','2025-08-12 07:48:18.767327',1),(9,'Low',76.37,'symptoms','2025-08-12 07:48:20.848477',1),(10,'Low',51.51,'symptoms','2025-08-12 07:48:23.287608',1),(11,'Low',95.62,'symptoms','2025-08-12 07:48:25.307175',1),(12,'Low',76.3,'symptoms','2025-08-12 07:48:27.607702',1),(13,'Low',84.57,'symptoms','2025-08-12 07:48:29.713037',1),(14,'Low',90.11,'symptoms','2025-08-12 07:48:31.723085',1),(15,'Low',50.99,'symptoms','2025-08-12 07:48:34.389451',1),(16,'Low',67.57,'symptoms','2025-08-12 07:48:36.929842',1),(17,'Low',84.65,'symptoms','2025-08-12 07:48:39.372433',1),(18,'Low',75.56,'symptoms','2025-08-12 07:48:41.623441',1),(19,'Low',93.05,'symptoms','2025-08-12 07:48:43.711106',1),(20,'Low',57.92,'symptoms','2025-08-12 07:48:47.041563',1),(21,'Low',64.29,'symptoms','2025-08-12 07:48:49.050906',1),(22,'Low',31.21,'symptoms','2025-08-12 07:50:53.518179',1),(23,'Moderate',78.63,'symptoms','2025-08-12 07:50:57.504129',1),(24,'High',80.77,'symptoms','2025-09-09 08:26:41.576350',6),(25,'High',96.72,'symptoms','2025-09-09 08:42:07.109875',6),(26,'High',89.29,'symptoms','2025-09-09 08:47:26.041639',6),(27,'Moderate',43.59,'symptoms','2025-09-09 11:43:29.358228',6),(28,'Low',25.42,'symptoms','2025-09-09 13:05:40.526536',6),(29,'Moderate',79.49,'symptoms','2025-09-09 13:13:44.472459',6),(30,'High',90.46,'symptoms','2025-09-09 13:19:12.960526',6),(31,'High',95.18,'symptoms','2025-09-09 13:21:11.391947',6),(32,'Moderate',42.01,'symptoms','2025-09-09 13:42:48.816673',6),(33,'Low',33.85,'symptoms','2025-09-09 13:43:14.973720',6),(34,'Low',39.77,'symptoms','2025-09-09 13:59:14.512372',6),(35,'Moderate',67.7,'symptoms','2025-09-09 14:06:02.226741',6),(36,'Low',38.58,'symptoms','2025-09-09 14:13:07.462048',6),(37,'High',82.36,'symptoms','2025-09-09 14:17:22.665024',6),(38,'Moderate',64.67,'symptoms','2025-09-09 14:26:04.804001',6),(39,'High',95.4,'symptoms','2025-09-09 14:26:35.068858',6),(40,'Moderate',59.85,'symptoms','2025-09-09 14:35:00.103070',6),(41,'Low',24.73,'symptoms','2025-09-09 14:42:13.154903',6),(42,'High',94.79,'symptoms','2025-09-09 15:01:48.705151',6),(43,'High',87.51,'symptoms','2025-09-09 15:18:11.438479',6),(44,'Moderate',63.83,'symptoms','2025-09-09 15:20:56.524856',6),(45,'Moderate',40.04,'symptoms','2025-09-09 16:54:14.310498',6),(46,'Moderate',42.27,'symptoms','2025-09-09 16:54:46.089316',6),(47,'Moderate',41.16,'symptoms','2025-09-09 17:05:19.208258',6),(48,'Low',33.56,'symptoms','2025-09-09 17:09:09.336114',6),(49,'Moderate',77.64,'symptoms','2025-09-10 14:04:20.836137',6),(50,'Moderate',76.41,'symptoms','2025-09-10 14:13:18.601094',6),(51,'Low',32.63,'symptoms','2025-09-10 14:22:16.319099',6),(52,'High',90.15,'symptoms','2025-09-10 14:46:32.503809',6),(53,'Moderate',69,'symptoms','2025-09-10 14:52:54.668043',6),(54,'High',80.49,'symptoms','2025-09-10 14:58:52.634835',6),(55,'Moderate',59.56,'symptoms','2025-09-10 15:13:09.952049',6),(56,'Low',27.36,'symptoms','2025-09-10 15:24:43.301342',6),(57,'Moderate',55.23,'symptoms','2025-09-10 15:33:10.421916',6),(58,'High',86.6,'symptoms','2025-09-10 15:37:25.418668',6),(59,'Moderate',63.26,'symptoms','2025-09-10 15:56:41.462832',6),(60,'High',88.68,'symptoms','2025-09-10 16:04:26.328566',6),(61,'High',91.49,'symptoms','2025-09-10 16:35:58.937944',6),(62,'Moderate',49.71,'symptoms','2025-09-10 16:40:46.162989',6),(63,'Moderate',42.74,'symptoms','2025-09-10 16:46:24.114846',6),(64,'Moderate',59.71,'symptoms','2025-09-10 16:50:45.928198',6),(65,'Moderate',68.75,'symptoms','2025-09-10 16:55:03.819654',6),(66,'High',96.68,'symptoms','2025-09-11 09:24:53.800628',6),(67,'Low',30.46,'symptoms','2025-09-11 10:30:02.227077',6),(68,'Low',25.73,'symptoms','2025-09-13 14:33:47.783649',6);
/*!40000 ALTER TABLE `echohealth_oralcancerprediction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `echohealth_passwordresetotp`
--

DROP TABLE IF EXISTS `echohealth_passwordresetotp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `echohealth_passwordresetotp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `echohealth_passwordresetotp`
--

LOCK TABLES `echohealth_passwordresetotp` WRITE;
/*!40000 ALTER TABLE `echohealth_passwordresetotp` DISABLE KEYS */;
INSERT INTO `echohealth_passwordresetotp` VALUES (13,'bandipottigarinaveen5098.sse@saveetha.com','242683','2025-08-19 04:09:54.135871'),(19,'charankumarreddy2306@gmail.com','593459','2025-08-19 04:52:33.863423'),(99,'bandipottigarinaveen@gmail.com','295934','2025-08-21 03:57:30.010242'),(102,'sunkaraudaykumar9@gmail.com','564012','2025-08-21 05:31:31.469895');
/*!40000 ALTER TABLE `echohealth_passwordresetotp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `echohealth_userprofile`
--

DROP TABLE IF EXISTS `echohealth_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `echohealth_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `echohealth_userprofile_user_id_447ad9ee_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `echohealth_userprofile`
--

LOCK TABLES `echohealth_userprofile` WRITE;
/*!40000 ALTER TABLE `echohealth_userprofile` DISABLE KEYS */;
INSERT INTO `echohealth_userprofile` VALUES (1,'naveen kumar','1995-05-20','+91 8790658772','profile_photos/logo.png',1),(2,'naveen kumara','1995-05-22','+91 8688431308','profile_photos/logo_gCqAwfK.png',2),(3,'naveen kumara','1995-05-28','+91 8688431309','profile_photos/logo_WL38K9h.png',6);
/*!40000 ALTER TABLE `echohealth_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-16  9:16:57
