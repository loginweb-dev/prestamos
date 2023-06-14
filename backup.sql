-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: prestamos
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agent_has_client`
--

DROP TABLE IF EXISTS `agent_has_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_has_client` (
  `id_agent` int NOT NULL,
  `id_client` int NOT NULL,
  `id_wallet` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_has_client`
--

LOCK TABLES `agent_has_client` WRITE;
/*!40000 ALTER TABLE `agent_has_client` DISABLE KEYS */;
INSERT INTO `agent_has_client` VALUES (3,5,1),(7,9,3);
/*!40000 ALTER TABLE `agent_has_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_has_supervisor`
--

DROP TABLE IF EXISTS `agent_has_supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_has_supervisor` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_user_agent` int DEFAULT NULL,
  `id_supervisor` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `base` double(8,2) DEFAULT '0.00',
  `id_wallet` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_has_supervisor`
--

LOCK TABLES `agent_has_supervisor` WRITE;
/*!40000 ALTER TABLE `agent_has_supervisor` DISABLE KEYS */;
INSERT INTO `agent_has_supervisor` VALUES (1,3,2,NULL,100000.00,1),(2,7,6,'2023-06-04 18:22:39',10000.00,3),(3,8,6,'2023-06-04 18:25:18',0.00,4);
/*!40000 ALTER TABLE `agent_has_supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `id_agent` int DEFAULT NULL,
  `amount` double(8,2) DEFAULT '0.00',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_wallet` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `close_day`
--

DROP TABLE IF EXISTS `close_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `close_day` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_agent` int DEFAULT NULL,
  `id_supervisor` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `base_before` double(8,2) DEFAULT NULL,
  `from_number` double(8,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `close_day`
--

LOCK TABLES `close_day` WRITE;
/*!40000 ALTER TABLE `close_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `close_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countrys`
--

DROP TABLE IF EXISTS `countrys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countrys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countrys`
--

LOCK TABLES `countrys` WRITE;
/*!40000 ALTER TABLE `countrys` DISABLE KEYS */;
INSERT INTO `countrys` VALUES (1,'Bolivia');
/*!40000 ALTER TABLE `countrys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit`
--

DROP TABLE IF EXISTS `credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `amount_neto` double(8,2) DEFAULT '0.00',
  `order_list` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `id_agent` int DEFAULT NULL,
  `payment_number` int DEFAULT NULL,
  `utility` double(8,2) DEFAULT NULL,
  `status` enum('close','inprogress') COLLATE utf8mb4_unicode_ci DEFAULT 'inprogress',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit`
--

LOCK TABLES `credit` WRITE;
/*!40000 ALTER TABLE `credit` DISABLE KEYS */;
INSERT INTO `credit` VALUES (1,7000.00,1,5,3,16,0.05,'inprogress','2023-06-01 15:28:45',NULL),(2,2000.00,2,9,7,6,0.03,'inprogress','2023-06-04 20:36:52',NULL);
/*!40000 ALTER TABLE `credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_bill`
--

DROP TABLE IF EXISTS `list_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_bill` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '	',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_bill`
--

LOCK TABLES `list_bill` WRITE;
/*!40000 ALTER TABLE `list_bill` DISABLE KEYS */;
INSERT INTO `list_bill` VALUES (1,'Combustible'),(2,'Comida'),(3,'Transporte');
/*!40000 ALTER TABLE `list_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2017_12_03_000000_create_agent_has_supervisor_table',1),(2,'2017_12_03_000001_create_users_table',1),(3,'2017_12_03_000002_create_credit_table',1),(4,'2017_12_03_000003_create_agent_has_client_table',1),(5,'2017_12_03_000004_create_password_resets_table',1),(6,'2017_12_03_000005_create_route_table',1),(7,'2017_12_03_000006_create_migrations_table',1),(8,'2017_12_03_000007_create_summary_table',1),(9,'2017_12_03_000008_create_countrys_table',1),(10,'2017_12_03_000009_create_not_pay_table',1),(11,'2017_12_03_000010_create_users_has_route_table',1),(12,'2017_12_03_000011_create_payment_number_table',1),(13,'2017_12_03_000012_create_close_day_table',1),(14,'2017_12_03_000013_create_bills_table',1),(15,'2017_12_03_000014_create_list_bill_table',1),(16,'2017_12_03_000015_create_wallet_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `not_pay`
--

DROP TABLE IF EXISTS `not_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `not_pay` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `id_credit` int NOT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `not_pay`
--

LOCK TABLES `not_pay` WRITE;
/*!40000 ALTER TABLE `not_pay` DISABLE KEYS */;
INSERT INTO `not_pay` VALUES (1,'2023-06-04 21:06:51',2,9);
/*!40000 ALTER TABLE `not_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_number`
--

DROP TABLE IF EXISTS `payment_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_number` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` int DEFAULT NULL,
  `id_agent` int DEFAULT NULL,
  `selected` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_number`
--

LOCK TABLES `payment_number` WRITE;
/*!40000 ALTER TABLE `payment_number` DISABLE KEYS */;
INSERT INTO `payment_number` VALUES (1,1,NULL,NULL),(2,2,NULL,NULL),(3,3,NULL,NULL),(4,4,NULL,NULL),(5,5,NULL,NULL),(6,6,NULL,NULL),(7,7,NULL,NULL),(8,8,NULL,NULL),(9,9,NULL,NULL),(10,10,NULL,NULL),(11,11,NULL,NULL),(12,12,NULL,NULL),(13,13,NULL,NULL),(14,14,NULL,NULL),(15,15,NULL,NULL),(16,16,NULL,NULL),(17,17,NULL,NULL),(18,18,NULL,NULL),(19,19,NULL,NULL),(20,20,NULL,NULL),(21,21,NULL,NULL),(22,22,NULL,NULL),(23,23,NULL,NULL),(24,24,NULL,NULL),(25,25,NULL,NULL),(26,26,NULL,NULL),(27,27,NULL,NULL),(28,28,NULL,NULL),(29,29,NULL,NULL),(30,30,NULL,NULL);
/*!40000 ALTER TABLE `payment_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `country` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summary`
--

DROP TABLE IF EXISTS `summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `amount` double(8,2) DEFAULT NULL,
  `id_agent` int DEFAULT NULL,
  `id_credit` int DEFAULT NULL,
  `number_index` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summary`
--

LOCK TABLES `summary` WRITE;
/*!40000 ALTER TABLE `summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_user` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci DEFAULT 'enabled',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` enum('user','agent','supervisor','admin') COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `province` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nit` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('bad','good') COLLATE utf8mb4_unicode_ci DEFAULT 'good',
  `lng` text COLLATE utf8mb4_unicode_ci,
  `lat` text COLLATE utf8mb4_unicode_ci,
  `country` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Administrador','admin@admin.com','$2y$10$QMivcQqdpL9mhgJLGRQsyup2oh0CV4QW1Ax/vpTtUI5CdMxAdZRIK','enabled','iaktBMXLObTd8BHQee0qgHnAb2hKlZVZVQoG6NOa8TQltIzbPo5iwA7x4ejF','admin',NULL,NULL,NULL,NULL,NULL,'good',NULL,NULL,NULL,NULL,NULL),(2,'Supervisor','supervisor@supervisor.com','$2y$10$9MUjUeHLho5CyWHYMFvOjOFeKu0BbdftoGo7FwO3atnYYDUcDjjZ2','enabled',NULL,'supervisor',NULL,NULL,NULL,NULL,NULL,'good',NULL,NULL,NULL,NULL,NULL),(3,'Agente','agente@agente.com','$2y$10$sk7RBGPSeyi5NY7lmP8JD.AXimb3rJioOnYq8SNvw1QvyVr.dMn6S','enabled',NULL,'agent',NULL,NULL,NULL,NULL,NULL,'good',NULL,NULL,NULL,NULL,NULL),(4,'CARLOS MENDOZA','CHISI','$2y$10$utVXdUBmx8LB2LiptCX6t.xO78zq38gZG.Ba6jNeIsMCL1vFLdO0.','enabled',NULL,'agent',NULL,NULL,NULL,NULL,NULL,'good',NULL,NULL,NULL,NULL,NULL),(5,'PERCY','56190169','eMYQc','enabled',NULL,'user','ALVAREZ','CALLE X','POMPEYA','71130523','56190169','good',NULL,NULL,NULL,NULL,NULL),(6,'percy alvarez','percy.alvarez@gmail.com','$2y$10$rpe7Hv.tptepFEEjLUwJMuTDZC1XtgFsJdSz6RU3rhisZCIxIp73.','enabled',NULL,'supervisor',NULL,NULL,NULL,NULL,NULL,'good',NULL,NULL,NULL,NULL,NULL),(7,'agente 1','agente1@gmail.com','$2y$10$eWrGqhRhiobTKGNg83tRcORt6qXNHcYmdoM/4OJ.eP3U9URX2b.QG','enabled',NULL,'agent',NULL,'trinidad',NULL,NULL,NULL,'good',NULL,NULL,'Bolivia',NULL,'2023-06-04 18:22:39'),(8,'agente 2','agente2@gmail.com','$2y$10$y2XkLedQeONH0adYldSL/exzyWKys/cO0hqf6BIG23o1DcOIvNp7u','enabled',NULL,'agent',NULL,'trinidad',NULL,NULL,NULL,'good',NULL,NULL,'Bolivia',NULL,'2023-06-04 18:25:18'),(9,'LUIS','5619016','iM1Cd','enabled',NULL,'user','FLORES','CALLE DE PRUEBA',NULL,'72823861','5619016','good',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_has_route`
--

DROP TABLE IF EXISTS `users_has_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_has_route` (
  `route_id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_has_supervisor_id` int NOT NULL,
  PRIMARY KEY (`route_id`),
  KEY `fk_users_has_route_agent_has_supervisor1_idx` (`agent_has_supervisor_id`),
  KEY `fk_users_has_route_route1_idx` (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_has_route`
--

LOCK TABLES `users_has_route` WRITE;
/*!40000 ALTER TABLE `users_has_route` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_has_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `country` int DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
INSERT INTO `wallet` VALUES (1,'Caja principal',NULL,1,'Madrid'),(2,'YAMIL MONTES','2023-05-31 17:18:21',1,'TRINIDAD'),(3,'cartera de prueba','2023-06-04 18:22:24',1,'trinidad'),(4,'cartera de prueba 2','2023-06-04 18:25:08',1,'trinidad');
/*!40000 ALTER TABLE `wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'prestamos'
--

--
-- Dumping routines for database 'prestamos'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-14 22:25:27
