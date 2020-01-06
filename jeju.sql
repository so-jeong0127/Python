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


-- jeju 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `jeju` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `jeju`;

-- 테이블 jeju.authors 구조 내보내기
CREATE TABLE IF NOT EXISTS `authors` (
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.authors:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` (`name`, `address`) VALUES
	('대한민국', '서울시'),
	('민국이', '대전시');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;

-- 테이블 jeju.customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `customer` (
  `userID` char(10) NOT NULL DEFAULT '',
  `name` varchar(20) DEFAULT NULL,
  `birthYear` int(11) DEFAULT NULL,
  `addr` varchar(20) DEFAULT NULL,
  `mobile1` char(3) DEFAULT NULL,
  `mobile2` char(7) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `mDate` date DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.customer:~10 rows (대략적) 내보내기
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`userID`, `name`, `birthYear`, `addr`, `mobile1`, `mobile2`, `height`, `mDate`) VALUES
	('BBK', '바바킴', 1973, '서울', '010', '0000000', 176, '2013-05-05'),
	('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-03-03'),
	('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10'),
	('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-04-04'),
	('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-04-04'),
	('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-07-07'),
	('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-09-09'),
	('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-08-08'),
	('SSK', '성시경', 1979, '서울', '', '', 186, '2013-12-12'),
	('YJS', '윤종신', 1969, '경남', '', '', 170, '2005-05-05');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- 테이블 jeju.goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods` (
  `code` int(11) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `su` int(11) DEFAULT NULL,
  `dan` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='primnary key : 중복이 불가능, 외부에서 참조가 가능한 키';

-- 테이블 데이터 jeju.goods:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`code`, `name`, `su`, `dan`) VALUES
	(1, '냉장고', 2, 850000),
	(2, '세탁기', 3, 550000),
	(3, '전자레인지', 2, 350000),
	(4, 'HDTV', 3, 1500000),
	(5, 'VR기기', 2, 1440000),
	(6, 'Drone', 1, 890000),
	(7, '고성능컴퓨터', 3, NULL);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

-- 테이블 jeju.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `userID` char(10) NOT NULL,
  `prodName` varchar(20) DEFAULT NULL,
  `groupName` varchar(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `userID` (`userID`),
  CONSTRAINT `FK_product_customer` FOREIGN KEY (`userID`) REFERENCES `customer` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.product:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`num`, `userID`, `prodName`, `groupName`, `price`, `amount`) VALUES
	(14, 'KBS', '운동화', '전자', 30, 2),
	(15, 'KBS', '노트북', '전자', 1000, 1),
	(16, 'JYP', '모니터', '전자', 200, 1),
	(17, 'BBK', '모니터', '전자', 200, 5),
	(18, 'KBS', '청바지', '의류', 50, 3),
	(19, 'BBK', '메모리', '전자', 80, 10),
	(20, 'SSK', '책', '서적', 15, 5),
	(21, 'EJW', '책', '서적', 15, 2),
	(22, 'EJW', '청바지', '의류', 50, 1),
	(23, 'BBK', '운동화', '전자', 30, 2),
	(24, 'EJW', '책', '서적', 15, 1),
	(25, 'BBK', '운동화', '서적', 30, 2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- 테이블 jeju.school 구조 내보내기
CREATE TABLE IF NOT EXISTS `school` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `schoolname` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `schoolcode` char(10) NOT NULL,
  `studentcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`schoolcode`),
  KEY `no` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.school:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` (`no`, `schoolname`, `address`, `schoolcode`, `studentcount`) VALUES
	(1, '충주여자고등학교', '충주시', 'CH00000001', 300),
	(2, '신성여자고등학교', '제주시', 'IC00000001', 560),
	(3, '종로여자고등학교', '종로구', 'JR00000001', 300),
	(4, '제주여자고등학교', '제주시', 'SE00000001', 300);
/*!40000 ALTER TABLE `school` ENABLE KEYS */;

-- 테이블 jeju.student 구조 내보내기
CREATE TABLE IF NOT EXISTS `student` (
  `bunho` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `kor` tinyint(4) DEFAULT NULL,
  `mat` tinyint(4) DEFAULT NULL,
  `eng` tinyint(4) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `average` float DEFAULT NULL,
  `grade` char(2) DEFAULT NULL,
  `schoolcode` char(10) DEFAULT NULL,
  PRIMARY KEY (`bunho`),
  KEY `schoolcode` (`schoolcode`),
  CONSTRAINT `FK__school` FOREIGN KEY (`schoolcode`) REFERENCES `school` (`schoolcode`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.student:~11 rows (대략적) 내보내기
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`bunho`, `name`, `kor`, `mat`, `eng`, `total`, `average`, `grade`, `schoolcode`) VALUES
	(1, '전공인', 81, 82, 91, 254, 84.67, 'B', 'SE00000001'),
	(2, '전공이', 82, 82, 82, 246, 82, 'B', 'SE00000001'),
	(3, '전공인', 81, 82, 91, 254, 84.67, 'B', 'SE00000001'),
	(4, '전공이', 82, 82, 82, 246, 82, 'B', 'SE00000001'),
	(5, '전공삼', 92, 101, 101, 294, 98, 'A', 'CH00000001'),
	(6, '전공삼', 92, 101, 101, 294, 98, 'A', 'CH00000001'),
	(7, '전공사', 101, 101, 101, 303, 101, 'A', 'CH00000001'),
	(8, '고려인', 101, 101, 101, 303, 101, 'A', 'CH00000001'),
	(9, '종로구', 101, 82, 72, 255, 85, 'B', 'IC00000001'),
	(10, '김만덕', 101, 82, 72, 255, 85, 'B', 'IC00000001'),
	(11, '제주민', 101, 101, 101, 303, 101, 'A', 'IC00000001');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- 테이블 jeju.student2 구조 내보내기
CREATE TABLE IF NOT EXISTS `student2` (
  `num` int(11) NOT NULL,
  `name` varchar(12) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  `addr` varchar(15) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='보통 major은 코드화 한다.';

-- 테이블 데이터 jeju.student2:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `student2` DISABLE KEYS */;
INSERT INTO `student2` (`num`, `name`, `sex`, `age`, `major`, `addr`, `tel`, `money`) VALUES
	(20120001, '고길동', 'm', 27, '선박', 'seoul', '010-000-4512', 5000),
	(20120002, '최둘리', 'm', 22, '역사', 'busan', '010-999-9999', 4500),
	(20120003, '도우너', 'w', 15, '역사', 'daegu', '010-555-5555', 6500),
	(20120004, '김만덕', 'w', 15, '유아', 'mokpo', '010-555-7777', 7000),
	(20120005, '류현진', 'm', 22, '컴퓨터공학', 'seoul', '010-122-2222', 8000),
	(20120006, '손흥민', 'm', 22, '컴퓨터공학', 'seoul', '010-999-9999', 8000);
/*!40000 ALTER TABLE `student2` ENABLE KEYS */;

-- 테이블 jeju.student_1 구조 내보내기
CREATE TABLE IF NOT EXISTS `student_1` (
  `s_name` varchar(50) DEFAULT NULL,
  `kor` int(11) DEFAULT NULL,
  `eng` int(11) DEFAULT NULL,
  `mat` int(11) DEFAULT NULL,
  `tot` int(11) DEFAULT NULL,
  `avg` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.student_1:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `student_1` DISABLE KEYS */;
INSERT INTO `student_1` (`s_name`, `kor`, `eng`, `mat`, `tot`, `avg`) VALUES
	('대한이', 90, 90, 90, 270, 90),
	('민국이', 80, 80, 81, 241, 80.3333),
	('만세', 100, 100, 100, 300, 100);
/*!40000 ALTER TABLE `student_1` ENABLE KEYS */;

-- 프로시저 jeju.student_insert 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_insert`(
	IN `name` VARCHAR(50),
	IN `kor` INT,
	IN `mat` INT,
	IN `eng` INT,
	IN `schoolcode` CHAR(10),
	OUT `result` INT
)
BEGIN
   declare exit handler for sqlexception
   begin
    rollback; # commit, savepoint
    set result = -1; # 실패
   end;
  start transaction;
    insert into student(NAME, kor, mat, eng, schoolcode)
    value(NAME,kor,mat,eng,schoolcode);
  commit;
  set result=0; # 성공
END//
DELIMITER ;

-- 프로시저 jeju.student_select 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_select`()
BEGIN
   select * from student;
END//
DELIMITER ;

-- 프로시저 jeju.student_sum 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_sum`()
BEGIN
   drop table if exists `sungjuk_hab`;
   create table sungjuk_hab(korhab float, mathab float, enghab float) as
       select sum(kor) as korhab, sum(mat) as mathab, sum(eng) as enghab from student;
   insert into sungjuk_hab(korhab,mathab,enghab)
       select round(avg(kor),2),round(avg(mat),2),round(avg(eng),2) from student;
       select * from sungjuk_hab;
END//
DELIMITER ;

-- 프로시저 jeju.student_updatename 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_updatename`(
	IN `name1` VARCHAR(50),
	IN `name2` VARCHAR(50),
	OUT `result` INT
)
BEGIN
   declare cnt int default 0; # cnt = 0;
   select count(*) into cnt from student where NAME = name1;
   
   if cnt>0 then
	      update student set NAME = name2 where NAME = name1;
	      set result := 0;

   else set result := -1;
   end if;

END//
DELIMITER ;

-- 프로시저 jeju.student_updateone 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_updateone`()
BEGIN
   declare _done int default false; # 무한루트의 종료조건
   declare name_var varchar(20); # 하나의 데이터를 처리하기 위한 변수
   declare kor_var int;
   declare mat_var int;
   declare eng_var int;
   
   # CUSOR: 데이터를 가리키는 위치
   declare cursor_student cursor for select NAME, kor, mat, eng from student; 
   declare continue handler for not found set _done = TRUE;
   open cursor_student; # 데이터를 가져옴
   repeat # 반복하라.
      fetch cursor_student into name_var, kor_var, mat_var, eng_var; # fetch: 데이터를 하나씩 가져오는 것 
      if not _done then # 거짓을 부정
         update student set kor=kor_var+1, mat=mat_var+1, eng=eng_var+1 where name = name_var;
         set _done = false;
      end if;
   until _done # true가 될때까지 무한루트
   end repeat;
   close cursor_student;
END//
DELIMITER ;

-- 테이블 jeju.sungjuk_hab 구조 내보내기
CREATE TABLE IF NOT EXISTS `sungjuk_hab` (
  `korhab` float DEFAULT NULL,
  `mathab` float DEFAULT NULL,
  `enghab` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.sungjuk_hab:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sungjuk_hab` DISABLE KEYS */;
INSERT INTO `sungjuk_hab` (`korhab`, `mathab`, `enghab`) VALUES
	(1004, 986, 984),
	(91.27, 89.64, 89.45);
/*!40000 ALTER TABLE `sungjuk_hab` ENABLE KEYS */;

-- 트리거 jeju.student_before_insert 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `student_before_insert` BEFORE INSERT ON `student` FOR EACH ROW BEGIN # OLD: 입력된값, NEW: 새롭게 만들어질데이터, SET: 변수에 값을 대입할 때 사용
   set NEW.total=NEW.kor+NEW.mat+NEW.eng;
   set NEW.average = round(NEW.total/3,2);
   if NEW.average >= 90 THEN set NEW.grade = 'A';
   elseif NEW.average >=80 then set NEW.grade = 'B';
   elseif NEW.average >=70 then set NEW.grade = 'C';
   elseif NEW.average >=60 then set NEW.grade = 'D';
   else set NEW.grade ='F';
   end if;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 트리거 jeju.student_before_update 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `student_before_update` BEFORE UPDATE ON `student` FOR EACH ROW BEGIN
   set NEW.total=NEW.kor+NEW.mat+NEW.eng;
   set NEW.average = round(NEW.total/3,2);
   if NEW.average >= 90 THEN set NEW.grade = 'A';
   elseif NEW.average >=80 then set NEW.grade = 'B';
   elseif NEW.average >=70 then set NEW.grade = 'C';
   elseif NEW.average >=60 then set NEW.grade = 'D';
   else set NEW.grade ='F';
   end if;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
