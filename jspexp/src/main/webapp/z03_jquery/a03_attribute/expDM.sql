

CREATE TABLE MEMBER (
	mno varchar2(50),
	id varchar2(50),
	pw varchar2(50),
	name varchar2(50),
	auth varchar2(50),
	point NUMBER,
	regdate date
);
DROP TABLE MEMBER;

CREATE SEQUENCE seq_mem01
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	MAXVALUE 1000;
DROP SEQUENCE seq_mem01;

SELECT seq_mem01.nextval FROM dual;

-- 회원 등록 
INSERT INTO MEMBER values(seq_mem01.nextval, 'goodman', 'as1111', '홍길동', '사용자', '0', sysdate);
INSERT INTO MEMBER values(seq_mem01.nextval, 'himan', '7777', '오길동', '관리자', '1000', sysdate);
INSERT INTO MEMBER values(seq_mem01.nextval, 'heygirl', '2222', '홍리나', '사용자', '5000', sysdate);

INSERT INTO MEMBER values(seq_mem01.nextval, ?, ?, ?, ?, ?, sysdate);

SELECT * FROM MEMBER;


SELECT * FROM product;

CREATE TABLE exp_product(
	pname varchar2(50),
	price NUMBER,
	cnt NUMBER 
);
SELECT * FROM exp_product;
DROP TABLE exp_product;

INSERT INTO exp_product values('사과', 5000, 10);
INSERT INTO exp_product values('바나나', 3000, 20);
INSERT INTO exp_product values('딸기', 12000, 5);
INSERT INTO exp_product values('수박', 15000, 9);

SELECT * FROM EXP_PRODUCT ep 
WHERE pname ='사과';

SELECT * FROM emp02;

SELECT * FROM MEMBER;

-- 회원 수정
UPDATE MEMBER 
	SET pw = ?,
		name = ?,
		auth = ?,
		point = ?,
	WHERE id = ?;

-- 회원 삭제
DELETE FROM MEMBER WHERE id = ?;