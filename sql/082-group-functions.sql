-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 082-group-functions.sql
--================== Task ======================
/*
8.2 Group functions 2

How many employees work in department 30? Label the column
"count of dept 30",
 */
SELECT
   COUNT(DISTINCT empno) AS "count of dept 30"
FROM
   emp
WHERE
   deptno = 30;

--================== Varify =====================
/*
jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- Loading resources from /Users/jingjingyang/.sqliterc
SQLite version 3.39.5 2022-10-14 20:58:05
Enter ".help" for usage hints. 

sqlite> SELECT * FROM emp 
...> WHERE deptno = 30;
empno  ename   job       mgr   hiredate    sal   comm  deptno
-----  ------  --------  ----  ----------  ----  ----  ------
7499   ALLEN   SALESMAN  7698  1981-02-20  1600  300   30    
7521   WARD    SALESMAN  7698  1981-02-22  1250  500   30    
7654   MARTIN  SALESMAN  7698  1981-09-28  1250  1400  30    
7698   BLAKE   MANAGER   7839  1981-05-01  2850  NULL  30    
7844   TURNER  SALESMAN  7698  1981-09-08  1500  0     30    
7900   JAMES   CLERK     7698  1981-12-03  950   NULL  30   

sqlite> SELECT COUNT(DISTINCT empno) AS "count of dept 30"
...> FROM emp
...> WHERE deptno = 30;
count of dept 30
----------------
6 
 */
-- End of file