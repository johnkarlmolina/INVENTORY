const express = require("express");
const router = express.Router();
// Computer Controller
const computerController = require("../controller/computerController");
const { requireAdmin } = require("../middleware/authMiddleware");

// Computer Inventory route
router.post("/computerDataTable", computerController.computerDataTable); 
router.post("/inactiveComputerDataTable", requireAdmin, computerController.inactiveComputerDataTable);
router.post("/addComputer", requireAdmin, computerController.addComputer);
router.post("/updateComputer", requireAdmin, computerController.updateComputer);
router.get("/getComputerIds", computerController.getComputerIds);
router.post("/deleteComputer", requireAdmin, computerController.deleteComputer);
router.post("/activateComputer", requireAdmin, computerController.activateComputer);

module.exports = router;