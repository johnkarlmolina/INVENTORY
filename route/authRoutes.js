const express = require("express");
const router = express.Router();
//const authController = require("../controller/authController");

// Root page - redirect to dashboard
router.get("/", (req, res) => {
  res.redirect("/dashboard");
});

module.exports = router;