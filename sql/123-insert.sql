-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-15
-- File: 123-insert.sql
--================== Task ======================
/*
12.3 Insert 3

Insert data to weather report.

table: weather

id time_of_reading  high  low  sig comment
-- ---------------- ---- ----- --- ------------------------------
1 2000-12-11 06:00  5.5   1.5  MK  Snow-rain for a while
2 2000-12-12 06:00  4.1   0.3  ES  Strong wind
3 2000-12-14 06:00  2.0  -5.8  RD  Night was cold, foggy weather
4 2000-12-15 06:00  12.8  7.5  MK  Rainy day
 */
INSERT INTO
    weather (time_of_reading, high, low, sig, comment)
VALUES
    (
        '2000-12-11 06:00',
        5.5,
        1.5,
        'MK',
        'Snow-rain for a while'
    ),
    ('2000-12-12 06:00', 4.1, 0.3, 'ES', 'Strong wind'),
    (
        '2000-12-14 06:00',
        2.0,
        -5.8,
        'RD',
        'Night was cold, foggy weather'
    ),
    ('2000-12-15 06:00', 12.8, 7.5, 'MK', 'Rainy day');

--================== Varify =====================
/*
jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db
-- Loading resources from /Users/jingjingyang/.sqliterc
SQLite version 3.39.5 2022-10-14 20:58:05
Enter ".help" for usage hints.

sqlite> INSERT INTO weather(time_of_reading, high, low, sig, comment)
...> VALUES ('2000-12-11 06:00', 5.5, 1.5, 'MK', 'Snow-rain for a while'),
...>        ('2000-12-12 06:00', 4.1, 0.3, 'ES', 'Strong wind'),
...>        ('2000-12-14 06:00', 2.0, -5.8, 'RD', 'Night was cold, foggy weather'),
...>        ('2000-12-15 06:00', 12.8, 7.5, 'MK', 'Rainy day');

sqlite> SELECT * FROM weather;
id  time_of_reading   high  low   sig  comment                      
--  ----------------  ----  ----  ---  -----------------------------
1   2000-12-11 06:00  5.5   1.5   MK   Snow-rain for a while        
2   2000-12-12 06:00  4.1   0.3   ES   Strong wind                  
3   2000-12-14 06:00  2     -5.8  RD   Night was cold, foggy weather
4   2000-12-15 06:00  12.8  7.5   MK   Rainy day  
 */
-- End of file