-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 083-group-functions.sql

--================== Task ======================
/*
8.3 Group functions 3

Display the highest and lowest salaries for employees
including departments 10 and 30. Label the columns "high" and "low".
*/


SELECT
   deptno,
   MAX(sal) AS "high",
   MIN(sal) AS "low"
FROM
   emp
WHERE
   deptno IN (10, 30)
GROUP BY
   deptno;


--================== Varify =====================
/*
jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- Loading resources from /Users/jingjingyang/.sqliterc
SQLite version 3.39.5 2022-10-14 20:58:05
Enter ".help" for usage hints.

sqlite> SELECT DISTINCT sal
...> FROM emp
...> WHERE deptno IN (10, 30)
...> ORDER BY sal;
sal 
----
950 
1250
1300
1500
1600
2450
2850
5000

sqlite> SELECT MAX(sal) AS "high", MIN(sal) AS "low"
...> FROM emp
...> WHERE deptno IN (10, 30);
high  low
----  ---
5000  950

sqlite> SELECT sal
...> FROM emp
...> WHERE deptno=10
...> ORDER BY sal;
sal 
----
1300
2450
5000

sqlite> SELECT sal
...> FROM emp
...> WHERE deptno=30
...> ORDER BY sal;
sal 
----
950 
1250
1250
1500
1600
2850

sqlite> SELECT deptno, MAX(sal) AS "high", MIN(sal) AS "low"
...> FROM emp
...> WHERE deptno IN (10, 30);
...> GROUP BY deptno;
deptno  high  low 
------  ----  ----
10      5000  1300
30      2850  950 
*/

-- End of file
