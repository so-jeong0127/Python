-- --------------------------------------------------------
-- 호스트:                          192.168.1.241
-- 서버 버전:                        5.5.64-MariaDB - MariaDB Server
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- academy 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `academy` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `academy`;

-- 테이블 academy.student 구조 내보내기
CREATE TABLE IF NOT EXISTS `student` (
  `stu_num` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `school` varchar(20) DEFAULT NULL,
  `cl_num` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`stu_num`),
  KEY `cl_num` (`cl_num`),
  CONSTRAINT `FK_student_toclass` FOREIGN KEY (`cl_num`) REFERENCES `toclass` (`cl_num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 테이블 데이터 academy.student:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`stu_num`, `name`, `age`, `school`, `cl_num`) VALUES
	(3, '이소정', 24, '없음', 'CP0001'),
	(4, '김대현', 26, '제주대학교', 'ONE001'),
	(5, '홍길동', 20, '한라대학교', 'CP0001');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- 프로시저 academy.student_delete 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `student_delete`(
	IN `id5` VARCHAR(50),
	IN `in_name` VARCHAR(20),
	IN `in_age` INT
,
	IN `school` VARCHAR(50),
	IN `cl_num` VARCHAR(50),
	OUT `out_res` INT
)
BEGIN
   declare cnt int default 0;
   select count(*) into cnt from student where name = in_name;
   if cnt > 0 then delete from student where name = in_name;
      set out_res = 0;
   else set out_res = 2;
   end if;
END//
DELIMITER ;

-- 프로시저 academy.student_insert 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `student_insert`(
	IN `in_name` VARCHAR(20),
	IN `in_age` INT,
	IN `in_school` VARCHAR(20),
	IN `in_cl_num` VARCHAR(20)

)
BEGIN
   insert into student(name, age, school, cl_num)
   values(in_name, in_age, in_school, in_cl_num);
END//
DELIMITER ;

-- 프로시저 academy.student_select 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `student_select`()
BEGIN
   select * from student;
END//
DELIMITER ;

-- 프로시저 academy.student_update 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `student_update`(
	IN `id5` VARCHAR(50),
	IN `in_name` VARCHAR(20),
	IN `in_age` INT,
	IN `in_school` VARCHAR(20),
	IN `in_cl_num` VARCHAR(50),
	OUT `out_res` INT


)
BEGIN
   declare cnt int default 0;
   select count(*) into cnt from student where name = in_name;
   
   if cnt > 0 then update student set cl_num = in_cl_num where name = in_name;
      set out_res := 0;
   else set out_res := 2;
   end if;
END//
DELIMITER ;

-- 테이블 academy.toclass 구조 내보내기
CREATE TABLE IF NOT EXISTS `toclass` (
  `cl_num` varchar(20) NOT NULL,
  `cl_name` varchar(20) NOT NULL,
  `teacher` varchar(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`cl_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 academy.toclass:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `toclass` DISABLE KEYS */;
INSERT INTO `toclass` (`cl_num`, `cl_name`, `teacher`, `price`) VALUES
	('CP0001', '초급 LC반', '뽀로로', 200000),
	('CP0002', '초급 RC반', '뽀로로', 250000),
	('DE0001', '중급 LC반', '마이콜', 250000),
	('DE0002', '중급 RC반', '마이콜', 300000),
	('ONE001', 'master반', '아이스베어', 400000);
/*!40000 ALTER TABLE `toclass` ENABLE KEYS */;

-- 프로시저 academy.toclass_select 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `toclass_select`()
BEGIN
   select * from toclass;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
