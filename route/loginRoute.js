const express = require("express");
const router = express.Router();
const loginController = require("../controller/loginController");

//login page route
router.get("/", loginController.loginPageRender);

//login submit route
router.post("/submit", loginController.loginSubmit);

//logout route
router.get("/logout", loginController.logout);

module.exports = router;