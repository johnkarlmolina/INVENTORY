const express = require("express");
const router = express.Router();

const peripheralController = require("../controller/peripheralController");
// Peripherals Inventory route
router.get("/peripheralPageRender", peripheralController.peripheralPageRender);
router.post("/peripheralDataTable", peripheralController.peripheralDataTable);
router.post("/inactivePeripheralDataTable", peripheralController.inactivePeripheralDataTable);
router.post("/addPeripheral", peripheralController.addPeripheral);
router.post("/updatePeripheral", peripheralController.updatePeripheral);
router.post("/deletePeripheral", peripheralController.deletePeripheral);
router.post("/activatePeripheral", peripheralController.activatePeripheral);

module.exports = router;