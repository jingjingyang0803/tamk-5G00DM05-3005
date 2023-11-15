-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 112-create-table.sql

--================== Task ======================
/*
    11.2 Create table 2

        Create table for football teams (do not insert any data).
        Coach first name, coach last name, team name and comment.

            table: football

            id first last team comment
            -- ----- ---- ---- -------
*/


CREATE TABLE football (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first VARCHAR(255),
    last VARCHAR(255),
    team VARCHAR(255),
    comment VARCHAR(255)
);


--================== Varify =====================
/*
jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- Loading resources from /Users/jingjingyang/.sqliterc
SQLite version 3.39.5 2022-10-14 20:58:05
Enter ".help" for usage hints.

sqlite> CREATE TABLE football (
   ...>     id SERIAL PRIMARY KEY,
   ...>     first VARCHAR(255),
   ...>     last VARCHAR(255),
   ...>     team VARCHAR(255),
   ...>     comment VARCHAR(255)
   ...> );
   
sqlite> PRAGMA table_info(football);
cid  name     type          notnull  dflt_value  pk
---  -------  ------------  -------  ----------  --
0    id       SERIAL        0        NULL        1 
1    first    VARCHAR(255)  0        NULL        0 
2    last     VARCHAR(255)  0        NULL        0 
3    team     VARCHAR(255)  0        NULL        0 
4    comment  VARCHAR(255)  0        NULL        0 

sqlite> DROP TABLE football;

sqlite> CREATE TABLE football (
   ...>     id INTEGER PRIMARY KEY AUTOINCREMENT,
   ...>     first VARCHAR(255),
   ...>     last VARCHAR(255),
   ...>     team VARCHAR(255),
   ...>     comment VARCHAR(255)
   ...> );
   
sqlite> PRAGMA table_info(football);
cid  name     type          notnull  dflt_value  pk
---  -------  ------------  -------  ----------  --
0    id       INTEGER       0        NULL        1 
1    first    VARCHAR(255)  0        NULL        0 
2    last     VARCHAR(255)  0        NULL        0 
3    team     VARCHAR(255)  0        NULL        0 
4    comment  VARCHAR(255)  0        NULL        0 
*/

-- End of file
