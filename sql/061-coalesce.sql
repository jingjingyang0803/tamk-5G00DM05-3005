-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 061-coalesce.sql

--================== Task ======================
-- /*
-- 6.1 Coalesce 1

-- Display report for employees in department 30. Display zero
-- for all who do not earn comission. Sort the results name
-- (alphabetically) and commission (lowest first).

-- deptno  ename    comm
-- ------  -----    ----
-- 30      ALLEN    300
-- 30      BLAKE    0
-- ...
-- */
 
 
SELECT
   deptno,
   ename,
   COALESCE(comm, 0) AS comm
FROM
   emp
WHERE
   deptno = 30
ORDER BY
   ename ASC,
   comm ASC;


--================== Varify =====================
-- /*
-- jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db < create.sql
-- jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- -- Loading resources from /Users/jingjingyang/.sqliterc
-- SQLite version 3.39.5 2022-10-14 20:58:05
-- Enter ".help" for usage hints.

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

-- sqlite> SELECT deptno, ename, COALESCE(comm, 0) AS comm
-- ...> FROM emp
-- ...> WHERE deptno = 30
-- ...> ORDER BY ename, comm;
-- deptno  ename   comm
-- ------  ------  ----
-- 30      ALLEN   300 
-- 30      BLAKE   0   
-- 30      JAMES   0   
-- 30      MARTIN  1400
-- 30      TURNER  0   
-- 30      WARD    500 
-- */

-- End of file
