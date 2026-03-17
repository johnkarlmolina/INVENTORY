const express = require("express");
const router = express.Router();

const userManagementController = require("../controller/userManagementController");

router.get("/", userManagementController.renderUserManagement);
router.post("/userDataTable", userManagementController.userDataTable);
router.post("/addUser", userManagementController.addUser);
router.post("/updateUser", userManagementController.updateUser);
router.post("/deleteUser", userManagementController.deleteUser);

module.exports = router;