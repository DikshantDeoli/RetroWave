-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: retrowave
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'one plus 6','38500','mobiles','yes','img/oneplus-6.jpg'),(2,'Iphone X','99800','mobiles','no','img/iphone-x.jpeg'),(3,'Pocophone F1','26000','mobiles','no','img/pocophone-f1.jpg'),(4,'Samsung S9','52000','mobiles','yes','img/samsung-s9.jpg'),(5,'Macbook Air','124000','laptops','yes','img/macbook-air.jpg'),(6,'Asus Rog','92000','laptops','no','img/asus-rog.jpg'),(7,'HP Pavilion','62000','laptops','no','img/hp-pavilion.png'),(8,'Acer Predator','76000','laptops','yes','img/acer-predator.jpg'),(9,'Jeans','750','clothing','no','img/jeans.jpg'),(10,'Shirts','600','clothing','yes','img/shirts.jpg'),(11,'T-Shirt','400','clothing','no','img/t-shirt.jpg'),(12,'Sweatshirt','550','clothing','no','img/sweatshirt.jpg'),(13,'Painting','1200','home decor','no','img/painting.jpg'),(14,'Wall Shelf','24000','home decor','yes','img/wall-shelf.jpg'),(18,'Wall Clock','450','home decor','no','img/clock.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-01 23:16:07
