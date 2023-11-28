-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 101-multiple-tables-self-join.sql

--================== Task ======================
-- /*
-- 10.1 Multiple tables and self join 1

-- Display the manager's name and number, employee name,
-- number for who work under managers BLAKE, FORD or SCOTT.
-- Label the columns "Employee", "Emp#", "Manager" and "Mgr#".
-- Order the results alphabetically by "Manager" and "Employee"
-- columns.
-- */


SELECT
    m.ename AS "Manager",
    m.empno AS "Mgr#",
    e.ename AS "Employee",
    e.empno AS "Emp#"
FROM
    emp AS e
    JOIN emp AS m ON e.mgr = m.empno
WHERE
    UPPER(m.ename) IN ('BLAKE', 'FORD', 'SCOTT')
ORDER BY
    "Manager" ASC,
    "Employee" ASC;


--================== Varify =====================
-- /*
-- jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- -- Loading resources from /Users/jingjingyang/.sqliterc
-- SQLite version 3.39.5 2022-10-14 20:58:05
-- Enter ".help" for usage hints.

-- sqlite> SELECT * FROM emp;
-- empno  ename   job        mgr   hiredate    sal   comm  deptno
-- -----  ------  ---------  ----  ----------  ----  ----  ------
-- 7369   SMITH   CLERK      7902  1980-12-17  800   NULL  20    
-- 7499   ALLEN   SALESMAN   7698  1981-02-20  1600  300   30    
-- 7521   WARD    SALESMAN   7698  1981-02-22  1250  500   30    
-- 7566   JONES   MANAGER    7839  1981-04-02  2975  NULL  20    
-- 7654   MARTIN  SALESMAN   7698  1981-09-28  1250  1400  30    
-- 7698   BLAKE   MANAGER    7839  1981-05-01  2850  NULL  30    
-- 7782   CLARK   MANAGER    7839  1981-06-09  2450  NULL  10    
-- 7788   SCOTT   ANALYST    7566  1982-12-09  3000  NULL  20    
-- 7839   KING    PRESIDENT  NULL  1981-11-17  5000  NULL  10    
-- 7844   TURNER  SALESMAN   7698  1981-09-08  1500  0     30    
-- 7876   ADAMS   CLERK      7788  1983-01-12  1100  NULL  20    
-- 7900   JAMES   CLERK      7698  1981-12-03  950   NULL  30    
-- 7902   FORD    ANALYST    7566  1981-12-03  3000  NULL  20    
-- 7934   MILLER  CLERK      7782  1982-01-23  1300  NULL  10  

-- sqlite> SELECT m.ename AS "Manager", m.empno AS "Mgr#", e.ename AS "Employee", e.empno AS "Emp#"
-- ...> FROM emp e
-- ...> JOIN emp m ON e.mgr = m.empno
-- ...> WHERE UPPER(m.ename) IN ('BLAKE', 'FORD', 'SCOTT')
-- ...> ORDER BY "Manager", "Employee";
-- Manager  Mgr#  Employee  Emp#
-- -------  ----  --------  ----
-- BLAKE    7698  ALLEN     7499
-- BLAKE    7698  JAMES     7900
-- BLAKE    7698  MARTIN    7654
-- BLAKE    7698  TURNER    7844
-- BLAKE    7698  WARD      7521
-- FORD     7902  SMITH     7369
-- SCOTT    7788  ADAMS     7876
-- */

-- End of file
