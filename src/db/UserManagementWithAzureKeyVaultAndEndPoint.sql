-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: usermanagement
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Dumping data for table `authorization`
--

LOCK TABLES `authorization` WRITE;
/*!40000 ALTER TABLE `authorization` DISABLE KEYS */;
INSERT INTO `authorization` VALUES (1,2,'PERMITALL'),(2,3,'PERMITALL'),(12,9,'FETCH'),(13,9,'ADMIN'),(14,10,'FETCH'),(15,10,'ADMIN'),(16,11,'ADMIN'),(17,12,'ADMIN'),(20,14,'ADMIN'),(26,17,'USER'),(27,17,'ADMIN'),(30,8,'ADMIN'),(31,8,'FETCH'),(32,16,'ADMIN'),(33,16,'USER'),(34,16,'UPDATE'),(37,7,'ADMIN'),(38,7,'FETCH'),(39,7,'USER'),(40,18,'USER'),(41,18,'ADMIN'),(42,13,'ADMIN'),(43,13,'FETCH'),(44,13,'USER'),(45,6,'ADMIN'),(46,6,'DELETE'),(47,6,'USER'),(48,19,'PERMITALL'),(49,20,'PERMITALL'),(50,22,'PERMITALL'),(51,22,'ADMIN'),(52,23,'PERMITALL'),(53,23,'ADMIN'),(54,24,'PERMITALL'),(55,24,'ADMIN'),(56,25,'PERMITALL'),(57,25,'ADMIN'),(58,26,'PERMITALL'),(59,26,'ADMIN'),(60,27,'PERMITALL'),(61,27,'ADMIN');
/*!40000 ALTER TABLE `authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `endpoints`
--

LOCK TABLES `endpoints` WRITE;
/*!40000 ALTER TABLE `endpoints` DISABLE KEYS */;
INSERT INTO `endpoints` VALUES (2,'/authenticate'),(3,'/addUser'),(6,'/deleteUserById/{userId}'),(7,'/getAllUsers'),(8,'/getUserById/{userId}'),(9,'/getAddressByUserId/{userId}'),(10,'/getAddressByUserIdAndAddressId/{userId}/{addressId}'),(11,'/addNewEndPoint'),(12,'/updateEndPointByEndPointId'),(13,'/getUserByName/{userName}'),(14,'/getAllEndPointDetails'),(15,'/grandPermissions '),(16,'/updateUser'),(17,'/logOut'),(18,'/getCurrentUser'),(19,'/validEmail/{userId}/{email}'),(20,'/validUser/{userId}/{userName}'),(22,'/doctorsOnboarding/SaveAppData'),(23,'/doctorsOnboarding/updateAppData'),(24,'/doctorsOnboarding/getAppData/{recordId}'),(25,'/doctorsOnboarding/getAllAppData'),(26,'/doctorsOnboarding/getAppDataWithUser'),(27,'/doctorsOnboarding/getAppDataWithUser1');
/*!40000 ALTER TABLE `endpoints` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-06 12:05:25
