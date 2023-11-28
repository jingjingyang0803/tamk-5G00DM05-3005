-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-14
-- File: 034-order-by.sql

--================== Task ======================
/*
3.4 Order by 4

Display the name, salary and calculate new salary and
commission for all employees whose commission amount is
greater than their salary increased by 10%. Sort the result by
employee name (alphabetically), salary (lowest first) and
commission (lowest first). Display:

Employee   Monthly Salary Sal 10% Comm
---------- -------------- ------- ----
MARTIN               1250  1375.0 1400
*/


SELECT
    ename AS "Employee",
    sal AS "Monthly Salary",
    sal * 1.1 AS "Sal 10%",
    comm AS "Comm"
FROM
    emp
WHERE
    comm > sal * 1.1
ORDER BY
    "Employee" ASC,
    "Monthly Salary" ASC,
    "Comm" ASC;


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

sqlite> SELECT ename AS "Employee", sal AS "Monthly Salary", sal*1.1 AS "Sal 10%", comm AS "Comm"
...> FROM emp
...> WHERE comm > sal*1.1
...> ORDER BY "Employee" ASC, "Monthly Salary" ASC, "Comm" ASC;
Employee  Monthly Salary  Sal 10%  Comm
--------  --------------  -------  ----
MARTIN    1250            1375.0   1400
*/

-- End of file
