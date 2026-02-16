const express = require("express");
const router = express.Router();
//const authController = require("../controller/authController");

// Root page
router.get("/", (req, res) => {

     res.render("inventory");
 // console.log(req.session.uid);
  /*if (req.session.loggedIn) {
    res.render("index", {
      user_name: req.session.user_name,
      uid: req.session.uid,
      user_access_lvl:req.session.user_access_lvl,
      user_fullname: req.session.user_fullname,
      user_department: req.session.user_department,
      content: "welcome",
    });
  } 
  
  else {
    res.redirect("/login");
  }*/
});

module.exports = router;