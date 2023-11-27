-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-14
-- File: 032-order-by.sql
--================== Task ======================
/*
3.2 Order by 2

2. Display employee number, name, department number and hiring
date for all employees whose ID number is above 7900
or below 7600. Sort the results by the employee
number (lowest first).
 */
SELECT
    empno,
    ename,
    deptno,
    hiredate
FROM
    emp
WHERE
    empno > 7900
    OR empno < 7600
ORDER BY
    empno ASC;

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

sqlite> SELECT empno, ename, deptno, hiredate
...> FROM emp
...> WHERE empno > 7900 OR empno < 7600
...> ORDER BY empno ASC;
empno  ename   deptno  hiredate  
-----  ------  ------  ----------
7369   SMITH   20      1980-12-17
7499   ALLEN   30      1981-02-20
7521   WARD    30      1981-02-22
7566   JONES   20      1981-04-02
7902   FORD    20      1981-12-03
7934   MILLER  10      1982-01-23
 */
-- End of file