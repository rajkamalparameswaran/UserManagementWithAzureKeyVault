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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `addressId` int NOT NULL AUTO_INCREMENT,
  `fk_address_userId` int DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`addressId`),
  KEY `fk_address_userId_idx` (`fk_address_userId`),
  CONSTRAINT `fk_address_userId` FOREIGN KEY (`fk_address_userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (5,37,'chennai'),(6,37,'bangalore'),(7,38,'chennai'),(8,38,'bangalore'),(17,36,'dvk'),(18,36,'mdu'),(19,40,'chennai'),(20,41,'chennai'),(31,45,'dvk'),(32,45,'mdu'),(33,48,'chennai'),(35,52,'chennai'),(38,53,'chennai'),(39,54,'Trichy'),(88,57,'chennai'),(91,58,'chennai'),(101,62,'chennai'),(102,63,'chennai'),(103,64,'chennai'),(104,65,'dvk'),(106,67,'trichy'),(107,68,'dvk'),(108,68,'karai'),(109,69,'trichy'),(110,70,'chennai'),(111,71,'dvk'),(112,71,'karai'),(113,72,'dvk'),(114,73,'india'),(117,75,'DVK'),(118,75,'MDU'),(127,66,'dvk'),(128,76,'chennai'),(129,77,'DVK'),(130,78,'DVK'),(138,88,'DVK'),(139,89,'DVK'),(140,90,'DVK'),(141,91,'DVK');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authority` (
  `authorityId` int NOT NULL AUTO_INCREMENT,
  `fk_authority_userId` int DEFAULT NULL,
  `role` varchar(45) DEFAULT 'USER',
  PRIMARY KEY (`authorityId`),
  KEY `fk_authority_userId_idx` (`fk_authority_userId`),
  CONSTRAINT `fk_authority_userId` FOREIGN KEY (`fk_authority_userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `authority_chk_1` CHECK (((`role` = _utf8mb4'USER') or (`role` = _utf8mb4'ADMIN')))
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES (3,37,'ADMIN'),(4,37,'USER'),(5,38,'ADMIN'),(10,36,'ADMIN'),(11,40,'ADMIN'),(12,41,'ADMIN'),(21,45,'ADMIN'),(22,48,'ADMIN'),(24,52,'ADMIN'),(27,53,'ADMIN'),(28,54,'ADMIN'),(56,57,'ADMIN'),(60,58,'ADMIN'),(67,62,'ADMIN'),(68,63,'ADMIN'),(69,64,'ADMIN'),(70,65,'USER'),(72,67,'ADMIN'),(73,68,'USER'),(74,69,'USER'),(75,70,'ADMIN'),(76,71,'ADMIN'),(77,72,'ADMIN'),(78,73,'USER'),(80,75,'USER'),(81,75,'ADMIN'),(93,66,'ADMIN'),(94,66,'USER'),(95,76,'ADMIN'),(96,77,'ADMIN'),(97,78,'ADMIN'),(105,88,'ADMIN'),(106,89,'ADMIN'),(107,90,'ADMIN'),(108,91,'ADMIN');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorization`
--

DROP TABLE IF EXISTS `authorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorization` (
  `authorizationId` int NOT NULL AUTO_INCREMENT,
  `fk_authorization_endPointsId` int NOT NULL,
  `privilege` varchar(45) NOT NULL,
  PRIMARY KEY (`authorizationId`),
  KEY `fk_authorization_endPointsId_idx` (`fk_authorization_endPointsId`),
  CONSTRAINT `fk_authorization_endPointsId` FOREIGN KEY (`fk_authorization_endPointsId`) REFERENCES `endpoints` (`endPointId`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorization`
--

LOCK TABLES `authorization` WRITE;
/*!40000 ALTER TABLE `authorization` DISABLE KEYS */;
INSERT INTO `authorization` VALUES (1,2,'PERMITALL'),(2,3,'PERMITALL'),(12,9,'FETCH'),(13,9,'ADMIN'),(14,10,'FETCH'),(15,10,'ADMIN'),(16,11,'ADMIN'),(17,12,'ADMIN'),(20,14,'ADMIN'),(26,17,'USER'),(27,17,'ADMIN'),(30,8,'ADMIN'),(31,8,'FETCH'),(32,16,'ADMIN'),(33,16,'USER'),(34,16,'UPDATE'),(37,7,'ADMIN'),(38,7,'FETCH'),(39,7,'USER'),(40,18,'USER'),(41,18,'ADMIN'),(42,13,'ADMIN'),(43,13,'FETCH'),(44,13,'USER'),(45,6,'ADMIN'),(46,6,'DELETE'),(47,6,'USER'),(48,19,'PERMITALL'),(49,20,'PERMITALL'),(50,22,'PERMITALL'),(51,22,'ADMIN'),(52,23,'PERMITALL'),(53,23,'ADMIN'),(54,24,'PERMITALL'),(55,24,'ADMIN'),(56,25,'PERMITALL'),(57,25,'ADMIN'),(58,26,'PERMITALL'),(59,26,'ADMIN'),(60,27,'PERMITALL'),(61,27,'ADMIN');
/*!40000 ALTER TABLE `authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctorsonboarding`
--

DROP TABLE IF EXISTS `doctorsonboarding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctorsonboarding` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recordId` varchar(255) NOT NULL,
  `doctorName` varchar(255) NOT NULL,
  `mobileNumber` longtext NOT NULL,
  `emailId` longtext,
  `panNumber` longtext,
  `salary` longtext,
  `tdsPercentage` longtext,
  `accountNumber` longtext,
  `updatedBy` varchar(255) DEFAULT NULL,
  `updatedOn` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recordId` (`recordId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctorsonboarding`
--

LOCK TABLES `doctorsonboarding` WRITE;
/*!40000 ALTER TABLE `doctorsonboarding` DISABLE KEYS */;
INSERT INTO `doctorsonboarding` VALUES (1,'REC1234','Dr. John Doe1','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','kaml1234','2024-11-17 21:19:20');
/*!40000 ALTER TABLE `doctorsonboarding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endpoints`
--

DROP TABLE IF EXISTS `endpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endpoints` (
  `endPointId` int NOT NULL AUTO_INCREMENT,
  `endpointName` varchar(100) NOT NULL,
  PRIMARY KEY (`endPointId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endpoints`
--

LOCK TABLES `endpoints` WRITE;
/*!40000 ALTER TABLE `endpoints` DISABLE KEYS */;
INSERT INTO `endpoints` VALUES (2,'/authenticate'),(3,'/addUser'),(6,'/deleteUserById/{userId}'),(7,'/getAllUsers'),(8,'/getUserById/{userId}'),(9,'/getAddressByUserId/{userId}'),(10,'/getAddressByUserIdAndAddressId/{userId}/{addressId}'),(11,'/addNewEndPoint'),(12,'/updateEndPointByEndPointId'),(13,'/getUserByName/{userName}'),(14,'/getAllEndPointDetails'),(15,'/grandPermissions '),(16,'/updateUser'),(17,'/logOut'),(18,'/getCurrentUser'),(19,'/validEmail/{userId}/{email}'),(20,'/validUser/{userId}/{userName}'),(22,'/doctorsOnboarding/SaveAppData'),(23,'/doctorsOnboarding/updateAppData'),(24,'/doctorsOnboarding/getAppData/{recordId}'),(25,'/doctorsOnboarding/getAllAppData'),(26,'/doctorsOnboarding/getAppDataWithUser'),(27,'/doctorsOnboarding/getAppDataWithUser1');
/*!40000 ALTER TABLE `endpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privileges` (
  `privilegesId` int NOT NULL AUTO_INCREMENT,
  `fk_privileges_userId` int NOT NULL,
  `privilege` varchar(45) NOT NULL DEFAULT 'NOACCESS',
  PRIMARY KEY (`privilegesId`),
  KEY `privilege_idx` (`fk_privileges_userId`),
  CONSTRAINT `privilege` FOREIGN KEY (`fk_privileges_userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privileges`
--

LOCK TABLES `privileges` WRITE;
/*!40000 ALTER TABLE `privileges` DISABLE KEYS */;
INSERT INTO `privileges` VALUES (3,37,'NOACCESS'),(4,38,'NOACCESS'),(9,36,'NOACCESS'),(10,40,'NOACCESS'),(11,41,'NOACCESS'),(20,45,'NOACCESS'),(21,48,'NOACCESS'),(23,52,'NOACCESS'),(26,53,'NOACCESS'),(27,54,'NOACCESS'),(55,57,'FETCH'),(56,58,'NOACCESS'),(63,62,'NOACCESS'),(64,63,'NOACCESS'),(65,64,'NOACCESS'),(66,65,'NOACCESS'),(68,67,'NOACCESS'),(69,68,'NOACCESS'),(70,69,'NOACCESS'),(71,70,'NOACCESS'),(72,71,'NOACCESS'),(73,72,'NOACCESS'),(74,73,'NOACCESS'),(76,75,'NOACCESS'),(83,66,'NOACCESS'),(84,76,'NOACCESS'),(85,77,'NOACCESS'),(86,78,'NOACCESS'),(94,88,'NOACCESS'),(95,89,'NOACCESS'),(96,90,'NOACCESS'),(97,91,'NOACCESS');
/*!40000 ALTER TABLE `privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `userFullName` varchar(45) DEFAULT NULL,
  `userEmail` longtext,
  `userPassword` varchar(60) DEFAULT NULL,
  `isAccountNonExpired` tinyint(1) NOT NULL DEFAULT '1',
  `isAccountNonLocked` tinyint(1) NOT NULL DEFAULT '1',
  `isCredentialsNonExpired` tinyint(1) NOT NULL DEFAULT '1',
  `isEnabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userName_UNIQUE` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (36,'karthi','karthiii','karthi@gmail.com','$2a$10$hrZx8CBVwaBJUk378lrE0.H.fhYO8nS15fh41cP.5Orkjj0BYJruW',1,1,1,1),(37,'mani','mani','mani@gmail.com','$2a$10$j45NJeBBjfytgWZV0xbRzOmoHzk3P1jUZFX1HMPD9VFXze1jD2vtC',1,1,1,1),(38,'raja','raja','raja@gmail.com','$2a$10$xy59P2dJgHRZooHiUApOq.Og20j34DqBRTO52eFSAeSLG9V.NRjY2',0,0,0,0),(40,'rani','rani','rani@gmail.com','$2a$10$XZIKwRITp0oiSWUTHpiJ9ugkQIH8bodVRCzYkbNtgrtaQ8qXWOEIO',1,1,1,1),(41,'velu','velu','velu@gmail.com','$2a$10$96UkMFRA8okVkNaHwhiOauTAQH4IvYIUErzTx0KpO4mUNjDYcLBsC',1,1,1,1),(45,'rajkamal','rajkamal','rajkamal@gmail.com','$2a$10$teFWliqEnqFtSOUMkcuHueY4ji4bxpOJGEXW1J/lyCGh2QSOVM6Ou',1,1,1,1),(48,'velu7','velu7','velu7@gmail.com','$2a$10$lE090QdDRTkkZyuJwnYXWu46g/Va/C3STrwgk.FcCxLsvRNyL6l1O',1,1,1,1),(52,'velu9','velu9','velu9@gmail.com','$2a$10$BQg/TeMOikUdUB04xYFEGuGRs88K5Y4Jutb5u4v0EkYDUSwHg.ZGi',1,1,1,1),(53,'velu10','velu10','velu10@gmail.com','$2a$10$xjnQWm0rwucmjmHCavNkde.DP1xjeT2AyfJVb4ilLTUaweVT2GFw6',1,1,1,1),(54,'divya','divyatharani','divya@gmail.com','$2a$10$w7o/X1b7o9kudwTvbQMPxOslc17CkylLWyNqo/tE73te7ZapEKtqC',1,1,1,1),(57,'madhan','manmadhan','madhan@gmail.com','$2a$10$f8x9pUSJDKVbXGai6lnp8ulM5nce0kgvKdBRFqoX52l1veg4R9I/q',1,1,1,1),(58,'paari','paari','paari@gmail.com','$2a$10$Ojd9L/OlM4O9bKN02ltcFehDlSeM0CvnjC3fTIwrgIslSlPJN8pLO',1,1,1,1),(62,'ramnath','ramnath','ram@gmail.com','$2a$10$nn807g7qlJezQx/kjupX.enAa0OSwV1d.9wFEBuxD9ZndDLyJQ5Wa',1,1,1,1),(63,'ramnath1','ramnath1','ram1@gmail.com','$2a$10$AKGdXkXTUSiCPP348Uv.x.SyCykhmHc3i7JBfCAwJj2VxfuswabuW',1,1,1,1),(64,'ramnath2','ramnath2','ram2@gmail.com','$2a$10$BV3A7vK2qPLH3iHm605sreoSN/WUOGbBoTs96BIUVFnUp1rMt4lPu',1,1,1,1),(65,'prapha','prapha','prapa@gmail.com','$2a$10$LccLEormY2cmLooomdaj1.9SoDBs1FEhymi5PNQxoJs/Hbxd3iGu.',1,1,1,1),(66,'kamal','kamal','kamal@gmail.com','$2a$10$35Vo1RM5CVp1LyIxsAnRmeGqYbnKZ5QPy5qJQEB4vH9jN7YQQIKzC',1,1,1,1),(67,'ruba','ruba','ruba@gmail.com','$2a$10$9VagZV4zQr3fPt8os5EmzeoH0YDGw6fvvGKkSEPqEN2jycTnRLV5S',1,1,1,1),(68,'priya','priyaa','priya@gmail.com','$2a$10$M0J/novVsdn2WYF5WZVQC.Ee7s0X23TyUIVrkoashLD.gdIXvnqui',0,0,0,0),(69,'priya1','priya1','priya1@gmail.com','$2a$10$2BJrN8lMM7y5rKZg6Oz.4.BB9dUWsd3tuRVTEILCgJHnVKhe4X9te',1,1,1,1),(70,'master','master','master@gmail.com','$2a$10$YeGB8B5vEolXykWkblAko.aqa983G/wLE60vqLkMILf88MWWiJqxu',1,1,1,1),(71,'shivangi','shivangiii','shivangi@gmail.com','$2a$10$6ZANEm4eLwLJ9YjSrKN1h.A6QWunPHAFftYQlgZm4GZxnGSFkaoiK',1,1,1,1),(72,'maruthu','maruthu','maruthu@gmail.com','$2a$10$mIwSmufMudi1tN8rTfPjOeu2kif7rGxU8WdSfcDNzI/ktDgpaYXQO',1,1,1,1),(73,'phone','phone@gmail.com','phone@gmail.com','$2a$10$F6IZV7C.GNWD1ivdkL65.eKrES2oq1ZT1m7RPH9WSp.gt2GFZ9g/K',1,1,1,1),(75,'pavi','pavithran','pavi@gmail.com','$2a$10$n0BdBK8NuVVP6TtVBUC.pOWRnJ5ZiotDIwBt/RTnhsf2vc7ChoV.S',1,1,1,1),(76,'ramraj','ramnraja','ramraj@gmail.com','$2a$10$.LHfPmse3fpl4rcAFLpSWeiaTooJLq2v0tzyVLfLakDV9Bptqiz5C',1,1,1,1),(77,'Rajkaml','RajkamalParameswaran','rajkamal17bca55@gmail.com','$2a$10$npiaHjcydhpbLQGqLy4dNOUc9CFwnJ.2dQUHQE/ZjIaLT3jj43X/C',1,1,1,1),(78,'Rajkaml1','RajkamalParameswaran1','Eo0yEkwIInV9Fni7IJy7HWOeGRSvMgQkNTwttOqWQ6o=','$2a$10$hfrq5IWi7eXOCyhjvQ4Rs.VHDKD9Zf03gZmuWDQbikH/Y9Wr/poD6',1,1,1,1),(88,'Rajkaml12','RajkamalParameswaran12','je9qWoTAxaUfeAlQXHagbyPQA3kfEJhcK3zVOlBIpMpB7+TrQTbooWDMLooBtdrLaPLfE5cPWjnoEdt9kZWmZvUq/x6H01VGFAtCZn5Uxjij4Sh+e5n2BbPd7qbKm16FlCN6Var7l0cBey14AQ40s3YxZF1kDgPTaTOWZsU1qqh3PLpO+CQUTuAcju4KmAxaXUGtJvwgsqKRxvCR0NLK2Vz7s9mwzGWqErCRg6EScLO46JmSSqzH5GRBUGQE5ChT2vydPA+UGYMg3Hx1Tkt2+TIzwUq/ASZqgOOvNvJwpntzj94UeyTOj7AFDZjxdobFJRnTpXn3WMxraM7T18sfikufO3S2zzRn9Uvgh3hEKiurI2TkPxOB5tFkI4vZ6vAWqOyLHJfA0wibIxEVaM7D2ir+eJkW2Gy9h6Stbvhtfgvpu3QFAmV2pedQ8ppm2gZCDnicoFkNoLXAj+DGH89mq+0/aJQ222wvD1Rg2gpzi7c2fJ7KU5YPK33ksjd/fCrPsKrWXQc/0eb9eVp41FRiNhH0WiTKWSpg15s+xie9EbYLFk/XgtDZoaLkJ9SCEnx72xaW/hVdrVMGp0wud3w5Wa6RLoCDL7FRiD1sFlR620ZVKvrasZm5eUXY9YjNx5JZj1T7zENSqZRkqjvZFM/i2YSnd8wtnonvzW4REXElz3c=','$2a$10$tMKdqGhe8LUciP5fhwHY/.QBCAYbTybyyS4w7yv3CAUv83b.wBv1.',1,1,1,1),(89,'Rajkaml123','RajkamalParameswaran123','rzonNmS02kcdE7SSQOTEeLsB7nixC5NFGUpLx4KQVuL/3Ef44FzB20bq/4IgortA5whj/ziLT0qINPJGA8KnVkwPz73Q5oaOO/nZD+hPpKruNuN8JiEhXI8eaUh4viZBf131g1Vmt+QidhDpqiHdzdl249JyCRm2x92uXYfRKxqr1CufYIf0zJHCHhGG8UkxLiAlupd4Y8TIJiSl0sDs1sMhQRhtnNXn3Cu20zRisK5tvAyQLWHlQvzrVMoqh8kOOCe1ECpKRltnELOK2bkBu3gzlqICDai5hMvHHhwyvVyMsezUNUm9Gp06Yyt+NqaTlwB22o+fgCMW8TQGPFtxNdtthyXZ5dgd8lLQDZIbOTJ/sqUdrtuVDma+dQltUdfKRnru5xJQMoxEsSc6J0/Jeb/SBLjvoMtsWzAbs/O9t/+qWU0TMujbdif+lYL1a2jqBcc8i5ZL+34NTPfz+KGsNhJdU7PFXU8ULsJy9bAgwlhTpPFf87GY121vaAv2c/ZpPCv7U29XI2DtEQRid06fmsz4RgLni5nKQKTwLU4yCqNGcITMh+ApmpNKURc418CJNxt91pO6aGMx+LLmp943OAFfoJRIK7kAPFIoFMM8yBhVymutwGkGsupE4+Zr6YEtZugpVznQketZ3WpIFKVqtM76s7AXaj2MmMPuDmkTk90=','$2a$10$5Eammsi84sSfaWM2Yczbo.Wto41PReuuUa836G3wowgGqLnA/FcvG',1,1,1,1),(90,'kaml1234','RajkamalParameswaran1234','ehZaZNTehU4xfQx9l97x3RxBsm1QyrqgtsR929fJPw7DJUEuLWXMa/g8l11IXdWdkzeo2J80Xks8RDAhB0cwUkFR6yv4fOLP4hLErYud/BdvzH0HknNhoKUHyObi26gC3liFg9YwRXl8lP6dClRjBLjblB2jbGkcT+xj/6wMl9Fo+7QWMeoHO1//1dj0nX5Uo20qAmbZOd6DPs1l+6JXFlGYaXjRcD3h4qReTliTvE6HZsW064ofxIMQv04OuPeUfpel0j0VdKiwrx8M73jDOVCI5aSt58szKylFGEZ4vRWItNRmMAD3S3JW3t8nwthRl+herqdvb3q+hezQ49+dO0mG+W8YNRTPrJIhjHpKnDIYQgSZhvyGo7PCigfjqaZ+vc+qOibqWJkp2YiwA/eWwetI4j05Eh6+yvGrioF3iBGwmDZLLyZaqIODbBoXm7HRDPGnZLGQ4ewHDLhIv5o39HaCkq1wgn4a/zoEoTL2YsEmz1F9RwwmV0Tghz7dri7f8+BVlVtUoxWT5nFCEO2OIPBnawkIaSzCctYc0MW0PMrNy+kRmnieyC20dMUVaQwljeSrpflw0AVBm/zYnf9uLnE6LAzIZcshYGJ8hhNgc68Of2sSDLkAjQUg/jGdmr71Ro61KDL4+jwnTpzHgGhupvfBb7CADKkbTT5wIHneVnQ=','$2a$10$OeUgi8Vs3hn8I7.p8gFMhuJxMA2qG9/RMEntuw17j3owlTNTZs/fO',1,1,1,1),(91,'tapaskumar123','tapaskumar','WqENIG85mYw6+oshA4q6T47RsGc/WXYVqwgqdEIsiH4t30M0s2QCxQ7Jp2PFgTXYwWYf8hx4Ci+7Tu0QE03EbSNvvWlM8mHJnLl3sMcuzkPCxt3LpOyZAEC1LoRN6rN/5OV02b0Sky+PK7fxPWMN+xJCy1NuwqQzo4zLfDkvVBJQ6cmBaKp+xR31cNJtmuMljoec8v7wOvow3DeePeOseWreVp0xlg6AqvgMcLc4nxbDblQ9STDW/xUGoDoExHcQl12CQvNGPMd9OwKVI9YLeMdz1Yg80TXPiX1bRLha3A/GkfKLTe8IZMkyd1kBAZMbFnSrpOmhHuWYBrnHcIraSinHx8P+1w62ZU3aFn1x6Z/QqVBVOlUN5ysR0ThXdBCUZJAjempQluzEBpr87TxMWAyf7fEXipIe7gW2bCJSqaqz7IqUauYbN8hhxIhuek7jx3VzHdTBjwLYXuM3eeDSqbsR8n1ZEy1PIw5kPbD57FbhvbeioNk17fChX4B3H67bCDPKDxOGS5nXsYJxNQI+1sUwPSwPxbh3Zdmq8Sc4hSfywIhQP+A3n6jAgbeZwPRHplR/oKg3Z72ze7QcAW+Hs+XtxC32I5DyMNvy/AUs5YrD5TCCVUJNFdqz40e2VK6yMjrbB1lvlrMVUp9yZnIttQnVzwntjXpp4butF067VBg=','$2a$10$3sGkLHZOW.5LLky9sTRIZuyAPrpQnN9aE7M8zKY5jKoUoq1lt.Bv2',1,1,1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `validtokenlist`
--

DROP TABLE IF EXISTS `validtokenlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `validtokenlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jwt` varchar(300) NOT NULL,
  `issuedTime` datetime NOT NULL,
  `expiredTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jwt_UNIQUE` (`jwt`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `validtokenlist`
--

LOCK TABLES `validtokenlist` WRITE;
/*!40000 ALTER TABLE `validtokenlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `validtokenlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'usermanagement'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `delete_expired_token` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `delete_expired_token` ON SCHEDULE EVERY 1 HOUR STARTS '2023-08-01 11:43:15' ON COMPLETION NOT PRESERVE ENABLE DO begin
declare row_count int default 0;
select count(*) into row_count from validtokenlist where now()>expiredTime ;
if row_count>0 then
delete from validtokenlist where now()>expiredTime;
end if;
end */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'usermanagement'
--
/*!50003 DROP FUNCTION IF EXISTS `getAllEndPoints` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getAllEndPoints`() RETURNS json
    READS SQL DATA
BEGIN
DECLARE ENDPOINTS JSON;
declare continue handler for not found set ENDPOINTS=null;

select json_arrayagg(json_object(
"endPointId",endPointId,
"endPointName",endpointName,
"authorities",authorization.json_authorities
)) into ENDPOINTS from endpoints inner join (select fk_authorization_endPointsId,json_arrayagg(privilege) as json_authorities  from authorization
group by fk_authorization_endPointsId) as authorization on endPointId=fk_authorization_endPointsId;


RETURN ENDPOINTS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getAllPoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getAllPoint`() RETURNS json
    READS SQL DATA
BEGIN
DECLARE ENDPOINTS JSON;
declare continue handler for not found set ENDPOINTS=null;

select json_arrayagg(json_object(
"endPointId",endPointId,
"endPointName",endpointName,
"authorities",authorization.json_authorities
)) into ENDPOINTS from endpoints inner join (select fk_authorization_endPointsId,json_arrayagg(privilege) as json_authorities  from authorization
group by fk_authorization_endPointsId) as authorization on endPointId=fk_authorization_endPointsId;


RETURN ENDPOINTS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getAllPoints` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getAllPoints`() RETURNS json
    READS SQL DATA
BEGIN
DECLARE ENDPOINTS JSON;
declare continue handler for not found set ENDPOINTS=null;

select json_arrayagg(json_object(
"endPointId",endPointId,
"endPointName",endpointName,
"authorities",authorization.json_authorities
)) into ENDPOINTS from endpoints inner join (select fk_authorization_endPointsId,json_arrayagg(privilege) as json_authorities  from authorization
group by fk_authorization_endPointsId) as authorization on endPointId=fk_authorization_endPointsId;


RETURN ENDPOINTS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getAllUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getAllUser`() RETURNS json
    READS SQL DATA
BEGIN
    DECLARE users JSON;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET users=null;

    SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'userId', user.userId,
            'userName', user.userName,
            'userFullName', user.userFullName,
            'userEmail', user.userEmail,
            'userPassword', user.userPassword,
            'accountNonExpired', user.isAccountNonExpired,
            'accountNonLocked', user.isAccountNonLocked,
            'credentialsNonExpired', user.isCredentialsNonExpired,
            'enabled', user.isEnabled,
            'userAddresses', jsonAddresses.addresses,
            'userRoles', jsonRoles.roles,
            'privileges', jsonPrivileges.privileges
        )
    ) into users
    FROM `user`
    INNER JOIN (
        SELECT fk_address_userId, JSON_ARRAYAGG(address) AS addresses
        FROM address
        GROUP BY fk_address_userId
    ) AS jsonAddresses ON `user`.userId = jsonAddresses.fk_address_userId
    INNER JOIN (
        SELECT fk_authority_userId, JSON_ARRAYAGG(role) AS roles
        FROM authority
        GROUP BY fk_authority_userId
    ) AS jsonRoles ON `user`.userId = jsonRoles.fk_authority_userId
    INNER JOIN (
        SELECT fk_privileges_userId, JSON_ARRAYAGG(privilege) AS privileges
        FROM privileges
        GROUP BY fk_privileges_userId
    ) AS jsonPrivileges ON `user`.userId = jsonPrivileges.fk_privileges_userId;

    RETURN users;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getUserById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getUserById`(id INT) RETURNS json
    READS SQL DATA
BEGIN
    DECLARE user JSON;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET user=null;

    SELECT JSON_OBJECT(
        'userId', user.userId,
        'userName', user.userName,
        'userFullName', user.userFullName,
        'userEmail', user.userEmail,
        'userPassword', user.userPassword,
        'accountNonExpired', user.isAccountNonExpired,
        'accountNonLocked', user.isAccountNonLocked,
        'credentialsNonExpired', user.isCredentialsNonExpired,
        'enabled', user.isEnabled,
        'userAddresses', jsonAddresses.addresses,
        'userRoles', jsonRoles.roles,
        'privileges', jsonPrivileges.privileges
    ) INTO user
    FROM `user`
   INNER JOIN (
        SELECT fk_address_userId, JSON_ARRAYAGG(address) AS addresses
        FROM address
        GROUP BY fk_address_userId
    ) AS jsonAddresses ON `user`.userId = jsonAddresses.fk_address_userId
    INNER JOIN (
        SELECT fk_authority_userId, JSON_ARRAYAGG(role) AS roles
        FROM authority
        GROUP BY fk_authority_userId
    ) AS jsonRoles ON `user`.userId = jsonRoles.fk_authority_userId
    INNER JOIN (
        SELECT fk_privileges_userId, JSON_ARRAYAGG(privilege) AS privileges
        FROM privileges
        GROUP BY fk_privileges_userId
    ) AS jsonPrivileges ON `user`.userId = jsonPrivileges.fk_privileges_userId
    WHERE `user`.userId = id;

    RETURN user;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getUserByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getUserByName`(name varchar(25)) RETURNS json
    READS SQL DATA
BEGIN
DECLARE user JSON;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET user=null;
SELECT JSON_OBJECT(
    'userId', user.userId,
    'userName', user.userName,
    'userFullName', user.userFullName,
    'userEmail', user.userEmail,
    'userPassword', user.userPassword,
    'accountNonExpired', user.isAccountNonExpired,
    'accountNonLocked', user.isAccountNonLocked,
    'credentialsNonExpired', user.isCredentialsNonExpired,
    'enabled', user.isEnabled,
    'userAddresses', jsonAddresses.addresses ,
    'userRoles', jsonRoles.roles ,
    'privileges', jsonPrivileges.privileges 
) INTO user
FROM user
INNER JOIN (
    SELECT fk_address_userId, JSON_ARRAYAGG(address) AS addresses
    FROM address
    GROUP BY fk_address_userId
) AS jsonAddresses ON user.userId = jsonAddresses.fk_address_userId
INNER JOIN (
    SELECT fk_authority_userId, JSON_ARRAYAGG(role) AS roles
    FROM authority
    GROUP BY fk_authority_userId
) AS jsonRoles ON user.userId = jsonRoles.fk_authority_userId
INNER JOIN (
    SELECT fk_privileges_userId, JSON_ARRAYAGG(privilege) AS privileges
    FROM privileges
    GROUP BY fk_privileges_userId
) AS jsonPrivileges ON user.userId = jsonPrivileges.fk_privileges_userId and userName=name;
RETURN user;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `new_getUserById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `new_getUserById`(id INT) RETURNS json
    READS SQL DATA
BEGIN
    DECLARE user JSON;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET user=null;

    SELECT JSON_OBJECT(
        'userId', user.userId,
        'userName', user.userName,
        'userFullName', user.userFullName,
        'userEmail', user.userEmail,
        'userPassword', user.userPassword,
        'accountNonExpired', user.isAccountNonExpired,
        'accountNonLocked', user.isAccountNonLocked,
        'credentialsNonExpired', user.isCredentialsNonExpired,
        'enabled', user.isEnabled,
        'userAddresses', jsonAddresses.addresses,
        'userRoles', jsonRoles.roles,
        'privileges', jsonPrivileges.privileges
    ) INTO user
    FROM `user`
   INNER JOIN (
        SELECT fk_address_userId, JSON_ARRAYAGG(address) AS addresses
        FROM address
        GROUP BY fk_address_userId
    ) AS jsonAddresses ON `user`.userId = jsonAddresses.fk_address_userId
    INNER JOIN (
        SELECT fk_authority_userId, JSON_ARRAYAGG(role) AS roles
        FROM authority
        GROUP BY fk_authority_userId
    ) AS jsonRoles ON `user`.userId = jsonRoles.fk_authority_userId
    INNER JOIN (
        SELECT fk_privileges_userId, JSON_ARRAYAGG(privilege) AS privileges
        FROM privileges
        GROUP BY fk_privileges_userId
    ) AS jsonPrivileges ON `user`.userId = jsonPrivileges.fk_privileges_userId
    WHERE `user`.userId = id;

    RETURN user;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllPoints` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllPoints`()
BEGIN
    DECLARE ENDPOINTS JSON;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET ENDPOINTS=null;

    SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            "endPointId", e.endPointId,
            "endPointName", e.endpointName,
            "authorities", auth.json_authorities
        )
    ) INTO ENDPOINTS
    FROM endpoints e
    INNER JOIN (
        SELECT fk_authorization_endPointsId, JSON_ARRAYAGG(privilege) AS json_authorities
        FROM authorization
        GROUP BY fk_authorization_endPointsId
    ) AS auth ON e.endPointId = auth.fk_authorization_endPointsId;

    SELECT ENDPOINTS AS 'ENDPOINTS';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllUser`()
BEGIN
    DECLARE users JSON;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET users=null;

    SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'userId', u.userId,
            'userName', u.userName,
            'userFullName', u.userFullName,
            'userEmail', u.userEmail,
            'userPassword', u.userPassword,
            'accountNonExpired', u.isAccountNonExpired,
            'accountNonLocked', u.isAccountNonLocked,
            'credentialsNonExpired', u.isCredentialsNonExpired,
            'enabled', u.isEnabled,
            'userAddresses', jsonAddresses.addresses,
            'userRoles', jsonRoles.roles,
            'privileges', jsonPrivileges.privileges
        )
    ) INTO users
    FROM `user` u
    INNER JOIN (
        SELECT fk_address_userId, JSON_ARRAYAGG(address) AS addresses
        FROM address
        GROUP BY fk_address_userId
    ) AS jsonAddresses ON u.userId = jsonAddresses.fk_address_userId
    INNER JOIN (
        SELECT fk_authority_userId, JSON_ARRAYAGG(role) AS roles
        FROM authority
        GROUP BY fk_authority_userId
    ) AS jsonRoles ON u.userId = jsonRoles.fk_authority_userId
    INNER JOIN (
        SELECT fk_privileges_userId, JSON_ARRAYAGG(privilege) AS privileges
        FROM privileges
        GROUP BY fk_privileges_userId
    ) AS jsonPrivileges ON u.userId = jsonPrivileges.fk_privileges_userId;

    SELECT users AS 'users';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserById`(id INT)
BEGIN
    DECLARE user JSON;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET user=null;

    SELECT JSON_OBJECT(
        'userId', u.userId,
        'userName', u.userName,
        'userFullName', u.userFullName,
        'userEmail', u.userEmail,
        'userPassword', u.userPassword,
        'accountNonExpired', u.isAccountNonExpired,
        'accountNonLocked', u.isAccountNonLocked,
        'credentialsNonExpired', u.isCredentialsNonExpired,
        'enabled', u.isEnabled,
        'userAddresses', jsonAddresses.addresses,
        'userRoles', jsonRoles.roles,
        'privileges', jsonPrivileges.privileges
    ) INTO user
    FROM `user` u
    INNER JOIN (
        SELECT fk_address_userId, JSON_ARRAYAGG(address) AS addresses
        FROM address
        GROUP BY fk_address_userId
    ) AS jsonAddresses ON u.userId = jsonAddresses.fk_address_userId
    INNER JOIN (
        SELECT fk_authority_userId, JSON_ARRAYAGG(role) AS roles
        FROM authority
        GROUP BY fk_authority_userId
    ) AS jsonRoles ON u.userId = jsonRoles.fk_authority_userId
    INNER JOIN (
        SELECT fk_privileges_userId, JSON_ARRAYAGG(privilege) AS privileges
        FROM privileges
        GROUP BY fk_privileges_userId
    ) AS jsonPrivileges ON u.userId = jsonPrivileges.fk_privileges_userId
    WHERE u.userId = id;

    SELECT user AS 'user';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserByName`(IN name VARCHAR(25))
BEGIN
    DECLARE user JSON;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET user=null;
    
    SELECT JSON_OBJECT(
        'userId', u.userId,
        'userName', u.userName,
        'userFullName', u.userFullName,
        'userEmail', u.userEmail,
        'userPassword', u.userPassword,
        'accountNonExpired', u.isAccountNonExpired,
        'accountNonLocked', u.isAccountNonLocked,
        'credentialsNonExpired', u.isCredentialsNonExpired,
        'enabled', u.isEnabled,
        'userAddresses', jsonAddresses.addresses,
        'userRoles', jsonRoles.roles,
        'privileges', jsonPrivileges.privileges
    ) INTO user
    FROM `user` u
    INNER JOIN (
        SELECT fk_address_userId, JSON_ARRAYAGG(address) AS addresses
        FROM address
        GROUP BY fk_address_userId
    ) AS jsonAddresses ON u.userId = jsonAddresses.fk_address_userId
    INNER JOIN (
        SELECT fk_authority_userId, JSON_ARRAYAGG(role) AS roles
        FROM authority
        GROUP BY fk_authority_userId
    ) AS jsonRoles ON u.userId = jsonRoles.fk_authority_userId
    INNER JOIN (
        SELECT fk_privileges_userId, JSON_ARRAYAGG(privilege) AS privileges
        FROM privileges
        GROUP BY fk_privileges_userId
    ) AS jsonPrivileges ON u.userId = jsonPrivileges.fk_privileges_userId
    WHERE u.userName = name;
    
    SELECT user AS 'user';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-06 12:04:32
