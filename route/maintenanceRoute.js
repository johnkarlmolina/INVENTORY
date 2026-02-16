const express = require("express");
const router = express.Router();

const maintenanceController = require("../controller/maintenanceController");
// Maintenance route
router.get("/", maintenanceController.maintenancePageRender);

module.exports = router;
