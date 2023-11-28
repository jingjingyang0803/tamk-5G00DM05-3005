-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 052-case.sql

--================== Task ======================
-- /*
-- 5.2 Case 2

-- Every employee in department 30 is entitled to commission as follows:
-- display 100 basic comission for everyone who haven't had it
-- previously and those who already earn commission, get 5%
-- increase. Other departments are not affected. Sort the results
-- by updated commission (lowest first) and name
-- (alphabetically). Display results for all employees:

-- ename comm
-- ----- ----
-- */


SELECT
   ename,
   CASE
      WHEN deptno = 30 AND comm IS NOT NULL THEN comm * 1.05
      WHEN deptno = 30 AND (comm IS NULL OR comm = 0) THEN 100
      ELSE comm
   END AS comm
FROM
   emp
ORDER BY
   comm ASC,
   ename ASC;


--================== Varify =====================
-- /*
-- jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- -- Loading resources from /Users/jingjingyang/.sqliterc
-- SQLite version 3.39.5 2022-10-14 20:58:05
-- Enter ".help" for usage hints.

-- sqlite> SELECT * FROM emp;
-- empno  ename   job           mgr   hiredate    sal   comm  deptno
-- -----  ------  ------------  ----  ----------  ----  ----  ------
-- 7369   SMITH   CLERK         7902  1980-12-17  800   NULL  20    
-- 7499   ALLEN   SALES PERSON  7698  1981-02-20  1600  300   30    
-- 7521   WARD    SALES PERSON  7698  1981-02-22  1250  500   30    
-- 7566   JONES   MANAGER       7839  1981-04-02  2975  NULL  20    
-- 7654   MARTIN  SALES PERSON  7698  1981-09-28  1250  1400  30    
-- 7698   BLAKE   MANAGER       7839  1981-05-01  2850  NULL  30    
-- 7782   CLARK   MANAGER       7839  1981-06-09  2450  NULL  10    
-- 7788   SCOTT   ANALYST       7566  1982-12-09  3000  NULL  20    
-- 7839   KING    PRESIDENT     NULL  1981-11-17  5000  NULL  10    
-- 7844   TURNER  SALES PERSON  7698  1981-09-08  1500  0     30    
-- 7876   ADAMS   CLERK         7788  1983-01-12  1100  NULL  20    
-- 7900   JAMES   CLERK         7698  1981-12-03  950   NULL  30    
-- 7902   FORD    ANALYST       7566  1981-12-03  3000  NULL  20    
-- 7934   MILLER  CLERK         7782  1982-01-23  1300  NULL  10 

-- sqlite> SELECT * FROM emp 
-- ...> WHERE deptno = 30;
-- empno  ename   job       mgr   hiredate    sal   comm  deptno
-- -----  ------  --------  ----  ----------  ----  ----  ------
-- 7499   ALLEN   SALESMAN  7698  1981-02-20  1600  300   30    
-- 7521   WARD    SALESMAN  7698  1981-02-22  1250  500   30    
-- 7654   MARTIN  SALESMAN  7698  1981-09-28  1250  1400  30    
-- 7698   BLAKE   MANAGER   7839  1981-05-01  2850  NULL  30    
-- 7844   TURNER  SALESMAN  7698  1981-09-08  1500  0     30    
-- 7900   JAMES   CLERK     7698  1981-12-03  950   NULL  30    

-- sqlite> UPDATE emp
-- ...> SET comm = CASE
-- ...>     WHEN deptno = 30 AND comm IS NOT NULL THEN comm * 1.05
-- ...>     WHEN deptno = 30 AND (comm IS NULL OR comm = 0) THEN 100
-- ...>     ELSE comm
-- ...> END;
-- sqlite> SELECT ename, comm
-- ...> FROM emp
-- ...> ORDER BY comm, ename;
-- ename   comm
-- ------  ----
-- ADAMS   NULL
-- CLARK   NULL
-- FORD    NULL
-- JONES   NULL
-- KING    NULL
-- MILLER  NULL
-- SCOTT   NULL
-- SMITH   NULL
-- TURNER  0   
-- BLAKE   100 
-- JAMES   100 
-- ALLEN   315 
-- WARD    525 
-- MARTIN  1470
-- */

-- End of file
