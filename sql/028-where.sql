-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-14
-- File: 028-where.sql

--================== Task ======================
/*
    2.8 Where 8

        [NULL value handling] Display the employee name, salary,
        and commission for all employees who earn commissions.
*/


SELECT ename, sal, comm
FROM emp
WHERE comm IS NOT NULL AND comm != 0;


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

sqlite> SELECT DISTINCT comm
   ...> FROM emp;
comm
----
NULL
300 
500 
1400
0   

sqlite> SELECT ename, sal, comm
   ...> FROM emp
   ...> WHERE comm IS NOT NULL AND comm != 0;
ename   sal   comm
------  ----  ----
ALLEN   1600  300 
WARD    1250  500 
MARTIN  1250  1400
*/

-- End of file
