-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: cab_booking
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','admin12@gmail.com','e62514936d70efde1f5875846585b78a4f3e329d0800e2c78fa3bf2fc43c0625');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `startLocation` varchar(45) NOT NULL,
  `endLocation` varchar(45) NOT NULL,
  `address` text NOT NULL,
  `driver_id` int DEFAULT NULL,
  `vehicle_no` varchar(20) NOT NULL,
  `driverContact` varchar(20) NOT NULL,
  `discountCode` varchar(20) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `paymentMethod` enum('Cash','Card') NOT NULL DEFAULT 'Card',
  `status` enum('Pending','Confirmed','Completed') DEFAULT 'Pending',
  `bookingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_fk_1_idx` (`driver_id`),
  CONSTRAINT `id_fk_1` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'Jane Smith','0723456784','colombo','galle','45 Park Ave, Kandy',2,'VA-5678','0779876543','',8500.00,'Cash','Confirmed','2025-03-06 16:37:27');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nic` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `nic_UNIQUE` (`nic`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (2,'John','Doe','johndoe@example.com','9912345682','0712345678','123, Main Street, Colombo','17be7ab1ae7e3e5093cc966032235cceec524c34783fef94e8a1e92415793a8c'),(4,'Jane','Smith','janesmith@email.com','1998234563','0723456784','45 Park Ave, Kandy','6f48c26e680edec6db486976eed15d214d8d38de5eaafb60873350156b0e9a32'),(5,'Ahmed','Ali','ahmed.ali@gmail.com','1995345678','0771122334','78 Galle Rd, Galle','aebbac5f612a09d04dadaa2509cbd5bd54787d35cbbd3e172e05413ed4667f07'),(6,'Sarah','Perera','sarahp@gmail.com','2001456789','0756677889','21 Lotus St, Negombo','3472535601fff9f845be385287407c0787cd7b34cac277acaf74e9c28e336818'),(7,'Kevin','Fernando','kevinf@gmail.com','1992567890','0768899000','67 Beach Rd, Jaffna','bad30f866a7f23550ecc858fd4eb0a9a557b21b41a0026a28377804ff2e074d0'),(10,'Kamal','Perera','kamal.perera@email.com','2001234568','0771234567','No. 123, Galle Road, Colombo','d1f40c1255e2094cd697565b005e50f17145e416a43b7f9b57f566ffc0d8258a');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discountCode` varchar(45) NOT NULL,
  `discountPrice` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,'Del101','20');
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distance`
--

DROP TABLE IF EXISTS `distance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `startLocation` varchar(50) NOT NULL,
  `endLocation` varchar(50) NOT NULL,
  `distance_amt` int NOT NULL,
  `time_taken` decimal(5,2) NOT NULL,
  `total_price` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distance`
--

LOCK TABLES `distance` WRITE;
/*!40000 ALTER TABLE `distance` DISABLE KEYS */;
INSERT INTO `distance` VALUES (1,'colombo','galle',126,2.50,8500),(2,'colombo','kandy',115,3.00,7500),(3,'colombo','jaffna',396,7.50,25000),(4,'kandy','badulla',107,3.00,6500),(5,'galle','matara',44,1.00,3000),(6,'galle','colombo',126,2.50,8500),(7,'kandy','colombo',115,3.00,7500),(8,'jaffna','colombo',396,7.50,25000),(9,'badulla','kandy',107,3.00,6500),(11,'matara','galle',44,1.00,3000);
/*!40000 ALTER TABLE `distance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `license_no` varchar(20) NOT NULL,
  `vehicle_no` varchar(45) NOT NULL,
  `vehicle_model` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `availability` enum('Available','Unavailable') DEFAULT 'Available',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `nic_UNIQUE` (`license_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,'Sunil','Fernando','sunil.fernando@gmail.com','0712345678','B1234567','CAB-1235','Toyota Prius','c4bc47e47dd3e16328d53c6984ee0d869a56685b507a0d5e19f8a43324ed8c5e','Unavailable'),(2,'Ruwan','De Silva','ruwan.silva@gmail.com','0779876543','D9876543','VA-5678','Nissan Caravan','f0375f45da1b876bd2b49afdc2ce76fe8e2c980cb2a252dd7ba26fc8f6f75075','Available');
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-08 20:48:28
