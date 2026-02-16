const express = require("express");
const router = express.Router();

const consumableController = require("../controller/consumableController");
// Consumable route
router.get("/", consumableController.consumablePageRender);

module.exports = router;
