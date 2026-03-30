const express = require("express");
const router = express.Router();

const servicesController = require("../controller/servicesController");
// Services route
router.get("/", servicesController.servicesPageRender);

// DataTables
router.post("/servicesDataTable", servicesController.servicesDataTable);

// CRUD endpoints (JSON)
router.get("/:id", servicesController.getServiceById);
router.post("/", servicesController.createService);
router.put("/:id", servicesController.updateService);
router.delete("/:id", servicesController.deleteService);

module.exports = router;
