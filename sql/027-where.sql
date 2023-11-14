-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-14
-- File: 027-where.sql

--================== Task ======================
/*
    2.7 Where 7

        7. Display the employee name, job, and salary for all
        employees whose job is CLERK or ANALYST and their salary is
        not equal to 1000 or 5000.
*/


SELECT ename, job, sal
FROM emp
WHERE job IN ('CLERK', 'ANALYST') AND sal NOT IN (1000, 5000);


--================== Varify =====================
/*
jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- Loading resources from /Users/jingjingyang/.sqliterc
SQLite version 3.39.5 2022-10-14 20:58:05
Enter ".help" for usage hints.

sqlite> PRAGMA table_info(emp);
cid  name      type          notnull  dflt_value  pk
---  --------  ------------  -------  ----------  --
0    empno     INTEGER       1        NULL        1 
1    ename     VARCHAR(10)   0        NULL        0 
2    job       VARCHAR(9)    0        NULL        0 
3    mgr       INTEGER       0        NULL        0 
4    hiredate  DATE          0        NULL        0 
5    sal       NUMERIC(7,2)  0        NULL        0 
6    comm      NUMERIC(7,2)  0        NULL        0 
7    deptno    INTEGER       1        NULL        0 

sqlite> SELECT ename, job, sal
   ...> FROM emp
   ...> WHERE job IN ('CLERK', 'ANALYST') AND sal NOT IN (1000, 5000);
ename   job      sal 
------  -------  ----
SMITH   CLERK    800 
SCOTT   ANALYST  3000
ADAMS   CLERK    1100
JAMES   CLERK    950 
FORD    ANALYST  3000
MILLER  CLERK    1300
*/

-- End of file
