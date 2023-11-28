-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-14
-- File: 025-where.sql

--================== Task ======================
-- /*
-- 2.5 Where 5

-- Display the employee name and department number
-- of all employees in departments 10 and 30.
-- */


SELECT
    ename,
    deptno
FROM
    emp
WHERE
    deptno IN (10, 30);


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

-- sqlite> SELECT ename, deptno
-- ...> FROM emp
-- ...> WHERE deptno IN (10, 30);
-- ename   deptno
-- ------  ------
-- ALLEN   30    
-- WARD    30    
-- MARTIN  30    
-- BLAKE   30    
-- CLARK   10    
-- KING    10    
-- TURNER  30    
-- JAMES   30    
-- MILLER  10 
-- */

-- End of file
