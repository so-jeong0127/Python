# 쿼리문
# 문제 : 생일이 2015-01-01이후인 pet을 출력하시오.

SELECT * FROM pet WHERE birth>'2015-01-01';

SELECT NAME, cl_num, price

DELETE FROM student WHERE name = '이소정';
DELETE FROM toclass WHERE teacher = '이정훈';

INSERT INTO toclass
VALUE('CP0001','초급 LC반','뽀로로',200000)
INSERT INTO toclass
VALUE('CP0002','초급 RC반','뽀로로',250000)
INSERT INTO toclass
VALUE('DE0001','중급 LC반','마이콜',250000)
INSERT INTO toclass
VALUE('DE0002','중급 RC반','마이콜',300000)
INSERT INTO toclass
VALUE('ONE001','master반','아이스베어',400000)
