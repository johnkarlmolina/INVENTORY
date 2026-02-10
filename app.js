const express = require("express");
const app = express();

app.set("view engine", "ejs");

// static files
app.use(express.static("public"));
app.use('/fontawesome', express.static('node_modules/@fortawesome/fontawesome-free'));

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

app.listen(3000, () => {
  console.log("Server running on http://localhost:3000");
});
