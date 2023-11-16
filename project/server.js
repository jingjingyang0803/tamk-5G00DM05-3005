const express = require("express");
const sqlite3 = require("sqlite3").verbose();

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
      res.status(500).json({ error: err.message });
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
      res.status(500).json({ error: err.message });
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
      res.status(500).json({ error: err.message });
      return;
    }
    res.json({ id: this.lastID });
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
      res.status(500).json({ error: err.message });
      return;
    }
    res.json({ message: "Row updated", changes: this.changes });
  });
});

// HTTP DELETE endpoint
app.delete("/clothes/:id", (req, res) => {
  const query = "DELETE FROM Clothes WHERE id = ?";
  const values = [req.params.id];

  db.run(query, values, function (err) {
    if (err) {
      res.status(500).json({ error: err.message });
      return;
    }
    res.json({ message: "Row deleted", changes: this.changes });
  });
});

app.listen(3000, () => {
  console.log("Server is running on http://localhost:3000 ...");
});
