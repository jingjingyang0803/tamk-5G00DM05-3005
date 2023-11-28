-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 074-functions.sql

--================== Task ======================
/*
7.4 Functions 4

Write a query to display the employee's name and job title
in lowercae for all employees whose name starts with letter `a',
`m' or `j'. Order the results by name (alphabeticaly) and job
(alphabetically). Display results for all employees: leave
other empoyees' job titles unaffected.

ename           job
-------------   ---------
ADAMS           clerk
ALLEN           salesman
BLAKE           MANAGER
...
JAMES           clerk
...
*/


SELECT
    ename,
    CASE
        WHEN ename LIKE 'a%'
        OR ename LIKE 'm%'
        OR ename LIKE 'j%' THEN LOWER(job)
        ELSE job
    END AS job
FROM
    emp
ORDER BY
    ename,
    job;


--================== Alternative solution =====================
/*
SELECT ename,
CASE
WHEN SUBSTR(ename,1,1) IN ('A', 'M', 'J') THEN LOWER(job)
ELSE job
END AS job
FROM emp
ORDER BY ename, job;
 */
--================== Varify =====================
/*
jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db < create.sql
jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- Loading resources from /Users/jingjingyang/.sqliterc
SQLite version 3.39.5 2022-10-14 20:58:05
Enter ".help" for usage hints.

sqlite> SELECT ename,
...>        CASE
...>            WHEN ename LIKE 'a%' OR ename LIKE 'm%' OR ename LIKE 'j%' THEN LOWER(job)
...>            ELSE job
...>        END AS job
...> FROM emp
...> ORDER BY ename, job;
ename   job      
------  ---------
ADAMS   clerk    
ALLEN   salesman 
BLAKE   MANAGER  
CLARK   MANAGER  
FORD    ANALYST  
JAMES   clerk    
JONES   manager  
KING    PRESIDENT
MARTIN  salesman 
MILLER  clerk    
SCOTT   ANALYST  
SMITH   CLERK    
TURNER  SALESMAN 
WARD    SALESMAN 

sqlite> SELECT ename,
...>        CASE
...>            WHEN SUBSTR(ename,1,1) IN ('A', 'M', 'J') THEN LOWER(job)
...>            ELSE job
...>        END AS job
...> FROM emp
...> ORDER BY ename, job;
ename   job      
------  ---------
ADAMS   clerk    
ALLEN   salesman 
BLAKE   MANAGER  
CLARK   MANAGER  
FORD    ANALYST  
JAMES   clerk    
JONES   manager  
KING    PRESIDENT
MARTIN  salesman 
MILLER  clerk    
SCOTT   ANALYST  
SMITH   CLERK    
TURNER  SALESMAN 
WARD    SALESMAN 
*/

-- End of file
