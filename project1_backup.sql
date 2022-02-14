-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: db20192958
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_number` varchar(20) NOT NULL,
  `balance` int NOT NULL,
  PRIMARY KEY (`account_number`),
  CONSTRAINT `account_chk_1` CHECK (((0 <= `balance`) and (`balance` <= 150000)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('1000',150000),('2000',5000),('3000',6000),('4000',7000),('5000',8000),('6000',9000),('7000',10000);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower`
--

DROP TABLE IF EXISTS `borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrower` (
  `customer_id` varchar(10) NOT NULL,
  `loan_number` varchar(20) NOT NULL,
  PRIMARY KEY (`customer_id`,`loan_number`),
  KEY `loan_number` (`loan_number`),
  CONSTRAINT `borrower_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `borrower_ibfk_2` FOREIGN KEY (`loan_number`) REFERENCES `loan` (`loan_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower`
--

LOCK TABLES `borrower` WRITE;
/*!40000 ALTER TABLE `borrower` DISABLE KEYS */;
INSERT INTO `borrower` VALUES ('1','100'),('1','200'),('1','300'),('1','400'),('2','500'),('3','600'),('4','700');
/*!40000 ALTER TABLE `borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_name` varchar(20) NOT NULL,
  `branch_city` varchar(20) NOT NULL,
  `assets` int NOT NULL,
  PRIMARY KEY (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('강남역지점','서울',450000),('구월동지점','인천',150000),('대전중앙지점','대전',80000),('부산대학교지점','부산',100000),('숭실대지점','서울',300000),('야탑역지점','성남',70000),('영등포지점','서울',200000);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` varchar(10) NOT NULL,
  `customer_name` varchar(20) NOT NULL,
  `customer_street` varchar(50) NOT NULL,
  `customer_city` varchar(20) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('1','김도은','팔달구 화서동 250-4','수원'),('2','이레','권선구 정자동 10-1','수원'),('3','이미정','영등포구 영등포동 22-2','서울'),('4','이파원','해운대구 좌동 14-1','부산'),('5','정솔지','중구 대사동 198-14','대전'),('6','박라윤','분당구 율동 91-1','성남'),('7','강시언','중구 을왕동 746-1','인천');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depositor`
--

DROP TABLE IF EXISTS `depositor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `depositor` (
  `customer_id` varchar(10) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `access_date` date NOT NULL,
  PRIMARY KEY (`customer_id`,`account_number`),
  KEY `account_number` (`account_number`),
  CONSTRAINT `depositor_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `depositor_ibfk_2` FOREIGN KEY (`account_number`) REFERENCES `account` (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depositor`
--

LOCK TABLES `depositor` WRITE;
/*!40000 ALTER TABLE `depositor` DISABLE KEYS */;
INSERT INTO `depositor` VALUES ('1','5000','2021-07-01'),('2','6000','2021-08-24'),('2','7000','2021-09-27'),('5','1000','2021-03-08'),('5','2000','2021-06-26'),('6','3000','2021-06-30'),('7','4000','2021-06-27');
/*!40000 ALTER TABLE `depositor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `loan_number` varchar(20) NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`loan_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES ('100',10000),('200',20000),('300',30000),('400',80000),('500',50000),('600',100000),('700',70000);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_branch`
--

DROP TABLE IF EXISTS `loan_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_branch` (
  `loan_number` varchar(20) NOT NULL,
  `branch_name` varchar(20) NOT NULL,
  PRIMARY KEY (`loan_number`),
  KEY `branch_name` (`branch_name`),
  CONSTRAINT `loan_branch_ibfk_1` FOREIGN KEY (`loan_number`) REFERENCES `loan` (`loan_number`),
  CONSTRAINT `loan_branch_ibfk_2` FOREIGN KEY (`branch_name`) REFERENCES `branch` (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_branch`
--

LOCK TABLES `loan_branch` WRITE;
/*!40000 ALTER TABLE `loan_branch` DISABLE KEYS */;
INSERT INTO `loan_branch` VALUES ('300','강남역지점'),('600','대전중앙지점'),('400','부산대학교지점'),('700','부산대학교지점'),('200','숭실대지점'),('500','야탑역지점'),('100','영등포지점');
/*!40000 ALTER TABLE `loan_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `loan_number` varchar(20) NOT NULL,
  `payment_number` varchar(20) NOT NULL,
  `payment_amount` int NOT NULL,
  `payment_date` date NOT NULL,
  PRIMARY KEY (`loan_number`,`payment_number`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`loan_number`) REFERENCES `loan` (`loan_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('100','1',500,'2020-01-01'),('100','2',800,'2020-03-08'),('200','1',5000,'2020-04-01'),('200','2',5000,'2020-05-01'),('200','3',3000,'2020-06-01'),('300','1',500,'2020-07-01'),('400','1',500,'2020-08-01');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-11 23:54:14
