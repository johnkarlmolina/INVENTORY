const express = require("express");
const router = express.Router();

const userManagementController = require("../controller/userManagementController");

router.get("/", userManagementController.renderUserManagement);
router.post("/addUser", userManagementController.addUser);

module.exports = router;