-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-14
-- File: 013-query.sql
-----------------------Task---------------------
/*
Create query to display name, job, hiring date and emplyee
number for each employee.
 */
SELECT
        ename,
        job,
        hiredate,
        empno
FROM
        emp;

-------------------------Varify------------------
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
sqlite> SELECT ename, job, hiredate, empno
...> FROM emp;
ename   job        hiredate    empno
------  ---------  ----------  -----
SMITH   CLERK      1980-12-17  7369 
ALLEN   SALESMAN   1981-02-20  7499 
WARD    SALESMAN   1981-02-22  7521 
JONES   MANAGER    1981-04-02  7566 
MARTIN  SALESMAN   1981-09-28  7654 
BLAKE   MANAGER    1981-05-01  7698 
CLARK   MANAGER    1981-06-09  7782 
SCOTT   ANALYST    1982-12-09  7788 
KING    PRESIDENT  1981-11-17  7839 
TURNER  SALESMAN   1981-09-08  7844 
ADAMS   CLERK      1983-01-12  7876 
JAMES   CLERK      1981-12-03  7900 
FORD    ANALYST    1981-12-03  7902 
MILLER  CLERK      1982-01-23  7934
 */
-- End of file