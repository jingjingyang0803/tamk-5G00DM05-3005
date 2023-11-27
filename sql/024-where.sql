-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-14
-- File: 024-where.sql
--================== Task ======================
/*
2.4 Where 4

Display the employee name, job, hiredate between
February 20, 1981 and May 1 1981; including the
beginning and end dates.
 */
SELECT
    ename,
    job,
    hiredate
FROM
    emp
WHERE
    hiredate BETWEEN '1981-02-20' AND '1981-05-01';

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

sqlite> SELECT ename, job, hiredate
...> FROM emp
...> WHERE hiredate BETWEEN '1981-02-20' AND '1981-05-01';
ename  job       hiredate  
-----  --------  ----------
ALLEN  SALESMAN  1981-02-20
WARD   SALESMAN  1981-02-22
JONES  MANAGER   1981-04-02
BLAKE  MANAGER   1981-05-01
 */
-- End of file