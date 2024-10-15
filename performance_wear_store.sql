-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: performance_wear_store
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.20.04.1

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (6,'Nike club','/uploads/1726634518654.jpeg',2333.00,''),(8,'Nike Tech','/uploads/1726635851644.jpeg',1999.00,''),(10,'Nike repel','/uploads/1726636715330.jpeg',1099.00,''),(11,'Jordan','/uploads/1726637644591.jpeg',2877.00,'S'),(25,'Nike Air max 100','/uploads/1726634139772.jpeg',2000.00,'UK 6');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL),(10,'Kids','Shoes','Nike Air max 100','/uploads/1726634139772.jpeg',2000.00),(11,'Men','Clothing','Nike club','/uploads/1726634518654.jpeg',2333.00),(12,'Men','Clothing','Nike Tech','/uploads/1726635851644.jpeg',1999.00),(13,'Men','Clothing','Nike repel','/uploads/1726636715330.jpeg',1099.00),(14,'Men','Clothing','Air jordan','/uploads/1726636760046.jpeg',2233.00),(15,'Men','Clothing','Nike sportswear','/uploads/1726636797785.jpeg',1222.00),(16,'Men','Clothing','Nokta','/uploads/1726636844635.jpeg',3333.00),(17,'Women','Clothing','Nike air','/uploads/1726637624611.jpeg',3999.00),(18,'Women','Clothing','Jordan','/uploads/1726637644591.jpeg',2877.00),(19,'Women','Clothing','Jordan Flight Heritage','/uploads/1726637760221.jpeg',4998.00),(20,'Kids','Clothing','Nike Air','/uploads/1726637832518.jpeg',1222.00),(21,'Kids','Clothing','Sportswear','/uploads/1726637850658.jpeg',1333.00),(22,'Kids','Clothing','Jordan','/uploads/1726637865156.jpeg',2222.00),(23,'Men','Shoes','Nike P-6000','/uploads/1726637983595.jpeg',3222.00),(24,'Men','Shoes','Nike Cortez','/uploads/1726638008698.jpeg',5999.00),(25,'Kids','Shoes','runnig shoes','/uploads/1726683156533.jpeg',2333.00),(26,'Women','Shoes','shoe-900 P','/uploads/1726683222791.jpeg',4555.00),(27,'Women','Shoes','thr','/uploads/1726685354130.jpeg',56.00),(28,'Men','Shoes','uyk','/uploads/1726685403532.jpeg',56.00),(29,'Women','Shoes','casual','/uploads/1726685448136.jpeg',1111.00),(30,'Kids','Shoes','iiiiiiiiiiiiii','/uploads/1726685693011.jpeg',11112.00),(31,'Men','Clothing','Nike summer ','/uploads/1726729702919.jpg',1223.00),(32,'Kids','Shoes','ewfef','/uploads/1726738960469.png',3344.00);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-19 16:56:52
