-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-14
-- File: 031-order-by.sql
--================== Task ======================
/*
3.1 Order by 1

1. Display employee name, salary and new column where each
salary is raised by 15%. Display only employees that work
under manager blake. Sort the results by "new salary" (lowest
first) and employee name (alphabetically).

ename sal new salary
----- --- ----------
 */
SELECT
    ename,
    sal,
    sal * 1.15 AS "new salary"
FROM
    emp
WHERE
    mgr = (
        SELECT
            empno
        FROM
            emp
        WHERE
            LOWER(ename) = 'blake'
    )
ORDER BY
    "new salary" ASC,
    ename ASC;

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

sqlite> SELECT ename, sal, sal*1.15 AS "new salary"
...> FROM emp
...> WHERE mgr = (SELECT empno FROM emp WHERE LOWER(ename) = 'blake')
...> ORDER BY "new salary" ASC, ename ASC;
ename   sal   new salary
------  ----  ----------
JAMES   950   1092.5    
MARTIN  1250  1437.5    
WARD    1250  1437.5    
TURNER  1500  1725.0    
ALLEN   1600  1840.0 
 */
-- End of file