const express = require("express");
const router = express.Router();

const consumableController = require("../controller/consumableController");
// Consumable route
router.get("/", consumableController.consumablePageRender);
router.post("/insertConsumables", consumableController.insertConsumables);

module.exports = router;
