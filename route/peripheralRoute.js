const express = require("express");
const router = express.Router();

const peripheralController = require("../controller/peripheralController");
const { requireAdmin } = require("../middleware/authMiddleware");
// Peripherals Inventory route
router.get("/peripheralPageRender", peripheralController.peripheralPageRender);
router.post("/peripheralDataTable", peripheralController.peripheralDataTable);
router.post("/inactivePeripheralDataTable", requireAdmin, peripheralController.inactivePeripheralDataTable);
router.post("/addPeripheral", requireAdmin, peripheralController.addPeripheral);
router.post("/updatePeripheral", requireAdmin, peripheralController.updatePeripheral);
router.post("/deletePeripheral", requireAdmin, peripheralController.deletePeripheral);
router.post("/activatePeripheral", requireAdmin, peripheralController.activatePeripheral);

module.exports = router;