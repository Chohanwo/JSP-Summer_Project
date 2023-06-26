-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.0.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- projectdb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `projectdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `projectdb`;

-- 테이블 projectdb.cart 구조 내보내기
CREATE TABLE IF NOT EXISTS `cart` (
  `CartNum` int(11) NOT NULL AUTO_INCREMENT,
  `ProductNum` text NOT NULL,
  `UserId` text NOT NULL,
  `ProductSize` text DEFAULT NULL,
  PRIMARY KEY (`CartNum`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 projectdb.cart:~2 rows (대략적) 내보내기
INSERT IGNORE INTO `cart` (`CartNum`, `ProductNum`, `UserId`, `ProductSize`) VALUES
	(5, 'g', 'ekdnlt01', 'M'),
	(7, 'd', 'ekdnlt01', 'XL');

-- 테이블 projectdb.inquiry 구조 내보내기
CREATE TABLE IF NOT EXISTS `inquiry` (
  `bcode` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `writer` varchar(30) NOT NULL,
  `regdate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`bcode`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 projectdb.inquiry:~6 rows (대략적) 내보내기
INSERT IGNORE INTO `inquiry` (`bcode`, `subject`, `content`, `writer`, `regdate`) VALUES
	(1, '배송문의', '배송이 너무 느린데 처리 좀 빨리 해주세요', '윤영철', '2023-06-21 13:17:08'),
	(2, '결제문의', '결제가 자꾸 실패했다고 떠요', '김단아', '2023-06-21 13:17:40'),
	(3, '교환문의', '사이즈가 너무 작아서 그런데 교환 좀 해주세요', '조한성', '2023-06-21 13:18:04'),
	(4, '배송문의', '빨리 좀여', '조한성', '2023-06-21 13:18:47'),
	(5, '배송문의', '배송 좀 빨리 부탁드려요', '조한성', '2023-06-21 16:46:09'),
	(6, '배송문의', '지금 한달 째 기다리고 있어요 ', '조한성', '2023-06-21 18:02:21');

-- 테이블 projectdb.meminfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `meminfo` (
  `Mid` varchar(10) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `Mname` varchar(20) NOT NULL,
  `Maddr` varchar(100) NOT NULL,
  `Mphone` varchar(15) NOT NULL,
  `Mbirth` varchar(20) DEFAULT NULL,
  `Msms` varchar(2) DEFAULT NULL,
  `Memail` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`Mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 projectdb.meminfo:~1 rows (대략적) 내보내기
INSERT IGNORE INTO `meminfo` (`Mid`, `pwd`, `Mname`, `Maddr`, `Mphone`, `Mbirth`, `Msms`, `Memail`) VALUES
	('ekdnlt01', '1234', '조한성', '부산광역시 수영구', '01011112222', '20010202', 'on', 'on');

-- 테이블 projectdb.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `Snum` text NOT NULL,
  `Sname` text DEFAULT NULL,
  `Sinfo` text DEFAULT NULL,
  `Spic` text DEFAULT NULL,
  `Sprice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 projectdb.product:~7 rows (대략적) 내보내기
INSERT IGNORE INTO `product` (`Snum`, `Sname`, `Sinfo`, `Spic`, `Sprice`) VALUES
	('a', '벨티드 코트 원피스', './images/product/topDetail.jpg', 'images/product/상품1.jpg', 14500),
	('b', '숏 트위드 자켓', './images/product/topDetail.jpg', 'images/product/상품2.jpg', 26000),
	('c', '배색 라인 가디건', './images/product/topDetail.jpg', 'images/product/상품3.jpg', 23000),
	('d', '화이트 롱 코드', './images/product/topDetail.jpg', 'images/product/상품4.jpg', 59000),
	('f', '트임 청바지', './images/product/topDetail.jpg', 'images/product/상품6.jpg', 19500),
	('g', '셔츠 원피스', './images/product/topDetail.jpg', 'images/product/상품7.jpg', 39000),
	('e', '롱 클래식 셔츠', './images/product/topDetail.jpg', 'images/product/상품5.jpg', 35000);

-- 테이블 projectdb.purchase 구조 내보내기
CREATE TABLE IF NOT EXISTS `purchase` (
  `purchaseNum` int(11) NOT NULL AUTO_INCREMENT,
  `productNum` text NOT NULL,
  `userId` text NOT NULL,
  `productSize` text DEFAULT NULL,
  PRIMARY KEY (`purchaseNum`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 projectdb.purchase:~4 rows (대략적) 내보내기
INSERT IGNORE INTO `purchase` (`purchaseNum`, `productNum`, `userId`, `productSize`) VALUES
	(1, 'a', '조한성', 'M'),
	(2, 'a', '조한성', 'M'),
	(3, 'a', '조한성', 'M'),
	(4, 'a', '조한성', 'L');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
