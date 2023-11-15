-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 111-create-table.sql

--================== Task ======================
/*
    11.1 Create table 1

        Create table for persons (do not insert any data). Last name,
        first name, phone number (consider international format), post code
        (zip), city name and street address.

            table: person

            id last first phone zip city address
            -- ---- ----- ----- --- ---- -------

            Note: suppose phone numbers can contain only "+" and spaces.
            Exmples: +358 50 12 34 55 66
*/


CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    last VARCHAR(255),
    first VARCHAR(255),
    phone VARCHAR(255) CHECK(phone LIKE '+%' AND phone NOT LIKE '%[^0-9 +]%'),
    zip INT,
    city VARCHAR(255),
    address VARCHAR(255)
);


CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    last VARCHAR(255),
    first VARCHAR(255),
    phone VARCHAR(255) CHECK(phone LIKE '+%' AND phone NOT LIKE '%[^0-9 +]%'),
    zip INT,
    city VARCHAR(255),
    address VARCHAR(255)
);

-- The expression `phone LIKE '+%'` checks that the phone number begins with a plus sign.
-- The expression `phone NOT LIKE '%[^0-9 +]%'` ensures that the phone number does not contain any character other than digits, spaces, and plus sign. 
-- This is done using a regular expression where `[^0-9 +]` means any character not in the set `0-9`, `space`, and `+`.


--================== Varify =====================
/*
jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- Loading resources from /Users/jingjingyang/.sqliterc
SQLite version 3.39.5 2022-10-14 20:58:05
Enter ".help" for usage hints.

sqlite> CREATE TABLE person (
   ...>     id SERIAL PRIMARY KEY,
   ...>     last VARCHAR(255),
   ...>     first VARCHAR(255),
   ...>     phone VARCHAR(255) CHECK(phone LIKE '+%' AND phone NOT LIKE '%[^0-9 +]%'),
   ...>     zip INT,
   ...>     city VARCHAR(255),
   ...>     address VARCHAR(255)
   ...> );

sqlite> PRAGMA table_info(person);
cid  name     type          notnull  dflt_value  pk
---  -------  ------------  -------  ----------  --
0    id       SERIAL        0        NULL        1 
1    last     VARCHAR(255)  0        NULL        0 
2    first    VARCHAR(255)  0        NULL        0 
3    phone    VARCHAR(255)  0        NULL        0 
4    zip      INT           0        NULL        0 
5    city     VARCHAR(255)  0        NULL        0 
6    address  VARCHAR(255)  0        NULL        0 
*/

-- End of file
