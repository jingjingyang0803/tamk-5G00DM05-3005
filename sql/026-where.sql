-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-14
-- File: 026-where.sql

--================== Task ======================
/*
    2.6 Where 6

        Display the employee name and salary of employees whose
        salary is more than 1500 and are in department 10 or 30. Label
        the columns "Employee" and "Monthly Salary".
*/


SELECT ename AS 'Employee', sal AS 'Monthly Salary'
FROM emp
WHERE sal > 1500 AND deptno IN (10, 30);


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

sqlite> SELECT ename AS 'Employee', sal AS 'Monthly Salary'
   ...> FROM emp
   ...> WHERE sal > 1500 AND deptno IN (10, 30);
Employee  Monthly Salary
--------  --------------
ALLEN     1600          
BLAKE     2850          
CLARK     2450          
KING      5000 
*/

-- End of file
