const express = require("express");
const router = express.Router();

const consumableController = require("../controller/consumableController");
// Consumable route
router.get("/", consumableController.consumablePageRender);
router.post("/insertConsumables", consumableController.insertConsumables);
router.post("/showConsumables", consumableController.showConsumables);
router.post("/recordRequest", consumableController.recordRequest);
router.post("/getConsumableLogs", consumableController.getConsumableLogs);
router.post("/undoTransaction", consumableController.undoTransaction);

module.exports = router;
