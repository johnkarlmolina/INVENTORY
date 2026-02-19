const express = require("express");
const router = express.Router();

const peripheralController = require("../controller/peripheralController");
// Peripherals Inventory route
router.get("/peripheralPageRender", peripheralController.peripheralPageRender);
router.post("/peripheralDataTable", peripheralController.peripheralDataTable);
router.post("/addPeripheral", peripheralController.addPeripheral);

module.exports = router;