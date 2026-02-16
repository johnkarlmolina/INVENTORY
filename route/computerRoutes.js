const express = require("express");
const router = express.Router();
// Computer Controller
const computerController = require("../controller/computerController");

// Computer Inventory route
router.post("/computerDataTable", computerController.computerDataTable); 

module.exports = router;