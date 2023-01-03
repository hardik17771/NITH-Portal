const express = require("express");
const appUserController = require("../controllers/app.user.controller");
const { isLoggedIn } = require("../middleware");
const path = require("path");

const router = express.Router();
router.use(express.static(path.join(__dirname, "../public")));

router.get("/student", appUserController.getStudents);

router.post("/form", appUserController.postForm);

router.get("/form/show", appUserController.getForm);

router.get("/:userId/:uniqueString", appUserController.verifyEmail);

router
  .route("/login")
  .get((req, res) => {
    res.render("login");
  })
  .post(appUserController.LoginStudent);

module.exports = router;
