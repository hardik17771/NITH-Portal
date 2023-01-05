const express = require("express");
const appUserController = require("../controllers/app.user.controller");
const { isLoggedIn, isLoggedOut } = require("../middleware");
const path = require("path");

const router = express.Router();
router.use(express.static(path.join(__dirname, "../public")));

router.get("/student", appUserController.getStudents);
router.route("/verify").get((req, res) => {
  res.render("verify");
});
router
  .route("/login")
  .get((req, res) => {
    res.render("login");
  })
  .post(isLoggedIn, appUserController.LoginStudent);

router.get("/form/show", appUserController.getForm);
router.get("/login/:userId", isLoggedOut);
router.get(
  "/verify/:userId/:uniqueString",
  (req, res, next) => {
    console.log("check");
    return next();
  },
  appUserController.verifyEmail
);

router.post("/form/mmca/:formId", appUserController.mmcaVerify);
router.post("/form/guard/:formId", appUserController.guardVerify);
router.post("/form/guardReturn/:formId", appUserController.guardVerifyReturn);
router.post("/form/:id", appUserController.postForm);

module.exports = router;
