
-- DML : ������ ���۾�
-- SELECT, INSERT, UPDATE, DELETE

INSERT INTO BOARD
    (bno, title, content, writer, reg_date)
VALUES 
    (1, '�ȳ�~', '��մ� �����Դϴ�.', '������', SYSDATE);
    

-- NOT NULL �������ǿ� ����
INSERT INTO BOARD
    (bno, content, writer, reg_date)
VALUES 
    (2, '��մ� �����Դϴ�2.', '�Ѹ�', SYSDATE);
    

-- PK �������� ����
INSERT INTO BOARD
    (bno, title, content, writer, reg_date)
VALUES 
    (1, '���ο� ���̾�', '��մ� �����Դϴ�3.', '�Ѹ�', SYSDATE);


INSERT INTO BOARD
    (bno, title, writer, reg_date)
VALUES 
    (3, '���ο� ���̾�', '�Ѹ�', SYSDATE);


-- ���̺��� ��� �÷��� ä���� ������ ��� �÷������� ������ �� ����
INSERT INTO BOARD   
VALUES 
    (4, '�ȳ�~4', '��մ� �����Դϴ�.4', '��浿', SYSDATE);
    



-- ������ ����
UPDATE board 
SET title = '������ ����'
WHERE bno = 3;

UPDATE board 
SET content = '�¾����ʹ�~~ '
WHERE bno = 3;

UPDATE board
SET title = '�޷ո޷���'
        , content = '��ȣ��ȣ���P��ȣ~~~'
        , writer = '�ڿ���'
WHERE bno = 1;


-- WHERE���� ������ ��� ��ü���� �����ǹǷ� ����
UPDATE board
SET writer = '������';

UPDATE member
SET age = age + 1;


-- ������ ����
DELETE FROM board
WHERE bno = 1;


INSERT INTO BOARD
    (bno, title, content, writer, reg_date)
VALUES 
    (3, '�ȳ�~', '��մ� �����Դϴ�.', '������', SYSDATE);

COMMIT;

INSERT INTO BOARD
    (bno, title, content, writer, reg_date)
VALUES 
    (4, '�ȳ�~', '��մ� �����Դϴ�.', '������', SYSDATE);

ROLLBACK;

DELETE FROM board
WHERE bno = 1;

SELECT * FROM board;


-- ��ü ������ ����
-- 1. WHERE���� ������ DELETE�� (ROLLBACK����, ����Ŀ�� ����, �α׳���� ����)
DELETE FROM board;
ROLLBACK;

-- 2. TRUNCATE TABLE (�ѹ� �Ұ���, �ڵ�Ŀ��, �α׳�������, ���̺���� �ʱ���·� ���ư�)
TRUNCATE TABLE board;

-- 3. DROP TABLE (�ѹ� �Ұ�, �ڵ�Ŀ��, �α׳�������, ���̺� ������ ���� ������)
DROP TABLE board;












