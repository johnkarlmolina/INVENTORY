const express = require("express");
const router = express.Router();

const reportsController = require("../controller/reportsController");
// Reports route
router.get("/", reportsController.reportsPageRender);
module.exports = router;
