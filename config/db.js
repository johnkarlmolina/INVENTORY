const mysql = require("mysql2/promise");

const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "",            // XAMPP default blank
  database: "inventory_system", //  (database name sa phpMyAdmin)
  port: 3306,
  waitForConnections: true,
  connectionLimit: 10,
});

module.exports = pool;