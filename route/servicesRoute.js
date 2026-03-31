const express = require("express");
const router = express.Router();

const servicesController = require("../controller/servicesController");
const { requireAdmin } = require("../middleware/authMiddleware");
// Services route
router.get("/", servicesController.servicesPageRender);
router.get("/brandSerialOptions", servicesController.brandSerialOptions);

// DataTables
router.post("/servicesDataTable", servicesController.servicesDataTable);

// CRUD endpoints (JSON)
router.get("/:id", requireAdmin, servicesController.getServiceById);
router.post("/", servicesController.createService);
router.put("/:id", requireAdmin, servicesController.updateService);
router.delete("/:id", requireAdmin, servicesController.deleteService);

module.exports = router;
