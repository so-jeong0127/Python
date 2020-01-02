CREATE TABLE authors (
	name VARCHAR(50) NULL DEFAULT NULL,
	address VARCHAR(50) NULL DEFAULT NULL
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

# CRUD ( insert into, select, update, delete )문 사용
INSERT INTO AUTHORS(NAME, address) VALUES("대한이","서울시");
INSERT INTO AUTHORS(NAME, address) VALUES("민국이","대전시");
INSERT INTO AUTHORS(NAME, address) VALUES("만세","충주시");
# 데이터베이스(외부접속단위), 테이블, 필드(변수이름), 레코드
# * : 모두다
SELECT * FROM AUTHORS;
SELECT * FROM AUTHORS WHERE NAME="대한이"; # 데이터베이스에서는 = 하나만 사용 (== X)
SELECT address FROM AUTHORS WHERE NAME="만세";
# update set
UPDATE AUTHORS SET NAME="대한민국" WHERE NAME = "대한이";

DELETE FROM AUTHORS WHERE NAME="만세";

# 문제 : 3인분 성적을 students 테이블에 입력하고 출력해보시오.
# 이름 국어 영어 수학 총점 평균
CREATE TABLE student (
	s_name VARCHAR(50) NULL DEFAULT NULL,
	kor INT(11) NULL DEFAULT NULL,
	eng INT(11) NULL DEFAULT NULL,
	mat INT(11) NULL DEFAULT NULL,
	tot INT(11) NULL DEFAULT NULL,
	avg FLOAT NULL DEFAULT NULL
)
ENGINE=InnoDB
;

INSERT INTO student(s_name,kor,eng,mat) VALUES("대한이",90,90,90);
INSERT INTO student(s_name,kor,eng,mat) VALUES("민국이",80,80,81);
INSERT INTO student(s_name,kor,eng,mat) VALUES("만세",100,100,100);

UPDATE student SET tot=kor+eng+mat WHERE s_name="대한이";
UPDATE student SET tot=kor+eng+mat WHERE s_name="민국이";
UPDATE student SET tot=kor+eng+mat WHERE s_name="만세";
UPDATE student SET avg=tot/3 WHERE s_name="대한이";
UPDATE student SET avg=tot/3 WHERE s_name="민국이";
UPDATE student SET avg=tot/3 WHERE s_name="만세";

SELECT * FROM student;