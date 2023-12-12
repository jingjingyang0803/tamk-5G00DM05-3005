const express = require("express");
const sqlite3 = require("sqlite3").verbose();

// Define HTTP status codes
const HTTP_STATUS_OK = 200;
const HTTP_STATUS_CREATED = 201;
const HTTP_STATUS_NO_CONTENT = 204;
const HTTP_STATUS_INTERNAL_SERVER_ERROR = 500;

// Connect to SQLite database
let db = new sqlite3.Database("./database.db");

// Initialize Express app
const app = express();

// Enable to parse JSON body in POST requests
app.use(express.json());

// Redirect from '/' to '/clothes'
app.get("/", (req, res) => {
  res.redirect("/clothes");
});

// HTTP GET endpoint
app.get("/clothes", (req, res) => {
  db.all("SELECT * FROM Clothes", [], (err, rows) => {
    if (err) {
      res
        .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
        .json({ error: err.message });
      return;
    }
    res.json(rows);
  });
});

// HTTP GET endpoint for a specific record
app.get("/clothes/:id", (req, res) => {
  const query = "SELECT * FROM Clothes WHERE id = ?";
  const values = [req.params.id];

  db.get(query, values, (err, row) => {
    if (err) {
      res
        .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
        .json({ error: err.message });
      return;
    }
    res.json(row);
  });
});

// HTTP POST endpoint
app.post("/clothes", (req, res) => {
  const query =
    "INSERT INTO Clothes (name, type, size, color, price) VALUES (?, ?, ?, ?, ?)";
  const values = [
    req.body.name,
    req.body.type,
    req.body.size,
    req.body.color,
    req.body.price,
  ];

  db.run(query, values, function (err) {
    if (err) {
      res
        .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
        .json({ error: err.message });
      return;
    }
    res.status(HTTP_STATUS_CREATED).json({ id: this.lastID });
  });
});

// HTTP UPDATE endpoint
app.put("/clothes/:id", (req, res) => {
  const query =
    "UPDATE Clothes SET name = ?, type = ?, size = ?, color = ?, price = ? WHERE id = ?";
  const values = [
    req.body.name,
    req.body.type,
    req.body.size,
    req.body.color,
    req.body.price,
    req.params.id,
  ];

  db.run(query, values, function (err) {
    if (err) {
      res
        .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
        .json({ error: err.message });
      return;
    }
    res
      .status(HTTP_STATUS_OK)
      .json({ message: "Row updated", changes: this.changes });
  });
});

// HTTP DELETE endpoint
app.delete("/clothes/:id", (req, res) => {
  const query = "DELETE FROM Clothes WHERE id = ?";
  const values = [req.params.id];

  db.run(query, values, function (err) {
    if (err) {
      res
        .status(HTTP_STATUS_INTERNAL_SERVER_ERROR)
        .json({ error: err.message });
      return;
    }
    res
      .status(HTTP_STATUS_NO_CONTENT)
      .json({ message: "Row deleted", changes: this.changes });
  });
});

app.listen(8080, () => {
  console.log("Server is running on <http://localhost:8080> ...");
});
