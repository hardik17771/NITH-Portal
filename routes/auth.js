require("dotenv").config();
const express = require("express");
const router = express.Router();
const passport = require("passport");
const Student = require("../models/student");

require("./passport-setup");
// Auth middleware that checks if the user is logged in
const isLoggedIn = async (req, res, next) => {
  if (req.user) {
    const mail = req.user.emails[0].value.slice(0, 8);

    const student = await Student.find({ roll: new RegExp(`^${mail}$`, "i") });
    if (student.length === 0) {
      console.log(student);
      console.log(req.session);
      req.session = null;
      console.log(req.session);
      res.status(201).json({
        type: "failure",
        message: "Please use college id to login",
      });
    } else {
      console.log(student);
      next();
    }
  } else {
    res.sendStatus(401);
  }
};

router.get("/", (req, res) => res.render("admin/auth"));
router.get("/failed", (req, res) => res.send("You Failed to log in!"));

// In this route you can see that if the user is logged in u can acess his info in: req.user
router.get("/good", isLoggedIn, (req, res) => {
  res.render("admin/authSucess", {
    name: req.user.displayName,
    pic: req.user.photos[0].value,
    email: req.user.emails[0].value,
  });
});

// Auth Routes
router.get(
  "/google",
  passport.authenticate("google", { scope: ["profile", "email"] })
);

router.get(
  "/google/callback",
  passport.authenticate("google", { failureRedirect: "/failed" }),

  function (req, res) {
    // Successful authentication, redirect home.

    res.redirect("/good");
  }
);

router.get("/logout", (req, res, next) => {
  req.session = null;
  req.logout(function (err) {
    if (err) {
      return next(err);
    }
  });
  res.redirect("/");
});

module.exports = router;
