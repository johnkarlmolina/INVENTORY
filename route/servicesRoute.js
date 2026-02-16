const express = require("express");
const router = express.Router();

const servicesController = require("../controller/servicesController");
// Services route
router.get("/", servicesController.servicesPageRender);

module.exports = router;
