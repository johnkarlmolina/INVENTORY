const express = require("express");
const router = express.Router();

const userManagementController = require("../controller/userManagementController");

router.get("/", userManagementController.renderUserManagement);

module.exports = router;