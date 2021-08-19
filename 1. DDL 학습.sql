

-- SQL은 대/소문자를 구분하지 않음

select sysdate from dual;
SELECT SYSDATE FROM DUAL;

-- DDL : 데이터 정의어
-- CREATE TABLE
CREATE TABLE BOARD (
    BNO NUMBER(10),
    TITLE VARCHAR2(200) NOT NULL,
    CONTENT VARCHAR2(2000),
    WRITER VARCHAR2(50) NOT NULL,
    REG_DATE DATE
);

-- ALTER: 데이터베이스의 구조를 변경
ALTER TABLE BOARD
ADD CONSTRAINT pk_board_bno
PRIMARY KEY (BNO);


-- 데이터 추가
INSERT INTO BOARD
    (bno, title, content, writer, reg_date) 
VALUES 
    (1, '안녕안녕', '내용내용', '김철수', SYSDATE);


SELECT * FROM board;


-- 댓글 테이블 생성
CREATE TABLE REPLY (
    RNO NUMBER(10),
    R_CONTENT VARCHAR2(500),
    R_WRITER VARCHAR2(50),
    BNO NUMBER(10)
);

-- 연관관계 설정 : BOARD테이블과 REPLY테이블간의 관계 지정
ALTER TABLE REPLY
ADD CONSTRAINT fk_reply_bno 
FOREIGN KEY (BNO) 
REFERENCES BOARD (BNO);

























