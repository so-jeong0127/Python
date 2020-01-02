INSERT INTO goods VALUES(1,'냉장고',2,850000);
INSERT INTO goods VALUES(2,'세탁기',3,550000);
INSERT INTO goods VALUES(3,'전자레인지',2,350000);
INSERT INTO goods VALUES(4,'HDTV',3,1500000);

# name = not null
# INSERT INTO goods (CODE, su, dan) VALUES(4,3,1500000);
# primary key = code 기본값이 0
# 이 이후부터는 code값이 안들어가 있으면 출력이 되지 않는다.
# INSERT INTO goods (NAME, su, dan) VALUES("py",3,1500000);

SELECT*FROM goods;

INSERT INTO goods(CODE, NAME, su) VALUES(5,'드론',1);
UPDATE goods SET dan = 100000 where CODE = 5; # 중복없이 데이터 입력
delete FROM goods WHERE CODE = 5;
# 필드의 이름이 생략되어 있으면 모든 데이터 다 입략해야함
INSERT INTO  goods VALUES(5,'VR기기',2,1440000); # 전체다
INSERT INTO goods VALUES(6,'Drone',1,890000);
INSERT INTO goods (CODE,NAME,su) VALUES(7,'고성능컴퓨터',3);

# 이름이 냉장고이고 단가가 75000이상인 데이터 출력
SELECT * FROM goods WHERE  NAME='냉장고' AND dan>=75000 ;
# 단가가 75000이하인 제품 출력
SELECT * FROM goods WHERE dan<=75000
# 단가가 50000이상이고 1200000이하인 제품출력
SELECT * FROM goods WHERE dan>=50000 AND dan <=1200000;
# 판매 수량이 3개 이상인 제품명과 단가의 출력
SELECT NAME, dan FROM goods WHERE su>=3;
 
 ------------------------------------------------------------------------------------
 
INSERT INTO student2 VALUES(20120001, '고길동', 'm', 27, '선박','seoul','010-000-4512',5000);
INSERT INTO student2 VALUES(20120002, '최둘리', 'm', 22, '역사','busan','010-999-9999',4500);
INSERT INTO student2 VALUES(20120003, '도우너','w', 15, '역사','daegu','010-555-5555',6500);
INSERT INTO student2 VALUES(20120004, '김만덕', 'w', 15, '유아','mokpo','010-555-7777',7000);
INSERT INTO student2 VALUES(20120005, '류현진', 'm', 22, '컴퓨터공학','seoul','010-122-2222',8000);
INSERT INTO student2 VALUES(20120006, '손흥민', 'm', 22, '컴퓨터공학','seoul','010-999-9999',8000);

# 직업별로 급여의 합계를 내시오.
SELECT major, SUM(money) FROM student2 group BY major;
# 전체인원수를 세시오.
SELECT COUNT(*) FROM student2;
# 최씨로 시작하는 사람 출력
SELECT * FROM student2 WHERE NAME LIKE '최%';
# 서울이 주소이고 고씨인 사람
SELECT * FROM student2 WHERE addr LIKE 'seoul' AND NAME LIKE '고%';

SELECT COUNT(*) "전체 행수", COUNT(money) "급여건수", MAX(money) "최대급여", min(money) "최소급여", ROUND(AVG(money),2) "평균급여"
FROM student2;

SELECT COUNT(*) , COUNT(money) , MAX(money) , min(money) , ROUND(AVG(money),2) 
FROM student2;

SELECT MAX(money)-MIN(money) AS 급여구간 FROM student2;
# money에 대하여 min-max정규화를 실행하시오.
# 그룹 함수이기 때문에 그룹값을 상수화해야 정상적으로 계산됨
SELECT (money-MIN(money))/(MAX(money)-MIN(money)) AS 정규화 FROM student2;
# 프로그램으로 변경(사용자변수 @, @@ 시스템 변수)
SELECT MIN(money) INTO @minvalue FROM student2;
SELECT MAX(money) - MIN(money) INTO @rangevalue FROM student2;
SELECT (money-@minvalue)/@rangevalue AS 정규화값 FROM student2;
