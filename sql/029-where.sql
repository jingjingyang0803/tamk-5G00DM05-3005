-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-14
-- File: 029-where.sql

--================== Task ======================
/*
2.9 Where 9

[NULL value handling] Display the employee name and job for
all employees who do not have a manager.
*/


SELECT
   ename,
   job
FROM
   emp
WHERE
   mgr IS NULL;


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

sqlite> SELECT DISTINCT mgr
...> FROM emp;
mgr 
----
7902
7698
7839
7566
NULL
7788
7782

sqlite> SELECT ename, job
...> FROM emp
...> WHERE mgr IS NULL;
ename  job      
-----  ---------
KING   PRESIDENT
*/

-- End of file
