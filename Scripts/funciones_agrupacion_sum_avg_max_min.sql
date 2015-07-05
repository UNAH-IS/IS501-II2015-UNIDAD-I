--Mostrar los departamentos en los cuales el salario total sea menor que 5000
SELECT  DEPARTMENT_NAME, 
        SUM(SALARY) as salario_total,
        COUNT(*) as cantidad_empleados
FROM EMPLOYEES A
LEFT JOIN DEPARTMENTS B
ON (A.DEPARTMENT_ID = B.DEPARTMENT_ID)
GROUP BY DEPARTMENT_NAME
HAVING SUM(SALARY)<5000;

--Obtener el salario promedio
SELECT AVG(SALARY) SALARIO_PROMEDIO
FROM EMPLOYEES;


--Salario minimo y maximo
SELECT MAX(SALARY), MIN(SALARY)
FROM EMPLOYEES;

SELECT * 
FROM EMPLOYEES
WHERE SALARY = 2100;

SELECT * 
FROM JOBS
WHERE JOB_ID = 'ST_CLERK';

--
SELECT  A.JOB_ID,B.JOB_TITLE,
        AVG(SALARY) SALARIO_PROMEDIO,
        
        COUNT(*) CANTIDAD_EMPLEADOS
FROM EMPLOYEES A
INNER JOIN JOBS B
ON (A.JOB_ID = B.JOB_ID)
GROUP BY A.JOB_ID,B.JOB_TITLE;


