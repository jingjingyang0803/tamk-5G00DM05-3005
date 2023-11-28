-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 102-multiple-tables-self-join.sql

--================== Task ======================
-- /*
-- 10.2 Multiple tables and self join 2

-- Display the department number, employee name and all the
-- employees that work in the same department (Colleagues). Label
-- columns "Dept", "Employee" and "Colleague". Order the results
-- by "Dept" (lowest first), "Employee" (alphabetically) and
-- "Colleague" (alphabetically).
-- */


SELECT
    e1.deptno AS "Dept",
    e1.ename AS "Employee",
    e2.ename AS "Colleague"
FROM
    emp e1
    JOIN emp e2 ON e1.deptno = e2.deptno
    AND e1.empno <> e2.empno
ORDER BY
    "Dept",
    "Employee",
    "Colleague";


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

-- sqlite> SELECT e1.deptno AS "Dept", e1.ename AS "Employee", e2.ename AS "Colleague"
-- ...> FROM emp e1
-- ...> JOIN emp e2 ON e1.deptno = e2.deptno AND e1.empno <> e2.empno
-- ...> ORDER BY "Dept", "Employee", "Colleague";
-- Dept  Employee  Colleague
-- ----  --------  ---------
-- 10    CLARK     KING     
-- 10    CLARK     MILLER   
-- 10    KING      CLARK    
-- 10    KING      MILLER   
-- 10    MILLER    CLARK    
-- 10    MILLER    KING     
-- 20    ADAMS     FORD     
-- 20    ADAMS     JONES    
-- 20    ADAMS     SCOTT    
-- 20    ADAMS     SMITH    
-- 20    FORD      ADAMS    
-- 20    FORD      JONES    
-- 20    FORD      SCOTT    
-- 20    FORD      SMITH    
-- 20    JONES     ADAMS    
-- 20    JONES     FORD     
-- 20    JONES     SCOTT    
-- 20    JONES     SMITH    
-- 20    SCOTT     ADAMS    
-- 20    SCOTT     FORD     
-- 20    SCOTT     JONES    
-- 20    SCOTT     SMITH    
-- 20    SMITH     ADAMS    
-- 20    SMITH     FORD     
-- 20    SMITH     JONES    
-- 20    SMITH     SCOTT    
-- 30    ALLEN     BLAKE    
-- 30    ALLEN     JAMES    
-- 30    ALLEN     MARTIN   
-- 30    ALLEN     TURNER   
-- 30    ALLEN     WARD     
-- 30    BLAKE     ALLEN    
-- 30    BLAKE     JAMES    
-- 30    BLAKE     MARTIN   
-- 30    BLAKE     TURNER   
-- 30    BLAKE     WARD     
-- 30    JAMES     ALLEN    
-- 30    JAMES     BLAKE    
-- 30    JAMES     MARTIN   
-- 30    JAMES     TURNER   
-- 30    JAMES     WARD     
-- 30    MARTIN    ALLEN    
-- 30    MARTIN    BLAKE    
-- 30    MARTIN    JAMES    
-- 30    MARTIN    TURNER   
-- 30    MARTIN    WARD     
-- 30    TURNER    ALLEN    
-- 30    TURNER    BLAKE    
-- 30    TURNER    JAMES    
-- 30    TURNER    MARTIN   
-- 30    TURNER    WARD     
-- 30    WARD      ALLEN    
-- 30    WARD      BLAKE    
-- 30    WARD      JAMES    
-- 30    WARD      MARTIN   
-- 30    WARD      TURNER  
-- */

-- End of file
