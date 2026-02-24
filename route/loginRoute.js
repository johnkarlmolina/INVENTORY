const express = require("express");
const router = express.Router();

const loginController = require("../controller/loginController");

//login page route
router.get("/", loginController.loginPageRender);   

module.exports = router;