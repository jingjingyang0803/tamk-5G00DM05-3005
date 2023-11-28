-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 114-create-table.sql

--================== Task ======================
-- /*
-- 11.4 Create table 4

-- Create inventory table (do not insert any data):

-- table: inventory

-- id item      worth comment
-- -- --------  ----- -------------------

-- Note: worth is expressed in whole numbers only.
-- */


CREATE TABLE
    inventory (
        id INTEGER PRIMARY KEY NOT NULL UNIQUE,
        item VARCHAR(255),
        worth INTEGER,
        comment TEXT
    );


--================== Varify =====================
-- /*
-- jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- -- Loading resources from /Users/jingjingyang/.sqliterc
-- SQLite version 3.39.5 2022-10-14 20:58:05
-- Enter ".help" for usage hints.

-- sqlite> CREATE TABLE inventory (
-- ...>     id SERIAL PRIMARY KEY,
-- ...>     item VARCHAR(255),
-- ...>     worth INT,
-- ...>     comment VARCHAR(255)
-- ...> );

-- sqlite> PRAGMA table_info(inventory);
-- cid  name     type          notnull  dflt_value  pk
-- ---  -------  ------------  -------  ----------  --
-- 0    id       SERIAL        0        NULL        1 
-- 1    item     VARCHAR(255)  0        NULL        0 
-- 2    worth    INT           0        NULL        0 
-- 3    comment  VARCHAR(255)  0        NULL        0 

-- sqlite> DROP TABLE inventory;

-- sqlite> CREATE TABLE inventory (
-- ...>     id INTEGER PRIMARY KEY AUTOINCREMENT,
-- ...>     item VARCHAR(255),
-- ...>     worth INT,
-- ...>     comment VARCHAR(255)
-- ...> );

-- sqlite> PRAGMA table_info(inventory);
-- cid  name     type          notnull  dflt_value  pk
-- ---  -------  ------------  -------  ----------  --
-- 0    id       INTEGER       0        NULL        1 
-- 1    item     VARCHAR(255)  0        NULL        0 
-- 2    worth    INT           0        NULL        0 
-- 3    comment  VARCHAR(255)  0        NULL        0 
-- */

-- End of file
