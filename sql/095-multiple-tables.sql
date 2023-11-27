-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 095-multiple-tables.sql
--================== Task ======================
/*
9.5 Multiple tables 5

Write a query to display the name, job,
department number and department name for all employees who:
work in *accounting* department and who earn more than 1000;
who work in *sales* department and earn more than 1000; and
who work in *operations* and earn more than 1000. Ignore
commission. Order the results alphabetically by name.
 */
SELECT
   ename,
   job,
   emp.deptno,
   dname
FROM
   emp
   JOIN dept ON emp.deptno = dept.deptno
WHERE
   LOWER(dname) IN ('accounting', 'sales', 'operations')
   AND sal > 1000
ORDER BY
   ename;

--================== Varify =====================
/*
jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- Loading resources from /Users/jingjingyang/.sqliterc
SQLite version 3.39.5 2022-10-14 20:58:05
Enter ".help" for usage hints.

sqlite> .tables
bonus     dept      item      price     salgrade
customer  emp       ordx      product 

sqlite>  SELECT * FROM dept;
deptno  dname       loc     
------  ----------  --------
10      ACCOUNTING  NEW YORK
20      RESEARCH    DALLAS  
30      SALES       CHICAGO 
40      OPERATIONS  BOSTON  

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

sqlite> SELECT ename, job, deptno
...> FROM emp
...> WHERE deptno IN (10, 30, 40) AND sal > 1000
...> ORDER BY ename;
ename   job        deptno
------  ---------  ------
ALLEN   SALESMAN   30    
BLAKE   MANAGER    30    
CLARK   MANAGER    10    
KING    PRESIDENT  10    
MARTIN  SALESMAN   30    
MILLER  CLERK      10    
TURNER  SALESMAN   30    
WARD    SALESMAN   30

sqlite> SELECT ename, job, emp.deptno, dname
...> FROM emp
...> JOIN dept ON emp.deptno = dept.deptno
...> WHERE LOWER(dname) IN ('accounting', 'sales', 'operations') AND sal > 1000
...> ORDER BY ename;
ename   job        deptno  dname     
------  ---------  ------  ----------
ALLEN   SALESMAN   30      SALES     
BLAKE   MANAGER    30      SALES     
CLARK   MANAGER    10      ACCOUNTING
KING    PRESIDENT  10      ACCOUNTING
MARTIN  SALESMAN   30      SALES     
MILLER  CLERK      10      ACCOUNTING
TURNER  SALESMAN   30      SALES     
WARD    SALESMAN   30      SALES       
 */
-- End of file