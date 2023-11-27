-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-14
-- File: 023-where.sql
--================== Task ======================
/*
2.3 Where 3

Display the employee name and salary (ignore commission)
for all employees whose salary is not in the range 1500 and
2850. Values 1500 and 2850 are not included.
 */
SELECT
    ename,
    sal
FROM
    emp
WHERE
    sal NOT BETWEEN 1500 AND 2850;

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
sqlite> SELECT ename, sal
...> FROM emp
...> WHERE sal NOT BETWEEN 1500 AND 2850;
ename   sal 
------  ----
SMITH   800 
WARD    1250
JONES   2975
MARTIN  1250
SCOTT   3000
KING    5000
ADAMS   1100
JAMES   950 
FORD    3000
MILLER  1300
 */
-- End of file