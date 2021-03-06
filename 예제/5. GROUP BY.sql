

-- 1. 집계 함수

-- 단일행 함수: 모든 행 하나하나당 함수를 적용
SELECT 
    SUBSTR(emp_nm, 1, 1) AS 성씨
FROM tb_emp;

-- 다중행 함수: 여러 행을 묶어서 함수를 적용
SELECT * FROM tb_sal_his;

SELECT 
    SUM(pay_amt) AS 지급총액
    , AVG(pay_amt) AS 평균지급액
FROM tb_sal_his;


SELECT 
    COUNT(emp_no) AS "총 사원수"
    , MAX(birth_de) AS "최연소자의 생일"
    , MIN(birth_de) AS "최연장자의 생일"
FROM tb_emp;


SELECT 
    COUNT(direct_manager_emp_no)
FROM tb_emp;

SELECT 
    COUNT(*)
FROM tb_emp;



-- 2. GROUP BY

-- 부서별로 가장 어린사람의 생일, 가장 연장자의 생일, 부서별 총 직원수를 조회
SELECT emp_nm, dept_cd, birth_de FROM tb_emp ORDER BY dept_cd;

SELECT 
    dept_cd
    , MAX(birth_de) AS "최연소자"
    , MIN(birth_de) AS "최연장자"
    , COUNT(emp_no) AS "직원수"
FROM tb_emp
GROUP BY dept_cd 
ORDER BY dept_cd
;


-- HAVING : 그룹화된 결과에서 조건을 걸어 행 수를 제한

SELECT 
    dept_cd
    , MAX(birth_de) AS "최연소자"
    , MIN(birth_de) AS "최연장자"
    , COUNT(emp_no) AS "직원수"
FROM tb_emp
GROUP BY dept_cd 
HAVING COUNT(*) >= 2
ORDER BY dept_cd
;


-- 사원별로 월급을 제일 많이 받았을 때 액수, 가장 적게받았을 때 액수, 평균액수 조회
SELECT * FROM tb_sal_his
ORDER BY emp_no, pay_de;


SELECT 
    emp_no
    , MAX(pay_amt) AS "최고 수령액"
    , MIN(pay_amt) AS "최저 수령액"
    , TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999') AS "평균 수령액"
FROM tb_sal_his
GROUP BY emp_no
ORDER BY emp_no
;

-- 평균 수령액이 450만원 이상인 사원만 조회
SELECT 
    emp_no
    , MAX(pay_amt) AS "최고 수령액"
    , MIN(pay_amt) AS "최저 수령액"
    , TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999') AS "평균 수령액"
FROM tb_sal_his
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no
;

-- 사원별로 2019년도 급여수령액 중 최고수령액, 최저수령액, 평균수령액 조회
SELECT 
    emp_no
    , MAX(pay_amt) AS "최고 수령액"
    , MIN(pay_amt) AS "최저 수령액"
    , TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999') AS "평균 수령액"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
ORDER BY emp_no
;
-- 사원별로 2019년도 평균수령액이 450만원 이상인 사람만 조회
SELECT 
    emp_no
    , MAX(pay_amt) AS "최고 수령액"
    , MIN(pay_amt) AS "최저 수령액"
    , TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999') AS "평균 수령액"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no
;


-- 추가로 2019년 연봉을 추가로 조회
SELECT 
    emp_no
    , MAX(pay_amt) AS "최고 수령액"
    , MIN(pay_amt) AS "최저 수령액"
    , TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999') AS "평균 수령액"
    , TO_CHAR(SUM(pay_amt), 'L999,999,999') AS "연봉"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
ORDER BY emp_no
;


-- ORDER BY : 정렬
-- ASC : 오름차 정렬(기본값) // DESC : 내림차 정렬
-- 항상 SELECT절의 맨 밑줄에 위치
SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_no DESC
;

SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_nm DESC
;

SELECT emp_no AS 사번, emp_nm AS 이름, addr AS 주소
FROM tb_emp
ORDER BY 사번 DESC
;

SELECT emp_no AS 사번, emp_nm AS 이름, addr AS 주소
FROM tb_emp
ORDER BY 2 DESC
;

SELECT emp_no AS 사번, emp_nm AS 이름, addr AS 주소
FROM tb_emp
ORDER BY emp_nm ASC, emp_no DESC
;

SELECT emp_no AS 사번, emp_nm AS 이름, addr AS 주소
FROM tb_emp
ORDER BY 2, 1 DESC
;
SELECT emp_no AS 사번, emp_nm AS 이름, addr AS 주소
FROM tb_emp
ORDER BY 이름, 1 DESC
;


SELECT direct_manager_emp_no FROM tb_emp
ORDER BY direct_manager_emp_no DESC;
















