-- Author: Jingjing Yang <jingjing.yang@tuni.fi>
-- Date: 2023-11-14
-- File: 011-list-tables.sql

# What is the command is used to list all tables in database.
.tables

# Varify:
/*
jingjingyang@jingjings-MacBook-Pro ~ % sqlite3 test.db 
-- Loading resources from /Users/jingjingyang/.sqliterc
SQLite version 3.39.5 2022-10-14 20:58:05
Enter ".help" for usage hints.
sqlite> .tables
bonus     dept      item      price     salgrade
customer  emp       ordx      product 
*/

-- End of file
