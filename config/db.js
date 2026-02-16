const mysql = require("mysql");
const util = require("util");

const pool = mysql.createPool({
  connectionLimit: 10,
  host: process.env.DB_HOST || "localhost",
  user: process.env.DB_USER || "root",
  password: process.env.DB_PASS || "",
  database: process.env.DB_NAME || "inventory_system",
  charset: "utf8mb4",
  port: process.env.DB_PORT || 3306,
});

const query = util.promisify(pool.query).bind(pool);

module.exports = { pool, query };
