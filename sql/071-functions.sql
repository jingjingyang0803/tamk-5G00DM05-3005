-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 071-functions.sql

--================== Task ======================
/*
    7.1 Functions 1

        Write a query to display all results for all employees in
        lowercase. Order the reults by name (alphabetically) and job
        (alphabetically).

            Name       Job          Salary
            ---------- --------- ---------
            ...
            blake      manager        2850
            ...
            king       president      5000
            ...
*/


SELECT LOWER(ename) AS Name, LOWER(job) AS Job, sal AS Salary
FROM emp
ORDER BY Name, Job;


--================== Varify =====================
/*
jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db < create.sql
jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- Loading resources from /Users/jingjingyang/.sqliterc
SQLite version 3.39.5 2022-10-14 20:58:05
Enter ".help" for usage hints.

sqlite> SELECT LOWER(ename) AS Name, LOWER(job) AS Job, sal AS Salary
   ...> FROM emp
   ...> ORDER BY Name, Job;
Name    Job        Salary
------  ---------  ------
adams   clerk      1100  
allen   salesman   1600  
blake   manager    2850  
clark   manager    2450  
ford    analyst    3000  
james   clerk      950   
jones   manager    2975  
king    president  5000  
martin  salesman   1250  
miller  clerk      1300  
scott   analyst    3000  
smith   clerk      800   
turner  salesman   1500  
ward    salesman   1250  
*/

-- End of file
