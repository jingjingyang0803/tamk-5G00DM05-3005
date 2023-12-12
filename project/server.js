const express = require("express"); // Import Express
const app = express(); // Initialize Express app
app.use(express.json()); // Enable to parse JSON body in POST requests

const sqlite3 = require("sqlite3").verbose(); // Import SQLite
let db = new sqlite3.Database("./database.db"); // Connect to SQLite database
const table = "Clothes"; // Define table name

// Define HTTP status codes
const HTTP_STATUS_OK = 200;
const HTTP_STATUS_CREATED = 201;
const HTTP_STATUS_NO_CONTENT = 204;
const HTTP_STATUS_INTERNAL_SERVER_ERROR = 500;

// Define SQL queries
const SELECT_ALL = `SELECT * FROM ${table}`;
const SELECT_ID = `SELECT * FROM ${table} WHERE id = ?`;
const INSERT_INTO = `INSERT INTO ${table} (name, type, size, color, price) VALUES (?, ?, ?, ?, ?)`;
const UPDATE = `UPDATE ${table} SET name = ?, type = ?, size = ?, color = ?, price = ? WHERE id = ?`;
const DELETE = `DELETE FROM ${table} WHERE id = ?`;

// Function to create error response
function createErrorResponse(err) {
  return {
    error: err.message, // Error message
    code: err.code, // Error code
    details: {
      /* any relevant details */
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
      // If error occurs
      res
        .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
        .json(createErrorResponse(err)); // Send error response
      return;
    }
    res.status(HTTP_STATUS_CREATED).json({ id: this.lastID }); // Send response with created ID
  });
});

app.put(`/clothes/:id`, (req, res) => {
  // PUT endpoint
  const values = [
    req.body.name, // Values from request body and ID from URL
    req.body.type,
    req.body.size,
    req.body.color,
    req.body.price,
    req.params.id,
  ];

  db.run(UPDATE, values, function (err) {
    // Execute SQL query
    if (err) {
      // If error occurs
      res
        .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
        .json(createErrorResponse(err)); // Send error response
      return;
    }
    res
      .status(HTTP_STATUS_OK)
      .json({ message: "Row updated", changes: this.changes }); // Send response with update message
  });
});

app.delete(`/clothes/:id`, (req, res) => {
  // DELETE endpoint
  const values = [req.params.id]; // ID parameter from URL

  db.run(DELETE, values, function (err) {
    // Execute SQL query
    if (err) {
      // If error occurs
      res
        .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
        .json(createErrorResponse(err)); // Send error response
      return;
    }
    res
      .status(HTTP_STATUS_NO_CONTENT)
      .json({ message: "Row deleted", changes: this.changes }); // Send response with delete message
  });
});

app.listen(8080, () => {
  // Start server
  console.log(`Server is running on http://localhost:8080 ...`);
});
