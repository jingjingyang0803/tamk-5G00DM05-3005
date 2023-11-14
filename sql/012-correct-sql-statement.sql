-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-14
-- File: 012-correct-sql-statement.sql

-----------------------Task---------------------
/*
        There are errors in this statement. Identify them all and
        correct the statement and run it.

                SELECT  empno, ename
                        salary x 12 ANNUAL SALARY
                        emp
                ;
*/


SELECT empno, ename, sal * 12 AS "ANNUAL SALARY"
FROM emp;


-------------------------Varify------------------
/*
jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- Loading resources from /Users/jingjingyang/.sqliterc
SQLite version 3.39.5 2022-10-14 20:58:05
Enter ".help" for usage hints.
sqlite> PRAGMA table_info(emp);
cid  name      type          notnull  dflt_value  pk
---  --------  ------------  -------  ----------  --
0    empno     INTEGER       1        NULL        1 
1    ename     VARCHAR(10)   0        NULL        0 
2    job       VARCHAR(9)    0        NULL        0 
3    mgr       INTEGER       0        NULL        0 
4    hiredate  DATE          0        NULL        0 
5    sal       NUMERIC(7,2)  0        NULL        0 
6    comm      NUMERIC(7,2)  0        NULL        0 
7    deptno    INTEGER       1        NULL        0 
sqlite> SELECT empno, ename, sal * 12 AS "ANNUAL SALARY"
   ...> FROM emp;
empno  ename   ANNUAL SALARY
-----  ------  -------------
7369   SMITH   9600         
7499   ALLEN   19200        
7521   WARD    15000        
7566   JONES   35700        
7654   MARTIN  15000        
7698   BLAKE   34200        
7782   CLARK   29400        
7788   SCOTT   36000        
7839   KING    60000        
7844   TURNER  18000        
7876   ADAMS   13200        
7900   JAMES   11400        
7902   FORD    36000        
7934   MILLER  15600  
*/

-- End of file
