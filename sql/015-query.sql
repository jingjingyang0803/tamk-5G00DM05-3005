-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-14
-- File: 015-query.sql

--================== Task ======================
/*
    1.5 Query 3

        Create a query to display unique jobs. Order
        alphabetically.

                job
                --------
                ANALYST
                CLERK
                MANAGER
                PRESIDENT
                SALESMAN
*/


SELECT DISTINCT job
FROM emp
ORDER BY job;


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
sqlite> SELECT DISTINCT job
   ...> FROM emp
   ...> ORDER BY job;
job      
---------
ANALYST  
CLERK    
MANAGER  
PRESIDENT
SALESMAN 
*/

-- End of file
