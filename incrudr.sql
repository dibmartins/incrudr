CREATE DATABASE  IF NOT EXISTS `incrudr` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `incrudr`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: incrudr
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `inc_actions`
--

DROP TABLE IF EXISTS `inc_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inc_actions` (
  `act_id` int(10) NOT NULL AUTO_INCREMENT,
  `mse_id` int(10) unsigned NOT NULL,
  `act_name` varchar(50) NOT NULL,
  `act_description` varchar(50) NOT NULL,
  PRIMARY KEY (`act_id`),
  UNIQUE KEY `per_id_UNIQUE` (`act_id`),
  KEY `fk_inc_actions_inc_modules_sections1_idx` (`mse_id`),
  CONSTRAINT `fk_inc_actions_inc_modules_sections1` FOREIGN KEY (`mse_id`) REFERENCES `inc_sections` (`mse_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inc_actions`
--

LOCK TABLES `inc_actions` WRITE;
/*!40000 ALTER TABLE `inc_actions` DISABLE KEYS */;
INSERT INTO `inc_actions` VALUES (1,1,'cadastrar','Cadastrar'),(2,1,'editar','Editar'),(3,1,'excluir','Excluir'),(4,1,'visualizar','Visualizar');
/*!40000 ALTER TABLE `inc_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inc_branches`
--

DROP TABLE IF EXISTS `inc_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inc_branches` (
  `bra_id` int(11) NOT NULL AUTO_INCREMENT,
  `bra_description` varchar(50) NOT NULL,
  `bra_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bra_id`),
  UNIQUE KEY `bra_id_UNIQUE` (`bra_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inc_branches`
--

LOCK TABLES `inc_branches` WRITE;
/*!40000 ALTER TABLE `inc_branches` DISABLE KEYS */;
INSERT INTO `inc_branches` VALUES (1,'Matriz','2014-07-22 00:40:10');
/*!40000 ALTER TABLE `inc_branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inc_modules`
--

DROP TABLE IF EXISTS `inc_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inc_modules` (
  `mod_id` int(10) NOT NULL AUTO_INCREMENT,
  `mod_name` varchar(30) NOT NULL,
  `mod_description` varchar(50) NOT NULL,
  PRIMARY KEY (`mod_id`),
  UNIQUE KEY `mod_id_UNIQUE` (`mod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inc_modules`
--

LOCK TABLES `inc_modules` WRITE;
/*!40000 ALTER TABLE `inc_modules` DISABLE KEYS */;
INSERT INTO `inc_modules` VALUES (1,'cadastros','Cadastros');
/*!40000 ALTER TABLE `inc_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inc_preferences`
--

DROP TABLE IF EXISTS `inc_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inc_preferences` (
  `pre_id` int(10) NOT NULL,
  `mse_id` int(10) unsigned NOT NULL,
  `pre_label` varchar(100) NOT NULL,
  `pre_mask` varchar(100) DEFAULT NULL,
  `pre_tooltip` varchar(255) NOT NULL,
  `pre_formid` varchar(50) NOT NULL,
  `pre_global` tinyint(1) NOT NULL,
  `pre_required` tinyint(1) NOT NULL,
  `pre_editable` tinyint(1) NOT NULL,
  `pre_visible` tinyint(1) NOT NULL,
  `pre_type` enum('text','textarea','number','select','date','datetime','time','radio','check','email','password') NOT NULL,
  `pre_order` tinyint(20) DEFAULT NULL,
  `pre_option_values` varchar(255) DEFAULT NULL,
  `pre_default_value` varchar(255) DEFAULT NULL,
  `pre_max_characters` int(5) DEFAULT NULL,
  PRIMARY KEY (`pre_id`),
  KEY `fk_inc_preferences_inc_modules_sections1_idx` (`mse_id`),
  CONSTRAINT `fk_inc_preferences_inc_modules_sections1` FOREIGN KEY (`mse_id`) REFERENCES `inc_sections` (`mse_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inc_preferences`
--

LOCK TABLES `inc_preferences` WRITE;
/*!40000 ALTER TABLE `inc_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `inc_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inc_profiles`
--

DROP TABLE IF EXISTS `inc_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inc_profiles` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(30) NOT NULL,
  `pro_description` varchar(50) NOT NULL,
  `pro_weight` int(5) NOT NULL,
  `pro_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pro_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pro_id`),
  UNIQUE KEY `pro_id_UNIQUE` (`pro_id`),
  UNIQUE KEY `pro_name_UNIQUE` (`pro_name`),
  UNIQUE KEY `pro_description_UNIQUE` (`pro_description`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inc_profiles`
--

LOCK TABLES `inc_profiles` WRITE;
/*!40000 ALTER TABLE `inc_profiles` DISABLE KEYS */;
INSERT INTO `inc_profiles` VALUES (1,'administradores','Administradores',1000,'2014-07-21 23:42:32','2014-07-21 23:42:32'),(2,'gestores','Gestores',999,'2014-07-21 23:43:06','2014-07-21 23:43:06');
/*!40000 ALTER TABLE `inc_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inc_profiles_permissions`
--

DROP TABLE IF EXISTS `inc_profiles_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inc_profiles_permissions` (
  `prp_id` int(10) NOT NULL AUTO_INCREMENT,
  `pro_id` int(10) NOT NULL,
  `act_id` int(10) NOT NULL,
  `bra_id` int(10) NOT NULL,
  `prp_granted_by` int(10) NOT NULL,
  `prp_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`prp_id`),
  UNIQUE KEY `prp_UNIQUE` (`prp_id`),
  KEY `fk_inc_profiles_permissions_inc_profiles1_idx` (`pro_id`),
  KEY `fk_inc_profiles_permissions_inc_users_permissions1_idx` (`act_id`),
  KEY `fk_inc_profiles_permissions_inc_users1_idx` (`prp_granted_by`),
  KEY `fk_inc_profiles_permissions_inc_branches1_idx` (`bra_id`),
  CONSTRAINT `fk_inc_profiles_permissions_inc_branches1` FOREIGN KEY (`bra_id`) REFERENCES `inc_branches` (`bra_id`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_inc_profiles_permissions_inc_profiles1` FOREIGN KEY (`pro_id`) REFERENCES `inc_profiles` (`pro_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_inc_profiles_permissions_inc_users1` FOREIGN KEY (`prp_granted_by`) REFERENCES `inc_users` (`use_id`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_inc_profiles_permissions_inc_users_permissions1` FOREIGN KEY (`act_id`) REFERENCES `inc_actions` (`act_id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inc_profiles_permissions`
--

LOCK TABLES `inc_profiles_permissions` WRITE;
/*!40000 ALTER TABLE `inc_profiles_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `inc_profiles_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inc_sections`
--

DROP TABLE IF EXISTS `inc_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inc_sections` (
  `mse_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mod_id` int(10) NOT NULL,
  `mse_name` varchar(50) NOT NULL,
  `mse_description` varchar(50) NOT NULL,
  PRIMARY KEY (`mse_id`),
  UNIQUE KEY `mse_name_UNIQUE` (`mse_name`),
  UNIQUE KEY `mse_id_UNIQUE` (`mse_id`),
  KEY `fk_inc_modules_sections_inc_modules1_idx` (`mod_id`),
  CONSTRAINT `fk_inc_modules_sections_inc_modules1` FOREIGN KEY (`mod_id`) REFERENCES `inc_modules` (`mod_id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inc_sections`
--

LOCK TABLES `inc_sections` WRITE;
/*!40000 ALTER TABLE `inc_sections` DISABLE KEYS */;
INSERT INTO `inc_sections` VALUES (1,1,'usuarios','Usuários');
/*!40000 ALTER TABLE `inc_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inc_users`
--

DROP TABLE IF EXISTS `inc_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inc_users` (
  `use_id` int(10) NOT NULL AUTO_INCREMENT,
  `use_created_by` int(10) NOT NULL,
  `pro_id` int(10) NOT NULL,
  `use_login` varchar(50) NOT NULL,
  `use_password` varchar(255) NOT NULL,
  `use_name` varchar(50) NOT NULL,
  `use_email` varchar(100) DEFAULT NULL,
  `use_avatar` varchar(255) DEFAULT NULL,
  `use_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `use_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`use_id`),
  UNIQUE KEY `use_id_UNIQUE` (`use_id`),
  KEY `fk_inc_users_inc_profiles_idx` (`pro_id`),
  KEY `fk_inc_users_inc_users1_idx` (`use_created_by`),
  CONSTRAINT `fk_inc_users_inc_profiles` FOREIGN KEY (`pro_id`) REFERENCES `inc_profiles` (`pro_id`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_inc_users_inc_users1` FOREIGN KEY (`use_created_by`) REFERENCES `inc_users` (`use_id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inc_users`
--

LOCK TABLES `inc_users` WRITE;
/*!40000 ALTER TABLE `inc_users` DISABLE KEYS */;
INSERT INTO `inc_users` VALUES (1,1,1,'admin','6367c48dd193d56ea7b0baad25b19455e529f5ee','Diego Botelho',NULL,NULL,'2014-07-22 00:50:22','2014-07-22 00:50:22'),(2,1,1,'admin2','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(3,1,1,'admin3','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(4,1,1,'admin4','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(5,1,1,'admin5','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(6,1,1,'admin6','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(7,1,1,'admin7','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(8,1,1,'admin8','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(9,1,1,'admin9','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(10,1,1,'admin10','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(11,1,1,'admin11','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(12,1,1,'admin12','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(13,1,1,'admin13','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(14,1,1,'admin14','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(15,1,1,'admin15','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(16,1,1,'admin16','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(17,1,1,'admin17','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(18,1,1,'admin18','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(19,1,1,'admin19','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(20,1,1,'admin20','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(21,1,1,'admin21','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(22,1,1,'admin22','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(23,1,1,'admin23','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(24,1,1,'admin24','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(25,1,1,'admin25','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(26,1,1,'admin26','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(27,1,1,'admin27','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(28,1,1,'admin28','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(29,1,1,'admin29','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(30,1,1,'admin30','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(31,1,1,'admin31','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(32,1,1,'admin32','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(33,1,1,'admin33','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(34,1,1,'admin34','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(35,1,1,'admin35','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 01:54:47','2014-10-02 01:54:47'),(36,1,1,'admin36','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(37,1,1,'admin37','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(38,1,1,'admin38','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(39,1,1,'admin39','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(40,1,1,'admin40','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(41,1,1,'admin41','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(42,1,1,'admin42','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(43,1,1,'admin43','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(44,1,1,'admin44','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(45,1,1,'admin45','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(46,1,1,'admin46','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(47,1,1,'admin47','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(48,1,1,'admin48','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(49,1,1,'admin49','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(50,1,1,'admin50','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(51,1,1,'admin51','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(52,1,1,'admin52','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(53,1,1,'admin53','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(54,1,1,'admin54','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(55,1,1,'admin55','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(56,1,1,'admin56','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(57,1,1,'admin57','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(58,1,1,'admin58','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(59,1,1,'admin59','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(60,1,1,'admin60','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(61,1,1,'admin61','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(62,1,1,'admin62','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(63,1,1,'admin63','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(64,1,1,'admin64','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(65,1,1,'admin65','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(66,1,1,'admin66','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(67,1,1,'admin67','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(68,1,1,'admin68','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(69,1,1,'admin69','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(70,1,1,'admin70','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(71,1,1,'admin71','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(72,1,1,'admin72','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(73,1,1,'admin73','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(74,1,1,'admin74','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(75,1,1,'admin75','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(76,1,1,'admin76','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(77,1,1,'admin77','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(78,1,1,'admin78','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(79,1,1,'admin79','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(80,1,1,'admin80','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(81,1,1,'admin81','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(82,1,1,'admin82','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(83,1,1,'admin83','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(84,1,1,'admin84','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(85,1,1,'admin85','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(86,1,1,'admin86','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(87,1,1,'admin87','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(88,1,1,'admin88','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(89,1,1,'admin89','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(90,1,1,'admin90','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(91,1,1,'admin91','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(92,1,1,'admin92','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(93,1,1,'admin93','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(94,1,1,'admin94','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(95,1,1,'admin95','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(96,1,1,'admin96','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(97,1,1,'admin97','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(98,1,1,'admin98','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(99,1,1,'admin99','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40'),(100,1,1,'admin100','6367c48dd193d56ea7b0baad25b19455e529f5ee','Joao da Silva',NULL,NULL,'2014-10-02 02:09:40','2014-10-02 02:09:40');
/*!40000 ALTER TABLE `inc_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inc_users_permissions`
--

DROP TABLE IF EXISTS `inc_users_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inc_users_permissions` (
  `upe_id` int(10) NOT NULL AUTO_INCREMENT,
  `use_id` int(10) NOT NULL,
  `act_id` int(10) NOT NULL,
  `bra_id` int(10) NOT NULL,
  `upe_granted_by` int(10) NOT NULL,
  `upe_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`upe_id`),
  UNIQUE KEY `usp_id_UNIQUE` (`upe_id`),
  KEY `fk_inc_users_permissions_inc_users1_idx` (`use_id`),
  KEY `fk_inc_users_permissions_inc_actions1_idx` (`act_id`),
  KEY `fk_inc_users_permissions_inc_users2_idx` (`upe_granted_by`),
  KEY `fk_inc_users_permissions_inc_branches1_idx` (`bra_id`),
  CONSTRAINT `fk_inc_users_permissions_inc_actions1` FOREIGN KEY (`act_id`) REFERENCES `inc_actions` (`act_id`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_inc_users_permissions_inc_branches1` FOREIGN KEY (`bra_id`) REFERENCES `inc_branches` (`bra_id`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_inc_users_permissions_inc_users1` FOREIGN KEY (`use_id`) REFERENCES `inc_users` (`use_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_inc_users_permissions_inc_users2` FOREIGN KEY (`upe_granted_by`) REFERENCES `inc_users` (`use_id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inc_users_permissions`
--

LOCK TABLES `inc_users_permissions` WRITE;
/*!40000 ALTER TABLE `inc_users_permissions` DISABLE KEYS */;
INSERT INTO `inc_users_permissions` VALUES (1,1,1,1,1,'2014-07-22 00:50:51'),(2,1,2,1,1,'2014-07-22 00:50:57'),(3,1,3,1,1,'2014-07-22 00:51:04');
/*!40000 ALTER TABLE `inc_users_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inc_users_preferences`
--

DROP TABLE IF EXISTS `inc_users_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inc_users_preferences` (
  `usp_id` int(10) NOT NULL AUTO_INCREMENT,
  `pre_id` int(10) NOT NULL,
  `use_id` int(10) NOT NULL,
  `usp_value` varchar(255) NOT NULL,
  `usp_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usp_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`usp_id`),
  KEY `fk_inc_users_preferences_inc_preferences1_idx` (`pre_id`),
  KEY `fk_inc_users_preferences_inc_users1_idx` (`use_id`),
  CONSTRAINT `fk_inc_users_preferences_inc_preferences1` FOREIGN KEY (`pre_id`) REFERENCES `inc_preferences` (`pre_id`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_inc_users_preferences_inc_users1` FOREIGN KEY (`use_id`) REFERENCES `inc_users` (`use_id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inc_users_preferences`
--

LOCK TABLES `inc_users_preferences` WRITE;
/*!40000 ALTER TABLE `inc_users_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `inc_users_preferences` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-06 21:33:28
