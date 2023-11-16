# NodeJS Backend Project

## Author

Jingjing Yang

## Date

Date of creation: 16th November 2023

Date of last update:

## Setup and Run

1. Install Node.js and npm.
2. Clone this repository using the command:

   git clone https://github.com/jingjingyang0803/tamk-5G00DM05-3005.git

3. Navigate to the cloned repository and then to the project folder.
4. Run `npm install` to install all dependencies.
5. Setup SQLite database by running SQL scripts.
   - Run `sqlite3 database.db < sql/create.sql` to create tables.
   - Run `sqlite3 database.db < sql/insert.sql` to insert initial data.
6. Run `node server.js` to start the server.
7. The server runs on `http://localhost:3000`.

```sql
jingjingyang@jingjings-MacBook-Pro project % sqlite3 database.db < sql/create.sql
jingjingyang@jingjings-MacBook-Pro project % sqlite3 database.db < sql/insert.sql
jingjingyang@jingjings-MacBook-Pro project % node server.js
Server is running on http://localhost:3000 ...
```

## Endpoints

- GET /clothes: Retrieves all clothing items.
- GET /clothes/:id: Retrieves a specific clothing item by ID.
- POST /clothes: Adds a new clothing item.
- PUT /clothes/:id: Updates an existing clothing item with the given ID.
- DELETE /clothes/:id: Deletes the clothing item with the given ID.

## Example Usage

Using curl to interact with the API:

- GET all clothing items: `curl http://localhost:3000/clothes`
- GET a specific item: `curl http://localhost:3000/clothes/1`
- POST a new item: `curl -X POST -H "Content-Type: application/json" -d '{"name":"Wool Sweater","type":"Sweater","size":"L","color":"Red","price":60.99}' http://localhost:3000/clothes`
- PUT to update an item: `curl -X PUT -H "Content-Type: application/json" -d '{"name":"Denim Jacket","type":"Jacket","size":"XL","color":"Brown","price":50.99}' http://localhost:3000/clothes/1`
- DELETE an item: `curl -X DELETE http://localhost:3000/clothes/1`

```bash
jingjingyang@jingjings-MacBook-Pro ~ % curl http://localhost:3000
Found. Redirecting to /clothes%
jingjingyang@jingjings-MacBook-Pro ~ % curl http://localhost:3000/clothes
[{"id":1,"name":"Denim Jacket","type":"Jacket","size":"M","color":"Blue","price":59.99},{"id":2,"name":"Leather Boots","type":"Shoes","size":"8","color":"Black","price":89.99},{"id":3,"name":"Floral Dress","type":"Dress","size":"S","color":"Multicolor","price":45.99},{"id":4,"name":"Cotton T-Shirt","type":"Shirt","size":"L","color":"White","price":15.99}]%

jingjingyang@jingjings-MacBook-Pro ~ % curl http://localhost:3000/clothes/1
{"id":1,"name":"Denim Jacket","type":"Jacket","size":"M","color":"Blue","price":59.99}%

jingjingyang@jingjings-MacBook-Pro ~ % curl -X POST -H "Content-Type: application/json" -d '{"name":"Wool Sweater","type":"Sweater","size":"L","color":"Red","price":60.99}' http://localhost:3000/clothes
{"id":5}%
jingjingyang@jingjings-MacBook-Pro ~ % curl http://localhost:3000/clothes
[{"id":1,"name":"Denim Jacket","type":"Jacket","size":"M","color":"Blue","price":59.99},{"id":2,"name":"Leather Boots","type":"Shoes","size":"8","color":"Black","price":89.99},{"id":3,"name":"Floral Dress","type":"Dress","size":"S","color":"Multicolor","price":45.99},{"id":4,"name":"Cotton T-Shirt","type":"Shirt","size":"L","color":"White","price":15.99},{"id":5,"name":"Wool Sweater","type":"Sweater","size":"L","color":"Red","price":60.99}]%

jingjingyang@jingjings-MacBook-Pro ~ % curl -X PUT -H "Content-Type: application/json" -d '{"name":"Denim Jacket","type":"Jacket","size":"XL","color":"Brown","price":50.99}' http://localhost:3000/clothes/1
{"message":"Row updated","changes":1}%
jingjingyang@jingjings-MacBook-Pro ~ % curl http://localhost:3000/clothes/1
{"id":1,"name":"Denim Jacket","type":"Jacket","size":"XL","color":"Brown","price":50.99}%

jingjingyang@jingjings-MacBook-Pro ~ % curl -X DELETE http://localhost:3000/clothes/1
{"message":"Row deleted","changes":1}%
jingjingyang@jingjings-MacBook-Pro ~ % curl http://localhost:3000/clothes/1
jingjingyang@jingjings-MacBook-Pro ~ % curl http://localhost:3000/clothes
[{"id":2,"name":"Leather Boots","type":"Shoes","size":"8","color":"Black","price":89.99},{"id":3,"name":"Floral Dress","type":"Dress","size":"S","color":"Multicolor","price":45.99},{"id":4,"name":"Cotton T-Shirt","type":"Shirt","size":"L","color":"White","price":15.99},{"id":5,"name":"Wool Sweater","type":"Sweater","size":"L","color":"Red","price":60.99}]%
```
