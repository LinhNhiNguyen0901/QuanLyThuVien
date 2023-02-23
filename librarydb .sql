-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: librarydb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `book_id` varchar(5) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `year` int NOT NULL,
  `surname_author` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name_author` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `number` int NOT NULL,
  `category` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('IT01','C#',2010,'Trần','An',2,'Lập Trình','Sách cũ'),('IT02','C++',2022,'Phan Văn','Chí',1,'Lập Trình','Sách mới'),('M01','Xác suất thống kê',2020,'Lý','Đức',3,'Toán','Sách mới');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow_and_return`
--

DROP TABLE IF EXISTS `borrow_and_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow_and_return` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `book_id` varchar(5) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `end_date` datetime NOT NULL,
  `return_date` datetime NOT NULL,
  PRIMARY KEY (`id`,`student_id`,`book_id`),
  KEY `student_id` (`student_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `borrow_and_return_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `borrow_and_return_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow_and_return`
--

LOCK TABLES `borrow_and_return` WRITE;
/*!40000 ALTER TABLE `borrow_and_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrow_and_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('2011022077','Phan Văn','Tí','0123123456','Tây Ninh','Ti@gmail.com'),('2021022066','Trần Văn','Tèo','0123456789','Hà Nội','Teo@gmail.com');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `password` varchar(9) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'TranVanBe','123456789',1),(2,'TranThiCe','abc123ABC',1),(3,'QUANTHU1','PASS123',1),(4,'admin123','admin',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-03  8:52:47
