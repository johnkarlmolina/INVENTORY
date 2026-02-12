// Kinukuha yung Express framework
// require() = Node way ng pag-import ng package
const express = require("express");
const app = express();
const db = require("./config/db");

app.set("view engine", "ejs");

// static files
app.use(express.static("public"));
app.use('/fontawesome', express.static('node_modules/@fortawesome/fontawesome-free'));
app.use('/Images', express.static('Images'));

// Redirect root to dashboard
app.get("/", (req, res) => {
  res.redirect("/dashboard");
});

// Dashboard route
app.get("/dashboard", (req, res) => {
  res.render("dashboard");
});

// Inventory route
app.get("/inventory", (req, res) => {
  res.render("inventory");
});

// Peripherals route
app.get("/peripherals", (req, res) => {
  res.render("peripherals");
});

// Computer Services route
app.get("/services", (req, res) => {
  res.render("services");
});

// Preventive Maintenance route
app.get("/maintenance", (req, res) => {
  res.render("maintenance");
});

// Consumable route
app.get("/consumable", (req, res) => {
  res.render("consumable");
});

// Report Generation route
app.get("/reports", (req, res) => {
  res.render("reports");
});

// dashboard API endpoint
app.get("/api/computers", async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT
        computer_id,
        pc_no,
        brand,
        model,
        serial_number,
        property_tag,
        os_version,
        procie,
        ram,
        os_license,
        pc_user,
        user_dept,
        date_of_purchase,
        date_of_entry,
        office_license,
        pc_status,
        pc_location
      FROM main_inventory
      ORDER BY computer_id DESC
    `);
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "DB error" });
  }
});

// peripherals API endpoint
app.get("/api/peripherals", async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT
        peripheral_id,
        brand,
        model,
        date_of_purchase,
        date_of_entry,
        peripheral_user,
        user_dept,
        kind_of_peripheral,
        serial_no,
        property_tag,
        peripheral_no,
        peripheral_status,
        peripheral_location
      FROM peripherals
      ORDER BY peripheral_id DESC
    `);
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "DB error" });
  }
});

// Start the server
app.listen(3000, () => {
  console.log("Server running on http://localhost:3000");
});
