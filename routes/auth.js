require("dotenv").config();
const express = require("express");
const router = express.Router();
const passport = require("passport");
const session = require("express-session");
require("./passport-setup");
// Auth middleware that checks if the user is logged in
const isLoggedIn = (req, res, next) => {
  if (req.user) {
    next();
  } else {
    res.sendStatus(401);
  }
};
const isStudentId = (req, res, next) => {
  const email = req.user.emails[0].value;
  const str_split = email.split("@");
  const email_domain = str_split[str_split.length - 1];
  if (email_domain === "nith.ac.in") {
    next();
  } else {
    console.log(str_split);
    console.log(email_domain);
    return res.status(404).json({
      error: "Enter Student ID",
    });
  }
};
const sessionConfig = {
  secret: "thisshouldbeabettersecret!",
  resave: false,
  saveUninitialized: true,
  cookie: {
    httpOnly: true,
    expires: Date.now() + 1000 * 60 * 60 * 24 * 7,
    maxAge: 1000 * 60 * 60 * 24 * 7,
  },
};
router.use(session(sessionConfig));

router.get("/", (req, res) => res.render("admin/auth"));
router.get("/failed", (req, res) => res.send("You Failed to log in!"));

// In this route you can see that if the user is logged in u can acess his info in: req.user
router.get("/good", isLoggedIn, isStudentId, (req, res) => {
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

router.get("/logout", (req, res) => {
  // req.session = null;
  req.logout(function (err) {
    if (err) {
      console.log(err);
    }
    res.redirect("/");
  });
});

module.exports = router;
