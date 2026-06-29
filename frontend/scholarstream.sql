/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: scholarstream
-- ------------------------------------------------------
-- Server version	11.8.6-MariaDB-6 from Debian

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `book_hold_request`
--

DROP TABLE IF EXISTS `book_hold_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_hold_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `book_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrpsyvbahnu9icmmeg1f0wpny4` (`book_id`),
  CONSTRAINT `FKrpsyvbahnu9icmmeg1f0wpny4` FOREIGN KEY (`book_id`) REFERENCES `library_book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_hold_request`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `book_hold_request` WRITE;
/*!40000 ALTER TABLE `book_hold_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_hold_request` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `library_book`
--

DROP TABLE IF EXISTS `library_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL,
  `available_copies` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `total_copies` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_84fwm1vgi8utiqfniqj9wfgja` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_book`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `library_book` WRITE;
/*!40000 ALTER TABLE `library_book` DISABLE KEYS */;
INSERT INTO `library_book` VALUES
(1,'Robert C. Martin',5,'Software Engineering','978-0132350884','Clean Code',5),
(2,'Andrew Hunt',4,'Software Engineering','978-0201616224','The Pragmatic Programmer',4),
(3,'Gang of Four',3,'Software Engineering','978-0201633610','Design Patterns',3),
(4,'Thomas H. Cormen',6,'Computer Science','978-0262033848','Introduction to Algorithms',6),
(5,'Harold Abelson',4,'Computer Science','978-0262510875','Structure and Interpretation of Computer Programs',4),
(6,'Donald Knuth',2,'Computer Science','978-0201485417','The Art of Computer Programming',2),
(7,'James Stewart',5,'Mathematics','978-1285740621','Calculus',5),
(8,'Sheldon Axler',3,'Mathematics','978-3319110790','Linear Algebra Done Right',3),
(9,'Stephen Hawking',6,'Science','978-0553380163','A Brief History of Time',6),
(10,'Richard Dawkins',4,'Science','978-0198788607','The Selfish Gene',4),
(11,'Yuval Noah Harari',5,'History','978-0062316097','Sapiens',5),
(12,'Jared Diamond',3,'History','978-0393317558','Guns Germs and Steel',3);
/*!40000 ALTER TABLE `library_book` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reservation_date` date NOT NULL,
  `reserved_by` varchar(255) NOT NULL,
  `book_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj0td4f7yog9c02y47ui8vst2x` (`book_id`),
  CONSTRAINT `FKj0td4f7yog9c02y47ui8vst2x` FOREIGN KEY (`book_id`) REFERENCES `library_book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'test@example.com','Test User','$2a$10$7566IDJjAPXyDC1KNscorO8Kgcn4vm8E4eqZjCh8H/lan4WlTeYaS','LIBRARY_PATRON'),
(3,'user@example.com','user@example.com','$2a$10$zdG4kbeA8kyjBgNAWnW6Tu27UvCdwblkHf02BhfiRctxeCI9dXtOe','LIBRARY_PATRON'),
(4,'patron@booknest.com','Patron User','$2a$10$Kbu/HWdjBpZCnS.Vi0cZOeE4fk9hpHkhjCvpIDCYN5OsVKT3deu9O','LIBRARY_PATRON'),
(5,'staff@booknest.com','Library Staff','$2a$10$Sja6qvdZoGABtOGT.23wyOzxBnFmVZ.ZbSi5to07vp2iOHXK27iUe','LIBRARIAN_STAFF'),
(6,'chief@booknest.com','Chief Librarian','$2a$10$qYhnfz77rmFYYh8re/AF8OGn5LN6bdb.LDuOQ5tqgMMCxCsWBJW0G','CHIEF_LIBRARIAN');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-06-29 21:18:25
