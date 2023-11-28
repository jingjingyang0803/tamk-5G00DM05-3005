-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-14
-- File: 042-like.sql

--================== Task ======================
-- /*
-- 4.2 Like 2

-- Display name and department of every employees who have a
--  *vowel* (aeiouy or in uppercase) at the second character and
-- whose work description includes sales or analysis. Sort the
-- results by the department number (lowest first) and person
-- name (alphabetically). Display:

-- Name       Department
-- ---------- ----------
-- KING               10
-- MILLER             10
-- FORD               20
-- JONES              20
-- JAMES              30
-- ...
-- |
-- Look at character 2, which must be a vowel
-- */


SELECT
   ename AS Name,
   deptno AS Department
FROM
   emp
WHERE
   ename REGEXP '^.[aeiouyAEIOUY]'
   AND (
      LOWER(job) LIKE '%salesman%'
      OR LOWER(job) LIKE '%analyst%'
   )
ORDER BY
   deptno ASC,
   ename ASC;

-- In SQLite, the LIKE operator is case-insensitive by default. 
-- This means it does not differentiate between upper and lower case.
-- so why we need to use: LOWER(job) LIKE '%sales%'?


--================== Alternative Solution =====================
-- /*
-- SELECT ename AS Name, deptno AS Department
-- FROM emp
-- WHERE (ename LIKE '_a%' OR ename LIKE '_e%' OR ename LIKE '_i%' OR ename LIKE '_o%' OR ename LIKE '_u%' OR ename LIKE '_y%') AND (job LIKE '%sales%' OR job LIKE '%analysis%')
-- ORDER BY deptno ASC, ename ASC;
--  */
-- --================== Varify =====================
-- /*
-- jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- -- Loading resources from /Users/jingjingyang/.sqliterc
-- SQLite version 3.39.5 2022-10-14 20:58:05
-- Enter ".help" for usage hints.

-- sqlite> SELECT * FROM emp;
-- empno  ename   job        mgr   hiredate    sal   comm  deptno
-- -----  ------  ---------  ----  ----------  ----  ----  ------
-- 7369   SMITH   CLERK      7902  1980-12-17  800   NULL  20    
-- 7499   ALLEN   SALESMAN   7698  1981-02-20  1600  300   30    
-- 7521   WARD    SALESMAN   7698  1981-02-22  1250  500   30    
-- 7566   JONES   MANAGER    7839  1981-04-02  2975  NULL  20    
-- 7654   MARTIN  SALESMAN   7698  1981-09-28  1250  1400  30    
-- 7698   BLAKE   MANAGER    7839  1981-05-01  2850  NULL  30    
-- 7782   CLARK   MANAGER    7839  1981-06-09  2450  NULL  10    
-- 7788   SCOTT   ANALYST    7566  1982-12-09  3000  NULL  20    
-- 7839   KING    PRESIDENT  NULL  1981-11-17  5000  NULL  10    
-- 7844   TURNER  SALESMAN   7698  1981-09-08  1500  0     30    
-- 7876   ADAMS   CLERK      7788  1983-01-12  1100  NULL  20    
-- 7900   JAMES   CLERK      7698  1981-12-03  950   NULL  30    
-- 7902   FORD    ANALYST    7566  1981-12-03  3000  NULL  20    
-- 7934   MILLER  CLERK      7782  1982-01-23  1300  NULL  10 

-- sqlite> SELECT DISTINCT job
-- ...> FROM emp;
-- job      
-- ---------
-- CLERK    
-- SALESMAN 
-- MANAGER  
-- ANALYST  
-- PRESIDENT

-- sqlite> SELECT ename AS Name, deptno AS Department
-- ...> FROM emp
-- ...> WHERE (ename LIKE '_a%' OR ename LIKE '_e%' OR ename LIKE '_i%' OR ename LIKE '_o%' OR ename LIKE '_u%' OR ename LIKE '_y%')
-- ...> ORDER BY deptno ASC, ename ASC;
-- Name    Department
-- ------  ----------
-- KING    10        
-- MILLER  10        
-- FORD    20        
-- JONES   20        
-- JAMES   30        
-- MARTIN  30        
-- TURNER  30        
-- WARD    30

-- sqlite> SELECT ename AS Name, deptno AS Department
-- ...> FROM emp
-- ...> WHERE (ename LIKE '_a%' OR ename LIKE '_e%' OR ename LIKE '_i%' OR ename LIKE '_o%' OR ename LIKE '_u%' OR ename LIKE '_y%') AND (job LIKE '%sales%' OR job LIKE '%analysis%')
-- ...> ORDER BY deptno ASC, ename ASC;
-- Name    Department
-- ------  ----------
-- MARTIN  30        
-- TURNER  30        
-- WARD    30 

-- sqlite> SELECT ename AS Name, deptno AS Department
-- ...> FROM emp
-- ...> WHERE ename REGEXP '^.[aeiouyAEIOUY]' AND (job LIKE '%sales%' OR job LIKE '%analysis%')
-- ...> ORDER BY deptno ASC, ename ASC;
-- Name    Department
-- ------  ----------
-- MARTIN  30        
-- TURNER  30        
-- WARD    30 
-- */

-- End of file
