const express = require("express");
const router = express.Router();
const inventoryController = require("../controller/inventoryController");

// Inventory page route
router.get("/", inventoryController.inventoryPageRender);

module.exports = router;
