-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 113-create-table.sql

--================== Task ======================
-- /*
-- 11.3 Create table 3

-- Create table for weather report (do not insert any data).
-- Time of reading, temperature in Celsius, comment column, two
-- letter signature initials, like "JD", of a person who made the
-- temperature reading, the low reading, the high reading.

-- table: weather

-- id time_of_reading high low sig comment
-- -- --------------- ---- --- --- -------

-- Note: temperatures in format: -10.5 or 30.8
-- */


CREATE TABLE
    weather (
        id INTEGER PRIMARY KEY NOT NULL UNIQUE,
        time_of_reading TIMESTAMP,
        high DECIMAL,
        low DECIMAL,
        sig CHARACTER(2),
        comment VARCHAR(2000)
    );

-- DECIMAL(4,1) represents a decimal number with up to 4 digits, of which 1 is after the decimal point. 


--================== Varify =====================
-- /*
-- jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- -- Loading resources from /Users/jingjingyang/.sqliterc
-- SQLite version 3.39.5 2022-10-14 20:58:05
-- Enter ".help" for usage hints.

-- sqlite> CREATE TABLE weather (
-- ...>     id SERIAL PRIMARY KEY,
-- ...>     time_of_reading TIMESTAMP,
-- ...>     high DECIMAL(4, 1),
-- ...>     low DECIMAL(4, 1),
-- ...>     sig CHAR(2),
-- ...>     comment VARCHAR(255)
-- ...> );
-- sqlite> PRAGMA table_info(weather);
-- cid  name             type           notnull  dflt_value  pk
-- ---  ---------------  -------------  -------  ----------  --
-- 0    id               SERIAL         0        NULL        1 
-- 1    time_of_reading  TIMESTAMP      0        NULL        0 
-- 2    high             DECIMAL(4, 1)  0        NULL        0 
-- 3    low              DECIMAL(4, 1)  0        NULL        0 
-- 4    sig              CHAR(2)        0        NULL        0 
-- 5    comment          VARCHAR(255)   0        NULL        0 

-- sqlite> DROP TABLE weather;

-- sqlite> CREATE TABLE weather (
-- ...>     id INTEGER PRIMARY KEY AUTOINCREMENT,
-- ...>     time_of_reading TIMESTAMP,
-- ...>     high DECIMAL(4, 1),
-- ...>     low DECIMAL(4, 1),
-- ...>     sig CHAR(2),
-- ...>     comment VARCHAR(255)
-- ...> );

-- sqlite> PRAGMA table_info(weather);
-- cid  name             type           notnull  dflt_value  pk
-- ---  ---------------  -------------  -------  ----------  --
-- 0    id               INTEGER        0        NULL        1 
-- 1    time_of_reading  TIMESTAMP      0        NULL        0 
-- 2    high             DECIMAL(4, 1)  0        NULL        0 
-- 3    low              DECIMAL(4, 1)  0        NULL        0 
-- 4    sig              CHAR(2)        0        NULL        0 
-- 5    comment          VARCHAR(255)   0        NULL        0 
-- */

-- End of file
