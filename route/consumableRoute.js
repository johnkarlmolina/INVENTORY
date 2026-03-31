const express = require("express");
const router = express.Router();

const consumableController = require("../controller/consumableController");
const { requireAdmin } = require("../middleware/authMiddleware");
// Consumable route
router.get("/", consumableController.consumablePageRender);
router.post("/insertConsumables", requireAdmin, consumableController.insertConsumables);
router.post("/showConsumables", consumableController.showConsumables);
router.post("/inactiveConsumablesDataTable", requireAdmin, consumableController.inactiveConsumablesDataTable);
router.post("/recordRequest", requireAdmin, consumableController.recordRequest);
router.post("/getConsumableLogs", requireAdmin, consumableController.getConsumableLogs);
router.post("/undoTransaction", requireAdmin, consumableController.undoTransaction);
router.post("/updateConsumable", requireAdmin, consumableController.updateConsumable);
router.post("/deleteConsumable", requireAdmin, consumableController.deleteConsumable);
router.post("/activateConsumable", requireAdmin, consumableController.activateConsumable);
router.post("/returnItem", requireAdmin, consumableController.returnItem);

module.exports = router;
