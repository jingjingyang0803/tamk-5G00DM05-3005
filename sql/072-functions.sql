-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 072-functions.sql

--================== Task ======================
/*
    7.2 Functions 2

        Write query to display following report for all employees.
        Pay attention to the _order_ of the displayed rows.

            Name        Characters
            ----------  ----------
            ford        4
            king        4
            ward        4
            adams       5
            allen       5
            blake       5
            clark       5
            james       5
            jones       5
            scott       5
            smith       5
            martin      6
            miller      6
            turner      6
*/


SELECT LOWER(ename) AS Name, LENGTH(ename) AS Characters
FROM emp
ORDER BY Characters, Name;


--================== Varify =====================
/*
jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- Loading resources from /Users/jingjingyang/.sqliterc
SQLite version 3.39.5 2022-10-14 20:58:05
Enter ".help" for usage hints.

sqlite> SELECT LOWER(ename) AS Name, LENGTH(ename) AS Characters
   ...> FROM emp
   ...> ORDER BY Characters, Name;
Name    Characters
------  ----------
ford    4         
king    4         
ward    4         
adams   5         
allen   5         
blake   5         
clark   5         
james   5         
jones   5         
scott   5         
smith   5         
martin  6         
miller  6         
turner  6 
*/

-- End of file
