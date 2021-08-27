


SELECT 
    employee_id, first_name, department_id, manager_id
FROM employees;

SELECT 
    department_id, manager_id, department_name
FROM departments;

SELECT 
    A.employee_id, A.first_name
    , D.department_id, D.department_name
FROM employees A, departments D
WHERE a.department_id = d.department_id
;

SELECT 
    A.employee_id, A.first_name
    , department_id, D.department_name
FROM employees A NATURAL JOIN departments D
;

SELECT 
    A.employee_id, A.first_name
    , D.department_id, D.department_name
FROM employees A, departments D
WHERE a.department_id = d.department_id
    AND a.manager_id = d.manager_id
;


SELECT 
    A.employee_id, A.first_name
    , department_id, D.department_name
FROM employees A INNER JOIN departments D
USING (department_id, manager_id)
;






