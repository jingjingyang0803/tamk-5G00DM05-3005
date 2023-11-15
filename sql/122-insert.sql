-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 122-insert.sql

--================== Task ======================
/*
    12.2 Insert 2

        Insert data to football teams.

            table: football

            id first  last     team        comment
            -- -----  -------  ----------- ----------------------
             1 Jim    Anders   Manchester  UPS 10
             2 Mark   Knofles  Liverpool   Rockwell international
             3 Jenny  Richards Highland    Scottish national
*/


INSERT INTO football(first, last, team, comment)
VALUES ('Jim', 'Anders', 'Manchester', 'UPS 10'),
       ('Mark', 'Knofles', 'Liverpool', 'Rockwell international'),
       ('Jenny', 'Richards', 'Highland', 'Scottish national');


--================== Varify =====================
/*
jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- Loading resources from /Users/jingjingyang/.sqliterc
SQLite version 3.39.5 2022-10-14 20:58:05
Enter ".help" for usage hints.

sqlite> INSERT INTO football(first, last, team, comment)
   ...> VALUES ('Jim', 'Anders', 'Manchester', 'UPS 10'),
   ...>        ('Mark', 'Knofles', 'Liverpool', 'Rockwell international'),
   ...>        ('Jenny', 'Richards', 'Highland', 'Scottish national');
   
sqlite> SELECT * FROM football;
id  first  last      team        comment               
--  -----  --------  ----------  ----------------------
1   Jim    Anders    Manchester  UPS 10                
2   Mark   Knofles   Liverpool   Rockwell international
3   Jenny  Richards  Highland    Scottish national   
*/

-- End of file
