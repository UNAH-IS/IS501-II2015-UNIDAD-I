--Borrar vista materializada
DROP MATERIALIZED VIEW MVW_EMPLOYEES;

--Crear una vista materializada
CREATE MATERIALIZED VIEW MVW_EMPLOYEES
REFRESH ON DEMAND
AS
SELECT A.FIRST_NAME || ' ' || A.LAST_NAME AS NAME,
      A.EMAIL,
      A.PHONE_NUMBER,
      A.HIRE_DATE,
      A.SALARY,
      C.JOB_TITLE,
      E.DEPARTMENT_NAME,
      F.CITY AS DEPARTMENT_CITY,
      G.COUNTRY_NAME AS DEPARTMENT_COUNTRY_NAME,
      H.REGION_NAME AS DEPARTMENT_REGION_NAME,
      B.FIRST_NAME || ' ' || B.LAST_NAME AS MANAGER_NAME,
      D.JOB_TITLE AS MANAGER_JOB_TITLE
FROM EMPLOYEES A
LEFT JOIN EMPLOYEES B
ON (A.MANAGER_ID = B.EMPLOYEE_ID)
INNER JOIN JOBS C
  ON (A.JOB_ID = C.JOB_ID)
LEFT JOIN JOBS D
  ON (B.JOB_ID = D.JOB_ID)
LEFT JOIN DEPARTMENTS E
  ON (A.DEPARTMENT_ID = E.DEPARTMENT_ID)
LEFT JOIN LOCATIONS F
  ON (E.LOCATION_ID = F.LOCATION_ID)
LEFT JOIN COUNTRIES G
  ON (F.COUNTRY_ID = G.COUNTRY_ID)
LEFT JOIN REGIONS H
  ON (G.REGION_ID = H.REGION_ID);
  
  
--Actualizar vista materializada  
EXECUTE DBMS_MVIEW.REFRESH('MVW_EMPLOYEES');
  
--Consultar vista materializada
SELECT * 
FROM MVW_EMPLOYEES;