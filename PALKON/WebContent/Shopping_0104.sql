-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: shopping
-- ------------------------------------------------------
-- Server version	5.6.33-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cupon`
--

DROP TABLE IF EXISTS `cupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cupon` (
  `cp_no` int(11) NOT NULL,
  `cp_id` varchar(20) DEFAULT NULL,
  `cp_name` varchar(50) DEFAULT NULL,
  `cp_number` varchar(50) DEFAULT NULL,
  `cp_price` double DEFAULT NULL,
  `cp_regdate` varchar(50) DEFAULT NULL,
  `cp_duedate` varchar(50) DEFAULT NULL,
  `cp_usedate` varchar(50) DEFAULT NULL,
  `cp_check` varchar(50) DEFAULT '0',
  `cp_limit_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`cp_no`),
  UNIQUE KEY `cp_number` (`cp_number`),
  KEY `cp_id` (`cp_id`),
  CONSTRAINT `cupon_ibfk_1` FOREIGN KEY (`cp_id`) REFERENCES `member` (`mb_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupon`
--

LOCK TABLES `cupon` WRITE;
/*!40000 ALTER TABLE `cupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `mb_num` int(11) NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(20) NOT NULL,
  `mb_pass` varchar(20) NOT NULL,
  `mb_name` varchar(20) NOT NULL,
  `mb_addr` varchar(500) DEFAULT NULL,
  `mb_tel` varchar(20) DEFAULT NULL,
  `mb_email` varchar(100) DEFAULT NULL,
  `mb_gender` varchar(20) DEFAULT NULL,
  `mb_brith_date` varchar(20) DEFAULT NULL,
  `mb_join_date` varchar(20) DEFAULT NULL,
  `mb_last_login` varchar(20) DEFAULT NULL,
  `mb_buy_cnt` int(11) DEFAULT NULL,
  `mb_grade` varchar(10) DEFAULT NULL,
  `mb_mobile` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`mb_num`),
  UNIQUE KEY `mb_id` (`mb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'d','d','d','34672 ëì  ëêµ¬ íêµ1ê¸¸ 3 (íìë) ddd','d','d','female','2016-12-01','2016/38/28','2016/38/28',0,'D','d');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_pro`
--

DROP TABLE IF EXISTS `order_pro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_pro` (
  `or_id` varchar(20) DEFAULT NULL,
  `or_num` int(11) NOT NULL,
  `or_date` varchar(50) DEFAULT NULL,
  `or_name` varchar(50) DEFAULT NULL,
  `or_addr` varchar(50) DEFAULT NULL,
  `or_tel` varchar(50) DEFAULT NULL,
  `or_msg` varchar(200) DEFAULT NULL,
  `or_price` varchar(50) DEFAULT NULL,
  `or_pay` varchar(50) DEFAULT NULL,
  `or_payname` varchar(50) DEFAULT NULL,
  `or_bank` varchar(50) DEFAULT NULL,
  `or_delivery` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`or_num`),
  KEY `or_id` (`or_id`),
  CONSTRAINT `order_pro_ibfk_1` FOREIGN KEY (`or_id`) REFERENCES `member` (`mb_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_pro`
--

LOCK TABLES `order_pro` WRITE;
/*!40000 ALTER TABLE `order_pro` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_pro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point`
--

DROP TABLE IF EXISTS `point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `point` (
  `pt_num` int(11) NOT NULL,
  `pt_id` varchar(20) NOT NULL,
  `pt_money` int(11) DEFAULT NULL,
  `pt_regdate` varchar(50) DEFAULT NULL,
  `pt_duedate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pt_num`),
  KEY `pt_id` (`pt_id`),
  CONSTRAINT `point_ibfk_1` FOREIGN KEY (`pt_id`) REFERENCES `member` (`mb_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point`
--

LOCK TABLES `point` WRITE;
/*!40000 ALTER TABLE `point` DISABLE KEYS */;
/*!40000 ALTER TABLE `point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `pr_board_num` int(11) NOT NULL AUTO_INCREMENT,
  `pr_pro_code` varchar(20) NOT NULL,
  `pr_product` varchar(50) NOT NULL,
  `pr_size` varchar(50) DEFAULT NULL,
  `pr_category` varchar(50) DEFAULT NULL,
  `pr_brand` varchar(50) DEFAULT NULL,
  `pr_price` int(11) NOT NULL,
  `pr_buy_cnt` int(11) DEFAULT NULL,
  `pr_stock` int(11) DEFAULT NULL,
  `pr_orgin` varchar(50) DEFAULT NULL,
  `pr_color` varchar(20) DEFAULT NULL,
  `pr_pro_info` varchar(500) DEFAULT NULL,
  `pr_reg_date` varchar(30) DEFAULT NULL,
  `pr_recent_date` varchar(30) DEFAULT NULL,
  `pr_orgin_code` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pr_board_num`),
  UNIQUE KEY `pr_pro_code` (`pr_pro_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'123456','goodchoice','big','backpack','프라다',122000,10,5,'china','yellow','info','2016-10-25','2016-12-02','123456'),(2,'22222','badchoice','small','cross','루이비통',1000,8,100,'usa','green','info2','2014-10-25','2015-12-02','144444'),(3,'33333','notbad','small','briefcase','맥',12000,13,20,'china','aqua','info333','2015-2-25','2015-10-13','5555555'),(4,'44444','okay','medium','backpack','배네비트',25000,60,150,'korea','brown','info444444','2011-2-25','2016-10-13','5666666'),(5,'555555','good','medium','cross','아모레',35000,10,110,'korea','brown','info55555','2016-2-25','2016-9-13','577777'),(6,'666666','good2','small','briefcase','아리따움',135000,1,50,'korea','red','info55555','2011-4-30','2015-5-13','8888888'),(7,'77777','good4','medium','cross','러',500,50,60,'china','green','info 666666','2010-5-25','2016-1-12','999999'),(8,'88888','gooddooo','big','briefcase','아리따움',158220,45,120,'usa','black','info8777','2016-4-25','2016-5-13','101010');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_img`
--

DROP TABLE IF EXISTS `product_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_img` (
  `pi_board_num` int(11) NOT NULL,
  `pi_pro_code` varchar(20) NOT NULL,
  `image_name` varchar(50) NOT NULL,
  `image_path` varchar(500) NOT NULL,
  `image_size` int(11) DEFAULT NULL,
  `img_category` varchar(50) DEFAULT NULL,
  `pi_num` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pi_num`),
  KEY `pi_board_num` (`pi_board_num`),
  CONSTRAINT `product_img_ibfk_1` FOREIGN KEY (`pi_board_num`) REFERENCES `product` (`pr_board_num`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_img`
--

LOCK TABLES `product_img` WRITE;
/*!40000 ALTER TABLE `product_img` DISABLE KEYS */;
INSERT INTO `product_img` VALUES (8,'88888','8.jpg','/projectT_include/TeamProj/assets/pages/img/products/',NULL,'briefcase',1),(1,'123456','1.jpg','/projectT_include/TeamProj/assets/pages/img/products/',NULL,'backpack',2),(2,'22222','2.jpg','/projectT_include/TeamProj/assets/pages/img/products/',NULL,'cross',3),(3,'33333','3.jpg','/projectT_include/TeamProj/assets/pages/img/products/',NULL,'briefcase',4),(4,'44444','4.jpg','/projectT_include/TeamProj/assets/pages/img/products/',NULL,'backpack',5),(5,'555555','5.jpg','/projectT_include/TeamProj/assets/pages/img/products/',NULL,'cross',6),(6,'666666','6.jpg','/projectT_include/TeamProj/assets/pages/img/products/',NULL,'briefcase',7),(7,'77777','7.jpg','/projectT_include/TeamProj/assets/pages/img/products/',NULL,'cross',8);
/*!40000 ALTER TABLE `product_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `rv_num` int(11) DEFAULT NULL,
  `rv_id` varchar(20) DEFAULT NULL,
  `rv_pro_code` varchar(50) DEFAULT NULL,
  `rv_title` varchar(50) DEFAULT NULL,
  `rv_content` varchar(500) DEFAULT NULL,
  `rv_name` varchar(50) DEFAULT NULL,
  `rv_pw` varchar(50) DEFAULT NULL,
  `rv_email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selected_product`
--

DROP TABLE IF EXISTS `selected_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selected_product` (
  `sc_num` int(11) NOT NULL,
  `sc_id` varchar(20) DEFAULT NULL,
  `sc_pro_code` varchar(20) NOT NULL,
  `sc_pro_cnt` int(11) NOT NULL,
  `sc_reg_date` varchar(30) DEFAULT NULL,
  `sc_order_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`sc_num`),
  KEY `sc_id` (`sc_id`),
  KEY `sc_order_num` (`sc_order_num`),
  KEY `sc_pro_code` (`sc_pro_code`),
  CONSTRAINT `selected_product_ibfk_1` FOREIGN KEY (`sc_id`) REFERENCES `member` (`mb_id`) ON DELETE CASCADE,
  CONSTRAINT `selected_product_ibfk_2` FOREIGN KEY (`sc_order_num`) REFERENCES `order_pro` (`or_num`) ON DELETE CASCADE,
  CONSTRAINT `selected_product_ibfk_3` FOREIGN KEY (`sc_pro_code`) REFERENCES `product` (`pr_pro_code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selected_product`
--

LOCK TABLES `selected_product` WRITE;
/*!40000 ALTER TABLE `selected_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `selected_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-04 17:43:54
