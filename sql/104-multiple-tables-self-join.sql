-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 104-multiple-tables-self-join.sql

--================== Task ======================
-- /*
-- 10.4 Multiple tables and self join 4

-- Display location and department name for all employees
-- whose manager is either BLAKE, FORD or JONES and where manager
-- earns more than salary in grade 3. Order the results
-- alphabetically by "Location", "Manager" and "Employee".

-- Location   Department   Employee   Manager
-- --------   ----------   --------   --------
-- */


SELECT
   d.loc AS "Location",
   d.dname AS "Department",
   e.ename AS "Employee",
   m.ename AS "Manager"
FROM
   emp AS e
   JOIN emp AS m ON e.mgr = m.empno
   JOIN dept AS d ON e.deptno = d.deptno
WHERE
   UPPER(m.ename) IN ('BLAKE', 'FORD', 'JONES')
   AND m.sal > (
      SELECT
         hisal
      FROM
         salgrade
      WHERE
         grade = 3
   )
ORDER BY
   "Location" ASC,
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

-- sqlite> SELECT * FROM dept;
-- deptno  dname       loc     
-- ------  ----------  --------
-- 10      ACCOUNTING  NEW YORK
-- 20      RESEARCH    DALLAS  
-- 30      SALES       CHICAGO 
-- 40      OPERATIONS  BOSTON 

-- sqlite> SELECT * FROM salgrade;
-- grade  losal  hisal
-- -----  -----  -----
-- 1      700    1200 
-- 2      1201   1400 
-- 3      1401   2000 
-- 4      2001   3000 
-- 5      3001   9999 

-- sqlite> SELECT d.loc AS "Location", d.dname AS "Department", e.ename AS "Employee", m.ename AS "Manager"
-- ...> FROM emp e
-- ...> JOIN emp m ON e.mgr = m.empno
-- ...> JOIN dept d ON e.deptno = d.deptno
-- ...> WHERE m.ename IN ('BLAKE', 'FORD', 'JONES') AND m.sal > 2000
-- ...> ORDER BY "Location", "Manager", "Employee";
-- Location  Department  Employee  Manager
-- --------  ----------  --------  -------
-- CHICAGO   SALES       ALLEN     BLAKE  
-- CHICAGO   SALES       JAMES     BLAKE  
-- CHICAGO   SALES       MARTIN    BLAKE  
-- CHICAGO   SALES       TURNER    BLAKE  
-- CHICAGO   SALES       WARD      BLAKE  
-- DALLAS    RESEARCH    SMITH     FORD   
-- DALLAS    RESEARCH    FORD      JONES  
-- DALLAS    RESEARCH    SCOTT     JONES

-- sqlite> SELECT d.loc AS "Location", d.dname AS "Department", e.ename AS "Employee", m.ename AS "Manager"
-- ...> FROM emp e
-- ...> JOIN emp m ON e.mgr = m.empno
-- ...> JOIN dept d ON e.deptno = d.deptno
-- ...> WHERE UPPER(m.ename) IN ('BLAKE', 'FORD', 'JONES') AND m.sal > (SELECT hisal FROM salgrade WHERE grade = 3)
-- ...> ORDER BY "Location", "Manager", "Employee";
-- Location  Department  Employee  Manager
-- --------  ----------  --------  -------
-- CHICAGO   SALES       ALLEN     BLAKE  
-- CHICAGO   SALES       JAMES     BLAKE  
-- CHICAGO   SALES       MARTIN    BLAKE  
-- CHICAGO   SALES       TURNER    BLAKE  
-- CHICAGO   SALES       WARD      BLAKE  
-- DALLAS    RESEARCH    SMITH     FORD   
-- DALLAS    RESEARCH    FORD      JONES  
-- DALLAS    RESEARCH    SCOTT     JONES 
-- */

-- End of file
