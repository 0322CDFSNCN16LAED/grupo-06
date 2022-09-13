CREATE DATABASE  IF NOT EXISTS `alcer_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `alcer_db`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: alcer_db
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_date` datetime NOT NULL,
  `user_id` int NOT NULL,
  `discount` int DEFAULT '0',
  `order_status` varchar(15) NOT NULL DEFAULT 'enCarrito',
  `delivery_method` varchar(45) DEFAULT NULL,
  `delivery_adress` varchar(255) DEFAULT NULL,
  `between_streets` varchar(255) DEFAULT NULL,
  `payment_method` varchar(45) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_users_idx` (`user_id`),
  CONSTRAINT `fk_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2022-09-03 16:22:28',1,0,'enCarrito',NULL,NULL,NULL,NULL,'2022-09-03 16:22:28','2022-09-03 16:22:28',NULL),(2,'2022-09-07 15:02:05',2,0,'enCarrito',NULL,NULL,NULL,NULL,'2022-09-07 15:02:05','2022-09-07 15:02:05',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_details`
--

DROP TABLE IF EXISTS `orders_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `amount` int NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_od_orders_idx` (`order_id`),
  KEY `fk_or_products_idx` (`product_id`),
  CONSTRAINT `fk_od_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_or_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_details`
--

LOCK TABLES `orders_details` WRITE;
/*!40000 ALTER TABLE `orders_details` DISABLE KEYS */;
INSERT INTO `orders_details` VALUES (1,1,2,1,'2022-09-03 16:27:08','2022-09-06 15:21:03',NULL),(2,1,4,1,'2022-09-03 16:27:22','2022-09-06 15:19:41',NULL),(3,1,4,1,'2022-09-03 16:27:37','2022-09-03 16:27:37','2022-09-04 22:13:54'),(4,1,6,1,'2022-09-03 16:30:33','2022-09-03 16:30:33','2022-09-04 23:56:46'),(5,1,3,1,'2022-09-04 22:13:42','2022-09-04 22:13:42','2022-09-04 22:14:04'),(6,1,3,3,'2022-09-04 22:29:06','2022-09-06 23:38:19',NULL),(7,2,6,1,'2022-09-07 15:02:05','2022-09-07 15:02:05',NULL);
/*!40000 ALTER TABLE `orders_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT '0.00',
  `product_photo` varchar(500) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `special_offer` tinyint DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `stock` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_products_category_idx` (`category_id`),
  CONSTRAINT `fk_products_category` FOREIGN KEY (`category_id`) REFERENCES `products_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Agua con gas','Agua con gas Baja en Sodio Glaciar 1.5 L',140.00,'Agua-Baja-En-Sodio-Glaciar-Con-Gas-15-L-1-240110.webp',1,1,'2022-08-26 21:54:43','2022-08-26 21:54:43',NULL,1000),(2,'Chocolate Milka','Chocolate con leche Milka 150 grs',119.99,'Chocolate-Milka-Con-Leche-150-Gr-1-26505.webp',2,0,'2022-08-26 21:59:17','2022-09-02 14:31:45',NULL,1000),(3,'Limpiavidrios Mr Musculo','Repuesto Mr Musculo Limpiavirios 900ml',89.50,'Limpiador-Vidrios-Y-Multiuso-Doy-Pack-Mr-Musculo-900-Ml-1-249086.webp',3,0,'2022-08-26 21:59:17','2022-09-02 14:41:46',NULL,1000),(4,'Leche La Serenisima Zero','Leche larga vida zero lactosa La Serenísima 1L ',240.00,'Leche-Ls-Uat-Pa-Desc-Zero-Lact-For-Vit-1-859051.webp',4,0,'2022-08-26 21:59:17','2022-08-26 21:59:17',NULL,1000),(5,'Paso de los Toros Pomelo','Gaseosa Paso de los toros Pomelo 1.5Lts',136.00,'Gaseosa-Paso-De-Los-Toros-Pomelo-15l-1-248189.webp',1,1,'2022-08-26 21:59:17','2022-09-02 14:42:18',NULL,1000),(6,'Carne Picada','Carne Picada Especial ALCER',223.75,'Picada-Especial-1-861724.webp',4,0,'2022-08-26 21:59:17','2022-09-02 14:38:54',NULL,1000),(7,'Coca-Cola Sin Azúcar 1.75Lts','Gaseosa marca Coca-Cola, Sin Azúcar. 1,75lt',223.99,'Gaseosa-Coca-Cola-Sin-Azucar-1-75lt-1-367450.webp',1,0,'2022-08-26 21:59:17','2022-09-02 14:42:27',NULL,1000),(8,'DogChow Pollo 100gr','Alimento Para Perros marca Dog-Chow sabor Pollo. Envase 100grs',356.00,'img-1656903138829-DogChow-Pollo-100gr.webp',5,1,'2022-08-26 21:59:17','2022-08-26 21:59:17',NULL,1000),(9,'Ayudín Clásica','Lavandina clásica marca Ayudín. Envase de 2Lts',475.00,'img-1656903217106-Ayudín-Clásica.webp',3,1,'2022-08-26 21:59:17','2022-08-26 21:59:17',NULL,1000),(10,'Antitranspirante Rexona Fútbol','Desodorante Antitranspirante Rexona FútbolFanatics En Aerosol 150ml',400.20,'img-1656903272269-Antitranspirante-Rexona-Fútbol.webp',3,0,'2022-08-26 21:59:17','2022-08-26 21:59:17',NULL,1000),(11,'Antitranspirante Rexona Invisible','Desodorante Antitranspirante Rexona Invisible En Aerosol 150ml',420.00,'img-1656903324076-Antitranspirante-Rexona-Invisible.webp',3,1,'2022-08-26 21:59:17','2022-08-26 21:59:17',NULL,1000),(12,'Pure de Tomate Salsati','Pure De Tomate marca Salsati 520gr',560.00,'img-1656903373286-Pure-de-Tomate-Salsati.webp',5,0,'2022-08-26 21:59:17','2022-08-26 21:59:17',NULL,1000),(13,'Lechuga Criolla','Lechuga Criolla. Precio por Kilo',60.75,'img-1656903422208-Lechuga-Criolla.webp',5,0,'2022-08-26 21:59:17','2022-09-02 14:33:03',NULL,1000),(14,'LimpiaVidrios CIF','Limpiador de Vidrios Cif Bio Original 375gr',359.99,'img-1656903473984-LimpiaVidrios-CIF.webp',2,1,'2022-08-26 21:59:17','2022-08-26 21:59:17',NULL,1000),(15,'Ades Manzana','Jugo Ades-Soja sabor Manzana 1-Lt',426.00,'img-1656903510401-Ades-Manzana.webp',1,0,'2022-08-26 21:59:17','2022-08-26 21:59:17',NULL,1000),(16,'Papas Mc Cain Tradicionales','Papas Tradicional Mc Cain Bsa 720 Grm',236.77,'img-1660694127063-Papas-Mc-Cain-Tradicionales.jpg',2,0,'2022-08-26 21:59:17','2022-08-26 21:59:17',NULL,1000),(76,'GATORADE Manzana','Bebida Isotónica GATORADE Manzana Botella 1,25 L ',303.19,'img-1661950243716-gatorade.jpg',1,0,'2022-08-31 12:50:43','2022-08-31 12:50:43',NULL,1000),(77,'Yerba Mate Hierbas Serranas Chamigo','Yerba Mate Hierbas Serranas Chamigo Paq 500 Grm',307.60,'img-1662128501980-yerba-chamigo.jpg',1,0,'2022-09-02 14:21:41','2022-09-02 14:31:35',NULL,1001),(78,'Pañuelos ELITE','Pañuelos ELITE Doble Hoja Caja 75 Unidades ',167.99,'img-1662130454085-elite.jpg',3,0,'2022-09-02 14:54:14','2022-09-04 23:11:36',NULL,105),(79,'Alfajor Terrabusi','Alfajor Terrabusi Chocolate',120.00,'img-1662848343566-Alfajor-Terrabusi.jpg',2,0,'2022-09-10 22:19:03','2022-09-10 22:19:03',NULL,200);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_categories`
--

DROP TABLE IF EXISTS `products_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_categories`
--

LOCK TABLES `products_categories` WRITE;
/*!40000 ALTER TABLE `products_categories` DISABLE KEYS */;
INSERT INTO `products_categories` VALUES (1,'Bebidas','Bebidas'),(2,'Golosinas','Golosinas'),(3,'Limpieza','Limpieza'),(4,'Carnicería','Carnicería'),(5,'Almacén','Almacén');
/*!40000 ALTER TABLE `products_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `profil_photo` varchar(500) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'manu@alcer.com','$2a$10$fIuFL9tk1/UKNtuOa45d3OUPj4VR.q/hLqYj77goSfJJ6fwmi9BGq','adminUser','manu','manu','2022-08-02','1661952854210.jpg','2022-08-31 13:34:14','2022-08-31 13:34:14',NULL),(2,'manucomun@alcer.com','$2a$10$5t8uqiB9YSX2d1D/E2nLx.ybvAENdsx.0yr.LSJNL5gdrhHh07O..','normalUser','ma','sdad','2022-09-21','defaultUser.png','2022-09-06 23:29:14','2022-09-06 23:29:14',NULL),(3,'otro@usuario.com','$2a$10$isJgT2yYEz1AyeQhmi6iQu6TsJEyc9XGqL2hZgkJb8jYRsQbTHeca','normalUser','otro','yosd','2022-09-20','1662565815143.jpg','2022-09-07 15:29:50','2022-09-07 15:50:57',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'alcer_db'
--

--
-- Dumping routines for database 'alcer_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-13 12:11:39
