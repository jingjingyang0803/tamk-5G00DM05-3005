-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 124-insert.sql

--================== Task ======================
-- /*
-- 12.4 Insert 4

-- Insert data to inventory:

-- table: inventory

-- id item      worth comment
-- -- --------  ----- -------------------
-- 1 baseball  150   My first baseball
-- 2 bike      2000  For mountain riding
-- 3 playcards 10    Funny pictures
-- */


INSERT INTO
    inventory (item, worth, comment)
VALUES
    ('baseball', 150, 'My first baseball'),
    ('bike', 2000, 'For mountain riding'),
    ('playcards', 10, 'Funny pictures');


--================== Varify =====================
-- /*
-- jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- -- Loading resources from /Users/jingjingyang/.sqliterc
-- SQLite version 3.39.5 2022-10-14 20:58:05
-- Enter ".help" for usage hints.

-- sqlite> INSERT INTO inventory(item, worth, comment)
-- ...> VALUES ('baseball', 150, 'My first baseball'),
-- ...>        ('bike', 2000, 'For mountain riding'),
-- ...>        ('playcards', 10, 'Funny pictures');

-- sqlite> SELECT * FROM inventory;
-- id  item       worth  comment            
-- --  ---------  -----  -------------------
-- 1   baseball   150    My first baseball  
-- 2   bike       2000   For mountain riding
-- 3   playcards  10     Funny pictures     
-- */

-- End of file
