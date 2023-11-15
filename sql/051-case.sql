-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 051-case.sql

--================== Task ======================
/*
    5.1 Case 1

        Write a query to change all the SALESMAN job
        descriptions to SALES PERSON. Order the results by job
        (alphabetically) and name (alphabetically).

            Name       New Job Name
            ---------- ------------
            FORD       ANALYST
            ..
            ...
            WARD       SALES PERSON
*/


UPDATE emp
SET job = CASE
    WHEN job = 'SALESMAN' THEN 'SALES PERSON'
    ELSE job
END;
SELECT ename AS "Name", job AS "New Job Name"
FROM emp
ORDER BY "New Job Name", "Name";


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

sqlite> SELECT DISTINCT ename
   ...> FROM emp;
ename 
------
SMITH 
ALLEN 
WARD  
JONES 
MARTIN
BLAKE 
CLARK 
SCOTT 
KING  
TURNER
ADAMS 
JAMES 
FORD  
MILLER

sqlite> UPDATE emp
   ...> SET job = CASE
   ...>     WHEN job = 'SALESMAN' THEN 'SALES PERSON'
   ...>     ELSE job
   ...> END;
sqlite> SELECT ename AS "Name", job AS "New Job Name"
   ...> FROM emp
   ...> ORDER BY "New Job Name", "Name";
Name    New Job Name
------  ------------
FORD    ANALYST     
SCOTT   ANALYST     
ADAMS   CLERK       
JAMES   CLERK       
MILLER  CLERK       
SMITH   CLERK       
BLAKE   MANAGER     
CLARK   MANAGER     
JONES   MANAGER     
KING    PRESIDENT   
ALLEN   SALES PERSON
MARTIN  SALES PERSON
TURNER  SALES PERSON
WARD    SALES PERSON
*/

-- End of file
