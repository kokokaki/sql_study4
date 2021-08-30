

-- # ������ ��������
-- ���������� ��ȸ ����� 1�� ������ ���

-- �μ���ȣ�� 100004���� �μ��� ��� ������� ��ȸ
SELECT
 *
FROM tb_emp
WHERE dept_cd = '100004'
;

-- �̳��� �����ִ� �μ��� ��� ������� ��ȸ
SELECT
 *
FROM tb_emp
WHERE dept_cd = (SELECT dept_cd FROM tb_emp WHERE emp_nm = '�̳���')
;


-- 20200525�� ���� �޿��� ȸ���� 20200525�� ��ü ��� �޿����� ���� ������� ������� ��ȸ

SELECT 
    A.emp_no, A.emp_nm
    , B.pay_de, B.pay_amt
FROM tb_emp A 
JOIN tb_sal_his B
ON A.emp_no = B.emp_no
WHERE B.pay_de = '20200525'
        AND B.pay_amt >= (
                                            SELECT 
                                                AVG(pay_amt)
                                            FROM tb_sal_his
                                            WHERE pay_de = '20200525'
                                        )
ORDER BY A.emp_no, B.pay_de
;


-- ȸ�� 5�� �޿����
SELECT 
    AVG(pay_amt)
FROM tb_sal_his
WHERE pay_de = '20200525'
;



-- # ���� �� �������� 
-- ���������� ��ȸ �Ǽ��� ���� ���� ��

-- �ѱ������ͺ��̽���������� �߱��� �ڰ����� ������ �ִ�
-- ����� �����ȣ�� ����̸��� �ڰ��� ������ ��ȸ

SELECT * FROM tb_certi WHERE issue_insti_nm = '�ѱ������ͺ��̽������';


SELECT 
    A.emp_no, B.emp_nm, COUNT(A.certi_cd)
FROM tb_emp_certi A
JOIN tb_emp B
ON A.emp_no = B.emp_no
WHERE A.certi_cd IN (SELECT certi_cd FROM tb_certi WHERE issue_insti_nm = '�ѱ������ͺ��̽������')
GROUP BY A.emp_no, B.emp_nm
ORDER BY A.emp_no
;











