const express = require("express");
const router = express.Router();

const userManagementController = require("../controller/userManagementController");
const { requireAdmin } = require("../middleware/authMiddleware");

router.get("/", userManagementController.renderUserManagement);
router.post("/userDataTable", userManagementController.userDataTable);
router.post("/inactiveUserDataTable", requireAdmin, userManagementController.inactiveUserDataTable);
router.post("/addUser", requireAdmin, userManagementController.addUser);
router.post("/updateUser", requireAdmin, userManagementController.updateUser);
router.post("/deleteUser", requireAdmin, userManagementController.deleteUser);
router.post("/activateUser", requireAdmin, userManagementController.activateUser);

module.exports = router;