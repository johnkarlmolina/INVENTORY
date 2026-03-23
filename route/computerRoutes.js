const express = require("express");
const router = express.Router();
// Computer Controller
const computerController = require("../controller/computerController");

// Computer Inventory route
router.post("/computerDataTable", computerController.computerDataTable); 
router.post("/inactiveComputerDataTable", computerController.inactiveComputerDataTable);
router.post("/addComputer", computerController.addComputer);
router.post("/updateComputer", computerController.updateComputer);
router.get("/getComputerIds", computerController.getComputerIds);
router.post("/deleteComputer", computerController.deleteComputer);
router.post("/activateComputer", computerController.activateComputer);

module.exports = router;