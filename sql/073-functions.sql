-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 073-functions.sql

--================== Task ======================
/*
    7.3 Functions 3

        Display the employee number, employee name and "new salary"
        which is salary increased by 15%. Add column "increase
        that substracts salary from the "new salary".
        Round the values to whole numbers. Order the results by name
        (alphabetically) and "new salary" (lowest first).

            empno  ename new salary increase
            -----  ----- ---------- --------
*/


SELECT empno, ename, CAST(ROUND(sal * 1.15) AS INTEGER) AS 'new salary', CAST(ROUND(sal * 1.15) - sal AS INTEGER) AS increase
FROM emp
ORDER BY ename, [new salary];


--================== Varify =====================
/*
jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db < create.sql
jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- Loading resources from /Users/jingjingyang/.sqliterc
SQLite version 3.39.5 2022-10-14 20:58:05
Enter ".help" for usage hints.

sqlite> SELECT empno, ename, CAST(ROUND(sal * 1.15) AS INTEGER) AS 'new salary', CAST(ROUND(sal * 1.15) - sal AS INTEGER) AS increase
   ...> FROM emp
   ...> ORDER BY ename, [new salary];
empno  ename   new salary  increase
-----  ------  ----------  --------
7876   ADAMS   1265        165     
7499   ALLEN   1840        240     
7698   BLAKE   3277        427     
7782   CLARK   2818        368     
7902   FORD    3450        450     
7900   JAMES   1093        143     
7566   JONES   3421        446     
7839   KING    5750        750     
7654   MARTIN  1438        188     
7934   MILLER  1495        195     
7788   SCOTT   3450        450     
7369   SMITH   920         120     
7844   TURNER  1725        225     
7521   WARD    1438        188 
*/

-- End of file
