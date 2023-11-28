-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-14
-- File: 033-order-by.sql

--================== Task ======================
-- /*
-- 3.3 Order by 3

-- How much each employee pays taxes in department 10 in a year
-- when tax rate is 31%. Ignore commission. Sort the result by
-- department number (lowest first) and employee name
-- (alphabetically). Display:

-- Dept Employee Taxes
-- ---- -------- -----
-- */


SELECT
    deptno AS "Dept",
    ename AS "Employee",
    CAST(
        ROUND(sal * 12 * 0.31
        ) AS INTEGER
    ) AS "Taxes"
FROM
    emp
WHERE
    deptno = 10
ORDER BY
    "Dept" ASC,
    "Employee" ASC;


-- ??? Sorting by department number in this specific query doesn't have a practical effect, as all selected records are from department 10. 
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

-- sqlite> SELECT deptno AS "Dept", ename AS "Employee", sal*0.31 AS "Taxes"
-- ...> FROM emp
-- ...> WHERE deptno = 10
-- ...> ORDER BY "Dept" ASC, "Employee" ASC;
-- Dept  Employee  Taxes 
-- ----  --------  ------
-- 10    CLARK     759.5 
-- 10    KING      1550.0
-- 10    MILLER    403.0 

-- sqlite> SELECT deptno AS "Dept", ename AS "Employee", CAST(ROUND(sal * 12 * 0.31) AS INTEGER) AS "Taxes"
-- ...> FROM emp
-- ...> WHERE deptno = 10
-- ...> ORDER BY "Dept" ASC, "Employee" ASC;
-- Dept  Employee  Taxes
-- ----  --------  -----
-- 10    CLARK     9114 
-- 10    KING      18600
-- 10    MILLER    4836
-- */

-- End of file
