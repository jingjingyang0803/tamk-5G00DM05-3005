-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 111-create-table.sql

--================== Task ======================
-- /*
-- 11.1 Create table 1

-- Create table for persons (do not insert any data). Last name,
-- first name, phone number (consider international format), post code
-- (zip), city name and street address.

-- table: person

-- id last first phone zip city address
-- -- ---- ----- ----- --- ---- -------

-- Note: suppose phone numbers can contain only "+" and spaces.
-- Exmples: +358 50 12 34 55 66
-- */


CREATE TABLE
    person (
        id INTEGER PRIMARY KEY NOT NULL UNIQUE,
        last VARCHAR(255),
        first VARCHAR(255),
        phone VARCHAR(255) CHECK (LOWER(phone) GLOB '*[0-9 +]*' AND LOWER(phone) NOT GLOB '*[^0-9 +]*'),
        zip CHAR(5),
        city VARCHAR(255),
        address VARCHAR(255)
    );
    
-- some ZIP codes in certain countries or regions may contain letters, making them alphanumeric


-- ????In SQLite, when you use AUTOINCREMENT with a column as a primary key, 
-- it is implicitly considered NOT NULL and UNIQUE. Therefore, 
-- so no need to specify NOT NULL or UNIQUE explicitly.



-- The expression `phone NOT LIKE '%[^0-9 +]%'` ensures that the phone number does not contain any character other than digits, spaces, and plus sign. 
-- This is done using a regular expression where `[^0-9 +]` means any character not in the set `0-9`, `space`, and `+`.
--================== Varify =====================
-- /*
-- jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- -- Loading resources from /Users/jingjingyang/.sqliterc
-- SQLite version 3.39.5 2022-10-14 20:58:05
-- Enter ".help" for usage hints.

-- sqlite> CREATE TABLE person (
-- ...>     id SERIAL PRIMARY KEY,
-- ...>     last VARCHAR(255),
-- ...>     first VARCHAR(255),
-- ...>     phone VARCHAR(255) CHECK(phone LIKE '+%' AND phone NOT LIKE '%[^0-9 +]%'),
-- ...>     zip INT,
-- ...>     city VARCHAR(255),
-- ...>     address VARCHAR(255)
-- ...> );

-- sqlite> PRAGMA table_info(person);
-- cid  name     type          notnull  dflt_value  pk
-- ---  -------  ------------  -------  ----------  --
-- 0    id       SERIAL        0        NULL        1 
-- 1    last     VARCHAR(255)  0        NULL        0 
-- 2    first    VARCHAR(255)  0        NULL        0 
-- 3    phone    VARCHAR(255)  0        NULL        0 
-- 4    zip      INT           0        NULL        0 
-- 5    city     VARCHAR(255)  0        NULL        0 
-- 6    address  VARCHAR(255)  0        NULL        0 

-- sqlite> DROP TABLE person;

-- sqlite> .tables
-- bonus      dept       football   item       price      salgrade 
-- customer   emp        inventory  ordx       product    weather  

-- sqlite> CREATE TABLE person (
-- ...>     id INTEGER PRIMARY KEY AUTOINCREMENT,
-- ...>     last VARCHAR(255),
-- ...>     first VARCHAR(255),
-- ...>     phone VARCHAR(255) CHECK(phone NOT LIKE '%[^0-9 +]%'),
-- ...>     zip INT,
-- ...>     city VARCHAR(255),
-- ...>     address VARCHAR(255)
-- ...> );

-- sqlite> PRAGMA table_info(person);
-- cid  name     type          notnull  dflt_value  pk
-- ---  -------  ------------  -------  ----------  --
-- 0    id       INTEGER       0        NULL        1 
-- 1    last     VARCHAR(255)  0        NULL        0 
-- 2    first    VARCHAR(255)  0        NULL        0 
-- 3    phone    VARCHAR(255)  0        NULL        0 
-- 4    zip      INT           0        NULL        0 
-- 5    city     VARCHAR(255)  0        NULL        0 
-- 6    address  VARCHAR(255)  0        NULL        0 
-- */

-- End of file
