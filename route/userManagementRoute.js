const express = require("express");
const router = express.Router();

const userManagementController = require("../controller/userManagementController");

router.get("/", userManagementController.renderUserManagement);
router.post("/userDataTable", userManagementController.userDataTable);
router.post("/inactiveUserDataTable", userManagementController.inactiveUserDataTable);
router.post("/addUser", userManagementController.addUser);
router.post("/updateUser", userManagementController.updateUser);
router.post("/deleteUser", userManagementController.deleteUser);
router.post("/activateUser", userManagementController.activateUser);

module.exports = router;