const express = require("express");
const sqlite3 = require("sqlite3").verbose();

// Define HTTP status codes
const HTTP_STATUS_OK = 200;
const HTTP_STATUS_CREATED = 201;
const HTTP_STATUS_NO_CONTENT = 204;
const HTTP_STATUS_INTERNAL_SERVER_ERROR = 500;

// Connect to SQLite database
let db = new sqlite3.Database("./database.db");

// Table name as a variable
const table = "Clothes";

// Initialize Express app
const app = express();

// Enable to parse JSON body in POST requests
app.use(express.json());

// SQL queries as variables
const SELECT_ALL = `SELECT * FROM ${table}`;
const SELECT_ID = `SELECT * FROM ${table} WHERE id = ?`;
const INSERT_INTO = `INSERT INTO ${table} (name, type, size, color, price) VALUES (?, ?, ?, ?, ?)`;
const UPDATE = `UPDATE ${table} SET name = ?, type = ?, size = ?, color = ?, price = ? WHERE id = ?`;
const DELETE = `DELETE FROM ${table} WHERE id = ?`;

// Function to create error response
function createErrorResponse(err) {
  return {
    error: err.message,
    code: err.code, // If the error has a specific code
    details: {
      /* any relevant details */
    },
    stack: process.env.NODE_ENV === "development" ? err.stack : "hidden", // Only show stack traces in development
  };
}

// HTTP GET endpoint
app.get(`/${table}`, (req, res) => {
  db.all(SELECT_ALL, [], (err, rows) => {
    if (err) {
      res
        .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
        .json(createErrorResponse(err));
      return;
    }
    res.json(rows);
  });
});

// HTTP GET endpoint for a specific record
app.get(`/${table}/:id`, (req, res) => {
  const values = [req.params.id];

  db.get(SELECT_ID, values, (err, row) => {
    if (err) {
      res
        .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
        .json(createErrorResponse(err));
      return;
    }
    res.json(row);
  });
});

// HTTP POST endpoint
app.post(`/${table}`, (req, res) => {
  const values = [
    req.body.name,
    req.body.type,
    req.body.size,
    req.body.color,
    req.body.price,
  ];

  db.run(INSERT_INTO, values, function (err) {
    if (err) {
      res
        .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
        .json(createErrorResponse(err));
      return;
    }
    res.status(HTTP_STATUS_CREATED).json({ id: this.lastID });
  });
});

// HTTP UPDATE endpoint
app.put(`/${table}/:id`, (req, res) => {
  const values = [
    req.body.name,
    req.body.type,
    req.body.size,
    req.body.color,
    req.body.price,
    req.params.id,
  ];

  db.run(UPDATE, values, function (err) {
    if (err) {
      res
        .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
        .json(createErrorResponse(err));
      return;
    }
    res
      .status(HTTP_STATUS_OK)
      .json({ message: "Row updated", changes: this.changes });
  });
});

// HTTP DELETE endpoint
app.delete(`/${table}/:id`, (req, res) => {
  const values = [req.params.id];

  db.run(DELETE, values, function (err) {
    if (err) {
      res
        .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
        .json(createErrorResponse(err));
      return;
    }
    res
      .status(HTTP_STATUS_NO_CONTENT)
      .json({ message: "Row deleted", changes: this.changes });
  });
});

app.listen(8080, () => {
  console.log(`Server is running on http://localhost:8080 ...`);
});
