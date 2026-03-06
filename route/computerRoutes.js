const express = require("express");
const router = express.Router();
// Computer Controller
const computerController = require("../controller/computerController");

// Computer Inventory route
router.post("/computerDataTable", computerController.computerDataTable); 
router.post("/addComputer", computerController.addComputer);
router.get("/getComputerIds", computerController.getComputerIds);
router.post("/deleteComputer", computerController.deleteComputer);

module.exports = router;