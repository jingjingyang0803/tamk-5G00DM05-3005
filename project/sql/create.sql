CREATE TABLE IF NOT EXISTS Clothes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    type TEXT NOT NULL,
    size TEXT,
    color TEXT,
    price REAL
);
