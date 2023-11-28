-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-14
-- File: 014-query.sql
--================== Task ======================

/*

1.4 Query 2

Display name and calculated salaries for all
employees for the first quarter of the year. Ignore
commissions. Display:

ename  first quarter
-----  -------------
*/
 
 
SELECT
    ename,
    (sal * 3) AS "first quarter"
FROM
    emp;


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
sqlite> SELECT ename, (sal * 3) AS "first quarter"
...> FROM emp;
ename   first quarter
------  -------------
SMITH   2400         
ALLEN   4800         
WARD    3750         
JONES   8925         
MARTIN  3750         
BLAKE   8550         
CLARK   7350         
SCOTT   9000         
KING    15000        
TURNER  4500         
ADAMS   3300         
JAMES   2850         
FORD    9000         
MILLER  3900 
*/

-- End of file
