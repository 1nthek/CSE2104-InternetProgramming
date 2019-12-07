-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sys
-- ------------------------------------------------------
-- Server version	5.7.27-log

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
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `user_id` varchar(20) NOT NULL,
  `product_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help`
--

DROP TABLE IF EXISTS `help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help` (
  `help_no` int(11) NOT NULL AUTO_INCREMENT,
  `help_title` varchar(200) NOT NULL,
  `help_content` varchar(5000) NOT NULL,
  `help_writer` varchar(20) NOT NULL,
  PRIMARY KEY (`help_no`),
  UNIQUE KEY `help_no_UNIQUE` (`help_no`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help`
--

LOCK TABLES `help` WRITE;
/*!40000 ALTER TABLE `help` DISABLE KEYS */;
INSERT INTO `help` VALUES (8,'공지사항입니다','1. 테스트 공지사항입니다.\r\n2. 테스트 공지사항입니다.\r\n3. 테스트 공지사항입니다.','관리자'),(9,'환불 문의입니다!!','환불해 주세요!','user1'),(10,'교환해 주세요!!','교환해 주세요!! 변심!','user3'),(13,'문의합니다','문의','user3'),(15,'사이즈 교환 문의 드려요!!','사이즈가 너무 큰거 같은데 환불 받을 수 있을까요??','user1'),(17,'공지22','공지사항','관리자');
/*!40000 ALTER TABLE `help` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_products` (
  `order_no` int(11) NOT NULL,
  `product_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` VALUES (33,2),(33,2),(33,6),(34,5),(35,3),(35,3),(35,5),(35,5),(35,21),(35,21),(35,21),(36,21),(37,4),(37,4),(37,5),(37,6),(38,6),(38,21),(38,21);
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_no` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `receiver_name` varchar(20) NOT NULL,
  `receiver_address` varchar(100) NOT NULL,
  `receiver_email` varchar(40) NOT NULL,
  `receiver_phone` varchar(20) NOT NULL,
  PRIMARY KEY (`order_no`),
  UNIQUE KEY `order_no_UNIQUE` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (33,'user1','김철수','인하대로 111번길','aaa@gmail.com','010-1234-5678'),(34,'user2','김민수','인하대로 999번길','bbb@gmail.com','010-1234-5678'),(35,'user1','강인하','목동서로 500','temp@gmail.com','010-9886-1110'),(36,'user1','강인하','인천시 남구 용현1.4동 인하로 100','abc@inha.ac.kr','010-1122-3344'),(37,'user1','인하인','인천광역시 남구 용현1.4동 인하로 200','qwerty@gmail.com','010-3456-3456'),(38,'user1','강인하','인하대','aa@gmail.com','010-1111-1111');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_no` int(11) NOT NULL AUTO_INCREMENT,
  `product_price` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_img_url` varchar(200) NOT NULL,
  `product_content` varchar(2000) NOT NULL,
  `product_category` varchar(40) NOT NULL,
  `product_material` varchar(2000) NOT NULL,
  `product_size` varchar(2000) NOT NULL,
  PRIMARY KEY (`product_no`),
  UNIQUE KEY `product_no_UNIQUE` (`product_no`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,66000,'STITCHED MINIMAL KNIT (BLACK)','http://firstfloor.co.kr/web/product/big/201904/42635a7523f3e3fef685d6b41d3a9b70.jpg','미니멀이라는 단어가 범람하는 지금, 불필요한 것은 최대한 덜어내고 옷 입는 즐거움은 함께 가져가기 위한 고민을 담은 니트 입니다. 인앤아웃 디테일을 차용 및 활용 하였습니다. 싱글과 셋업 시 이너로 입을 경우를 모두 감안하여 패턴을 적용하였습니다. 전체적인 실루엣은 일반적으로 몸을 감싸는 타입이 아닌 자연스럽게 흐르는 드레이프를 중점으로 하였고, 쭉티라고 불리는 롱슬리브 타입으로 편하게 입어도 충분히 좋습니다. 소매와 옆구리 선은 사진에서 확인할 수 있듯이 인앤아웃 체인스티치를 디자인으로 활용였으며, 밑단은 트임을 주어 활동성을 더했습니다. 소매와 밑단의 끝은 소재의 질감과 실루엣의 연속성을 위하여 일반적으로 시보리라 불리는 골지 타입의 것이 아닌, 몸판 그대로의 조직으로 마무리하였습니다.','top','아크릴 95% + 폴리에스터 5%','어깨 50 , 가슴단면 54.5 , 팔길이 62 , 총길이 68.5'),(4,66000,'STITCHED MINIMAL KNIT (DARK BLUE)','http://firstfloor.co.kr/web/product/big/201903/cab363768b16f1f937d8fcdd1504e3b3.jpg','미니멀이라는 단어가 범람하는 지금, 불필요한 것은 최대한 덜어내고 옷 입는 즐거움은 함께 가져가기 위한 고민을 담은 니트 입니다. 인앤아웃 디테일을 차용 및 활용 하였습니다. 싱글과 셋업 시 이너로 입을 경우를 모두 감안하여 패턴을 적용하였습니다. 전체적인 실루엣은 일반적으로 몸을 감싸는 타입이 아닌 자연스럽게 흐르는 드레이프를 중점으로 하였고, 쭉티라고 불리는 롱슬리브 타입으로 편하게 입어도 충분히 좋습니다. 소매와 옆구리 선은 사진에서 확인할 수 있듯이 인앤아웃 체인스티치를 디자인으로 활용였으며, 밑단은 트임을 주어 활동성을 더했습니다. 소매와 밑단의 끝은 소재의 질감과 실루엣의 연속성을 위하여 일반적으로 시보리라 불리는 골지 타입의 것이 아닌, 몸판 그대로의 조직으로 마무리하였습니다.','top','아크릴 95% + 폴리에스터 5%','어깨 50 , 가슴단면 54.5 , 팔길이 62 , 총길이 68.5'),(5,57400,'EASYGOING CROP PANTS (cream jeans)','http://firstfloor.co.kr/web/product/big/201910/3795ef545a4baac5f7732c3bd996465d.jpg','은은한 아이보리빛, 내츄럴 톤의 진 입니다. 수년전 많은 분들께서 아껴주셨던 넉넉한 사이즈의 이지고잉 크랍 팬츠의 2.0 ver 입니다. 당시의 이지고잉 크랍팬츠는 조금 더 매니악한 느낌이 있었다면 이번에는 조금 더 대중적인 느낌을 많이 담아내어 부담없이 입을 수 있도록 하였습니다. 전반적으로 여유있지만 밑단으로 내려갈수록 자연스럽게 좁아지는 테이퍼드 핏을 베이스로 하였으며, 허벅지와 무릎 기준선 최적의 위치와 수치를 적용하여 편안하면서도 둔해보이지 않는, 맵시좋은 균형미를 가지도록 하였습니다.','bottom','코튼 100% , 11.5 oz, 바이오 워시드.','허리단면 39.5 , 밑위 28 , 허벅단면 31 , 총길이 95±0.5 , 밑단 18'),(6,89000,'easygoing creased jeans (flour blue)','http://firstfloor.co.kr/web/product/big/201910/0b5e2119ff9680bac70cc4ca4acbd2a5.jpg','하얗게 탈색된 듯한- 그레이 빛이 감도는 라이트 블루 컬러, 스트레이트 핏, 밑단을 접어서 주름을 잡은 디테일로 출고 되지만 밑단을 내리고 앞주름을 펴면 캐쥬얼한 루즈핏으로 즐기실 수 있습니다.','bottom','코튼 100% , 사계절 가능한 12oz','허리단면 39.5~40 , 밑위 27.5 , 허벅단면 30 , 총길이 94 (롤업 풀 경우 101) , 밑단 19'),(16,66000,'STITCHED MINIMAL KNIT (LIGHT BLUE)','http://firstfloor.co.kr/web/product/big/201904/514fe73e1822893d6c99c9f29728ae52.jpg','미니멀이라는 단어가 범람하는 지금, 불필요한 것은 최대한 덜어내고 옷 입는 즐거움은 함께 가져가기 위한 고민을 담은 니트 입니다. 인앤아웃 디테일을 차용 및 활용 하였습니다. 싱글과 셋업 시 이너로 입을 경우를 모두 감안하여 패턴을 적용하였습니다. 전체적인 실루엣은 일반적으로 몸을 감싸는 타입이 아닌 자연스럽게 흐르는 드레이프를 중점으로 하였고, 쭉티라고 불리는 롱슬리브 타입으로 편하게 입어도 충분히 좋습니다. 소매와 옆구리 선은 사진에서 확인할 수 있듯이 인앤아웃 체인스티치를 디자인으로 활용였으며, 밑단은 트임을 주어 활동성을 더했습니다. 소매와 밑단의 끝은 소재의 질감과 실루엣의 연속성을 위하여 일반적으로 시보리라 불리는 골지 타입의 것이 아닌, 몸판 그대로의 조직으로 마무리하였습니다.','top','아크릴 95% + 폴리에스터 5%','어깨 50 , 가슴단면 54.5 , 팔길이 62 , 총길이 68.5'),(21,38000,'11th anniversary OG logo T-shirt ','http://firstfloor.co.kr/web/product/big/201906/fc74361384cc9acf001fd9f9c2c09e5e.jpg','11주년을 기념하여 처음으로 소개해드리는 OG logo 티셔츠입니다. 총 다섯가지 컬러로 준비하였으며, 래글런 타입의 슈퍼오버사이즈 핏 입니다.표면이 비교적 매트(건조)한 특성을 가지는 강연사를 이용하여 제직한 면원단을 사용하여, 여름철에 데일리로 입기에 굉장히 적합합니다. 절개의 경계선은 모두 이중으로 섬세하게 스티치를 얹었습니다. 얼핏 보면 특별할 것 없어 보이는 티셔츠 이지만, 직접 입어보시면 자주 손이가는 애정템이 되지 않을까 생각하며 자신 있게 추천합니다.','top','코튼 100% (강연 사 사용)','옆 목선에서 소매끝 45 , 가슴단면 70 , 총길이(넥 립 제외) 77.5');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` varchar(20) NOT NULL,
  `user_pw` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('user1','0000'),('user2','0000'),('user3','0000'),('user4','0000'),('관리자','0000');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_info`
--

DROP TABLE IF EXISTS `users_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_info` (
  `user_id` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_email` varchar(40) NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_info`
--

LOCK TABLES `users_info` WRITE;
/*!40000 ALTER TABLE `users_info` DISABLE KEYS */;
INSERT INTO `users_info` VALUES ('user1','사용자1','abc@gmail.com','인하대학교 100로','010-1234-5678',0),('user2','사용자2','bbb@gmail.com','인하대로 222번길','010-1234-5678',0),('user3','사용자3','qwert@naver.com','인하3가 300로','010-1111-1222',0),('user4','김나영','qwe@inha.kr','인하로 998','010-1111-2222',0),('관리자','관리자','관리자','관리자','관리자',1);
/*!40000 ALTER TABLE `users_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-06 10:09:33
