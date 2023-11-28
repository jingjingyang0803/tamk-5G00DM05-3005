-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-14
-- File: 043-like.sql

--================== Task ======================
-- /*
-- 4.3 Like 3

-- Display the name of all employees who have two *L*
-- characters in their name. All these must work in department 10
-- or their manager is 7782. Make the query generic for all names.
-- */


SELECT
   ename
FROM
   emp
WHERE
   UPPER(ename) LIKE '%L%L%'
   AND (
      deptno = 10
      OR mgr = 7782
   );


--================== Task continue ======================
-- /*
-- Display the name and hire date of every employee who
-- were hired in 1982. Use LIKE keyword in query.
--  */
SELECT
   ename,
   hiredate
FROM
   emp
WHERE
   LOWER(hiredate) LIKE '1982%';

--================== Varify =====================
-- /*
-- jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- -- Loading resources from /Users/jingjingyang/.sqliterc
-- SQLite version 3.39.5 2022-10-14 20:58:05
-- Enter ".help" for usage hints.

-- sqlite> PRAGMA table_info(emp);
-- cid  name      type          notnull  dflt_value  pk
-- ---  --------  ------------  -------  ----------  --
-- 0    empno     INTEGER       1        NULL        1 
-- 1    ename     VARCHAR(10)   0        NULL        0 
-- 2    job       VARCHAR(9)    0        NULL        0 
-- 3    mgr       INTEGER       0        NULL        0 
-- 4    hiredate  DATE          0        NULL        0 
-- 5    sal       NUMERIC(7,2)  0        NULL        0 
-- 6    comm      NUMERIC(7,2)  0        NULL        0 
-- 7    deptno    INTEGER       1        NULL        0 

-- sqlite> SELECT DISTINCT hiredate
-- ...> FROM emp;
-- hiredate  
-- ----------
-- 1980-12-17
-- 1981-02-20
-- 1981-02-22
-- 1981-04-02
-- 1981-09-28
-- 1981-05-01
-- 1981-06-09
-- 1982-12-09
-- 1981-11-17
-- 1981-09-08
-- 1983-01-12
-- 1981-12-03
-- 1982-01-23

-- sqlite> SELECT ename, hiredate
-- ...> FROM emp
-- ...> WHERE hiredate LIKE '1982%';
-- ename   hiredate  
-- ------  ----------
-- SCOTT   1982-12-09
-- MILLER  1982-01-23
-- */

-- End of file
