

-- SQL�� ��/�ҹ��ڸ� �������� ����

select sysdate from dual;
SELECT SYSDATE FROM DUAL;

-- DDL : ������ ���Ǿ�
-- CREATE TABLE
CREATE TABLE BOARD (
    BNO NUMBER(10),
    TITLE VARCHAR2(200) NOT NULL,
    CONTENT VARCHAR2(2000),
    WRITER VARCHAR2(50) NOT NULL,
    REG_DATE DATE
);

-- ALTER: �����ͺ��̽��� ������ ����
ALTER TABLE BOARD
ADD CONSTRAINT pk_board_bno
PRIMARY KEY (BNO);


-- ������ �߰�
INSERT INTO BOARD
    (bno, title, content, writer, reg_date) 
VALUES 
    (1, '�ȳ�ȳ�', '���볻��', '��ö��', SYSDATE);


SELECT * FROM board;


-- ��� ���̺� ����
CREATE TABLE REPLY (
    RNO NUMBER(10),
    R_CONTENT VARCHAR2(500),
    R_WRITER VARCHAR2(50),
    BNO NUMBER(10)
);

-- �������� ���� : BOARD���̺�� REPLY���̺��� ���� ����
ALTER TABLE REPLY
ADD CONSTRAINT fk_reply_bno 
FOREIGN KEY (BNO) 
REFERENCES BOARD (BNO);


-- �÷� ����

ALTER TABLE BOARD
ADD (view_count NUMBER(10) DEFAULT 0 NOT NULL);

ALTER TABLE BOARD  
MODIFY (title VARCHAR2(400));

ALTER TABLE BOARD 
DROP COLUMN view_count;

-- ���̺� ����
DROP TABLE REPLY;
DROP TABLE BOARD;



















