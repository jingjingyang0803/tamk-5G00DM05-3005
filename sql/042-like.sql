-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-14
-- File: 042-like.sql
--================== Task ======================
/*
4.2 Like 2

Display name and department of every employees who have a
 *vowel* (aeiouy or in uppercase) at the second character and
whose work description includes sales or analysis. Sort the
results by the department number (lowest first) and person
name (alphabetically). Display:

Name       Department
---------- ----------
KING               10
MILLER             10
FORD               20
JONES              20
JAMES              30
...
|
Look at character 2, which must be a vowel
 */
SELECT
   ename AS Name,
   deptno AS Department
FROM
   emp
WHERE
   ename REGEXP '^.[aeiouyAEIOUY]'
   AND (
      job LIKE '%sales%'
      OR job LIKE '%analysis%'
   )
ORDER BY
   deptno ASC,
   ename ASC;

-- In SQLite, the LIKE operator is case-insensitive by default. 
-- This means it does not differentiate between upper and lower case.
-- so why we need to use: LOWER(job) LIKE '%sales%'?
--================== Alternative Solution =====================
/*
SELECT ename AS Name, deptno AS Department
FROM emp
WHERE (ename LIKE '_a%' OR ename LIKE '_e%' OR ename LIKE '_i%' OR ename LIKE '_o%' OR ename LIKE '_u%' OR ename LIKE '_y%') AND (job LIKE '%sales%' OR job LIKE '%analysis%')
ORDER BY deptno ASC, ename ASC;
 */
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

sqlite> SELECT DISTINCT job
...> FROM emp;
job      
---------
CLERK    
SALESMAN 
MANAGER  
ANALYST  
PRESIDENT

sqlite> SELECT ename AS Name, deptno AS Department
...> FROM emp
...> WHERE (ename LIKE '_a%' OR ename LIKE '_e%' OR ename LIKE '_i%' OR ename LIKE '_o%' OR ename LIKE '_u%' OR ename LIKE '_y%')
...> ORDER BY deptno ASC, ename ASC;
Name    Department
------  ----------
KING    10        
MILLER  10        
FORD    20        
JONES   20        
JAMES   30        
MARTIN  30        
TURNER  30        
WARD    30

sqlite> SELECT ename AS Name, deptno AS Department
...> FROM emp
...> WHERE (ename LIKE '_a%' OR ename LIKE '_e%' OR ename LIKE '_i%' OR ename LIKE '_o%' OR ename LIKE '_u%' OR ename LIKE '_y%') AND (job LIKE '%sales%' OR job LIKE '%analysis%')
...> ORDER BY deptno ASC, ename ASC;
Name    Department
------  ----------
MARTIN  30        
TURNER  30        
WARD    30 

sqlite> SELECT ename AS Name, deptno AS Department
...> FROM emp
...> WHERE ename REGEXP '^.[aeiouyAEIOUY]' AND (job LIKE '%sales%' OR job LIKE '%analysis%')
...> ORDER BY deptno ASC, ename ASC;
Name    Department
------  ----------
MARTIN  30        
TURNER  30        
WARD    30 
 */
-- End of file