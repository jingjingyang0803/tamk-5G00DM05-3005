const express = require("express"); // Import Express
const app = express(); // Initialize Express app
app.use(express.json()); // Enable to parse JSON body in POST requests

const sqlite3 = require("sqlite3").verbose(); // Import SQLite
let db = new sqlite3.Database("./database.db"); // Connect to SQLite database
const table = "Clothes"; // Define table name

// Define HTTP status codes
const HTTP_STATUS_OK = 200; // OK status, request succeeded
const HTTP_STATUS_CREATED = 201; // Request succeeded and a new resource was created as a result
const HTTP_STATUS_NO_CONTENT = 204; // Request succeeded, but there's no representation to return (i.e. the response is empty)
const HTTP_STATUS_INTERNAL_SERVER_ERROR = 500; // Server encountered an unexpected condition which prevented it from fulfilling the request

// Define SQL queries
const SELECT_ALL = `SELECT * FROM ${table}`; // SQL query to select all records from table
const SELECT_ID = `SELECT * FROM ${table} WHERE id = ?`; // SQL query to select record from table by id
const SEARCH_BY_NAME = `SELECT * FROM ${table} WHERE name LIKE ?`; // SQL query to find records by name
const SEARCH_BY_SIZE_AND_COLOR = `SELECT * FROM ${table} WHERE LOWER(size) = LOWER(?) AND LOWER(color) = LOWER(?)`; // SQL query to find records by size and color
const INSERT_INTO = `INSERT INTO ${table} (name, type, size, color, price) VALUES (?, ?, ?, ?, ?)`; // SQL query to insert new record into table
const UPDATE = `UPDATE ${table} SET name = ?, type = ?, size = ?, color = ?, price = ? WHERE id = ?`; // SQL query to update a record in the table
const DELETE = `DELETE FROM ${table} WHERE id = ?`; // SQL query to delete a record from the table by id

// Function to create error response
function createErrorResponse(err) {
  return {
    error: err.message, // Error message
    code: err.code, // Error code
    details: {
      method: req.method, // HTTP method of the request
      url: req.url, // Requested URL
      headers: req.headers, // Headers sent with the request
      body: req.body, // Body of the request
    },
    stack: process.env.NODE_ENV === "development" ? err.stack : "hidden", // Stack trace (only in development)
  };
}

app.get("/", (req, res) => {
  // Root endpoint
  res.redirect("/clothes"); // Redirect to '/clothes'
});

app.get(`/clothes`, (req, res) => {
  // GET endpoint for all records
  db.all(SELECT_ALL, [], (err, rows) => {
    // Execute SQL query
    if (err) {
      // If error occurs
      res
        .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
        .json(createErrorResponse(err)); // Send error response
      return;
    }
    res.json(rows); // Send response with all rows
  });
});

app.get(`/clothes/:id`, (req, res) => {
  // GET endpoint for a specific record
  const values = [req.params.id]; // ID parameter from URL

  db.get(SELECT_ID, values, (err, row) => {
    // Execute SQL query
    if (err) {
      // If error occurs
      res
        .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
        .json(createErrorResponse(err)); // Send error response
      return;
    }
    res.json(row); // Send response with the row
  });
});

// Endpoint to handle GET requests to '/clothes'
app.get(`/search`, (req, res) => {
  // Check if name query parameter is given
  if (req.query.name) {
    // Store query parameter in an array
    const values = [`%${req.query.name}%`];

    // Run SQL query to search by name
    db.all(SEARCH_BY_NAME, values, (err, rows) => {
      // If there is an error, send error response
      if (err) {
        res
          .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
          .json(createErrorResponse(err));
        return;
      }
      // If no error, send rows returned by the query as response
      res.json(rows);
    });
  }
  // Check if both size and color query parameters are given
  else if (req.query.size && req.query.color) {
    // Store query parameters in an array
    const values = [req.query.size, req.query.color];

    // Run SQL query to search by size and color
    db.all(SEARCH_BY_SIZE_AND_COLOR, values, (err, rows) => {
      // If there is an error, send error response
      if (err) {
        res
          .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
          .json(createErrorResponse(err));
        return;
      }
      // If no error, send rows returned by the query as response
      res.json(rows);
    });
  }

  // If neither size and color nor name query parameters are given, send error message
  else {
    res.status(400).json({ message: "Invalid query parameters" });
  }
});

app.post(`/clothes`, (req, res) => {
  // POST endpoint
  const values = [
    req.body.name, // Values from request body
    req.body.type,
    req.body.size,
    req.body.color,
    req.body.price,
  ];

  db.run(INSERT_INTO, values, function (err) {
    // Execute SQL query
    if (err) {
      // If error occurs, return 500 status (Internal Server Error) and error details
      res
        .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
        .json(createErrorResponse(err));
      return;
    }
    // If no error, return 201 status (Created) and the ID of the newly created record
    res.status(HTTP_STATUS_CREATED).json({ id: this.lastID });
  });
});

app.put(`/clothes/:id`, (req, res) => {
  // PUT endpoint for updating a record
  const values = [
    req.body.name, // Values from request body
    req.body.type,
    req.body.size,
    req.body.color,
    req.body.price,
    req.params.id, // ID from URL
  ];

  db.run(UPDATE, values, function (err) {
    // Execute SQL query
    if (err) {
      // If error occurs, return 500 status (Internal Server Error) and error details
      res
        .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
        .json(createErrorResponse(err));
      return;
    }
    // If no error, return 200 status (OK) and a message indicating the update was successful
    res
      .status(HTTP_STATUS_OK)
      .json({ message: "Row updated", changes: this.changes });
  });
});

app.delete(`/clothes/:id`, (req, res) => {
  // DELETE endpoint for deleting a record
  const values = [req.params.id]; // ID from URL

  db.run(DELETE, values, function (err) {
    // Execute SQL query
    if (err) {
      // If error occurs, return 500 status (Internal Server Error) and error details
      res
        .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
        .json(createErrorResponse(err));
      return;
    }
    // If no error, return 204 status (No Content) and a message indicating the deletion was successful
    res
      .status(HTTP_STATUS_NO_CONTENT)
      .json({ message: "Row deleted", changes: this.changes });
  });
});

app.listen(8080, () => {
  // Start server
  console.log(`Server is running on http://localhost:8080 ...`);
});
