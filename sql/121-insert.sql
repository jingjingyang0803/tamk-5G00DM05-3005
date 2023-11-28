-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 121-insert.sql

--================== Task ======================
/*
12.1 Insert 1

Insert data to persons:

table: person

id last   first   phone  zip   city       address
-- -----  -----   ------ ----- ---------- -----------
1 Doe    John    123455 11122 New York   2th avenue
2 Jordan Mike    221122 01212 Washington South Park 3
3 Durak  Stephen 550011 55654 Miami      Sea Drive 112
*/


INSERT INTO
    person (last, first, phone, zip, city, address)
VALUES
    (
        'Doe',
        'John',
        '123-456-7890',
        11122,
        'New York',
        '2th avenue'
    ),
    (
        'Jordan',
        'Mike',
        '987-654-3210',
        01212,
        'Washington',
        'South Park 3'
    ),
    (
        'Durak',
        'Stephen',
        '555-666-7777',
        55654,
        'Miami',
        'Sea Drive 112'
    );


--================== Varify =====================
/*
jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- Loading resources from /Users/jingjingyang/.sqliterc
SQLite version 3.39.5 2022-10-14 20:58:05
Enter ".help" for usage hints.

sqlite> INSERT INTO person(last, first, phone, zip, city, address)
...> VALUES ('Doe', 'John', '123-456-7890', 11122, 'New York', '2th avenue'),
...>        ('Jordan', 'Mike', '987-654-3210', 01212, 'Washington', 'South Park 3'),
...>        ('Durak', 'Stephen', '555-666-7777', 55654, 'Miami', 'Sea Drive 112');

sqlite> SELECT * FROM person;
id  last    first    phone         zip    city        address      
--  ------  -------  ------------  -----  ----------  -------------
1   Doe     John     123-456-7890  11122  New York    2th avenue   
2   Jordan  Mike     987-654-3210  1212   Washington  South Park 3 
3   Durak   Stephen  555-666-7777  55654  Miami       Sea Drive 112
*/

-- End of file
