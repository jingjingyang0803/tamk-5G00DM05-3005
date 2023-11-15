-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 103-multiple-tables-self-join.sql

--================== Task ======================
/*
    10.3 Multiple tables and self join 3

        Display all employee names who earn more than their managers.
        Ignore commission. Order the results alphabetically.
*/


SELECT e.ename
FROM emp e
JOIN emp m ON e.mgr = m.empno
WHERE e.sal > m.sal
ORDER BY e.ename;


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

sqlite> SELECT e.ename
   ...> FROM emp e
   ...> JOIN emp m ON e.mgr = m.empno
   ...> WHERE e.sal > m.sal
   ...> ORDER BY e.ename;
ename
-----
FORD 
SCOTT

sqlite> SELECT e.ename AS "Employee", e.sal AS "Employee Salary", m.ename AS "Manager", m.sal AS "Manager Salary"
   ...> FROM emp e
   ...> JOIN emp m ON e.mgr = m.empno
   ...> ORDER BY e.sal;
Employee  Employee Salary  Manager  Manager Salary
--------  ---------------  -------  --------------
SMITH     800              FORD     3000          
JAMES     950              BLAKE    2850          
ADAMS     1100             SCOTT    3000          
WARD      1250             BLAKE    2850          
MARTIN    1250             BLAKE    2850          
MILLER    1300             CLARK    2450          
TURNER    1500             BLAKE    2850          
ALLEN     1600             BLAKE    2850          
CLARK     2450             KING     5000          
BLAKE     2850             KING     5000          
JONES     2975             KING     5000          
SCOTT     3000             JONES    2975          
FORD      3000             JONES    2975 
*/

-- End of file
