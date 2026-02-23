const express = require("express");
const router = express.Router();
const dashboardController = require("../controller/dashboardController");

// Dashboard route
router.get("/", dashboardController.renderDashboard);

module.exports = router;
