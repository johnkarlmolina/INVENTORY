const express = require("express");
const router = express.Router();
//const authController = require("../controller/authController");

// Root page - redirect to login
router.get("/", (req, res) => {
  res.redirect("/login");
});

module.exports = router;