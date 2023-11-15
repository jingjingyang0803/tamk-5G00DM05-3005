-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 062-coalesce.sql

--================== Task ======================
/*
    6.2 Coalesce 2

        Display the *total* *net* *income* of each employee per month.
        The total income is result of salary and comission which both
        are paid monthly. The salary's tax rate is 31% and comission's
        tax rate is 20%. Sort the results by the net income (lowest
        first).

            Name     Net Income Tax
            -------- ---------- -------
            SMITH    1600       408
            JAMES    1900       484
            ...
*/


SELECT
    ename AS 'Name',
    (sal + COALESCE(comm, sal)) AS 'Net Income',
    CAST(ROUND(sal * 0.31 + COALESCE(comm, sal) * 0.20) AS INTEGER) AS 'Tax'
FROM emp
ORDER BY [Net Income];

-- ??? I can only get (SMITH    1600       408, JAMES    1900       484) by setting null comission same value as salary, 
-- but the results are not same as required then. 
-- is there updates of create.sql? Maybe some difference in the test.db.


--================== Varify =====================
/*
jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- Loading resources from /Users/jingjingyang/.sqliterc
SQLite version 3.39.5 2022-10-14 20:58:05
Enter ".help" for usage hints.

sqlite> SELECT * FROM emp;
empno  ename   job        mgr   hiredate    sal   comm  deptno
-----  ------  ---------  ----  ----------  ----  ----  ------
7369   SMITH   CLERK      7902  1980-12-17  800   NULL  20    
7499   ALLEN   SALESMAN   7698  1981-02-20  1600  300   30    
7521   WARD    SALESMAN   7698  1981-02-22  1250  500   30    
7566   JONES   MANAGER    7839  1981-04-02  2975  NULL  20    
7654   MARTIN  SALESMAN   7698  1981-09-28  1250  1400  30    
7698   BLAKE   MANAGER    7839  1981-05-01  2850  NULL  30    
7782   CLARK   MANAGER    7839  1981-06-09  2450  NULL  10    
7788   SCOTT   ANALYST    7566  1982-12-09  3000  NULL  20    
7839   KING    PRESIDENT  NULL  1981-11-17  5000  NULL  10    
7844   TURNER  SALESMAN   7698  1981-09-08  1500  0     30    
7876   ADAMS   CLERK      7788  1983-01-12  1100  NULL  20    
7900   JAMES   CLERK      7698  1981-12-03  950   NULL  30    
7902   FORD    ANALYST    7566  1981-12-03  3000  NULL  20    
7934   MILLER  CLERK      7782  1982-01-23  1300  NULL  10  

sqlite> SELECT
   ...>     ename AS 'Name',
   ...>     (sal + COALESCE(comm, sal)) AS 'Net Income',
   ...>     CAST(ROUND(sal * 0.31 + COALESCE(comm, sal) * 0.20) AS INTEGER) AS 'Tax'
   ...> FROM emp
   ...> ORDER BY [Net Income];
Name    Net Income  Tax 
------  ----------  ----
TURNER  1500        465 
SMITH   1600        408 
WARD    1750        488 
ALLEN   1900        556 
JAMES   1900        485 
ADAMS   2200        561 
MILLER  2600        663 
MARTIN  2650        668 
CLARK   4900        1250
BLAKE   5700        1454
JONES   5950        1517
SCOTT   6000        1530
FORD    6000        1530
KING    10000       2550
*/

-- End of file