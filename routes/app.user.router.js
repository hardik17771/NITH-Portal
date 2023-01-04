const express = require("express");
const appUserController = require("../controllers/app.user.controller");
const { isLoggedIn, isLoggedOut } = require("../middleware");
const path = require("path");

const router = express.Router();
router.use(express.static(path.join(__dirname, "../public")));

router.get("/student", appUserController.getStudents);

router.post("/form/:id", appUserController.postForm);

router.get("/form/show", appUserController.getForm);

router.get("/:userId/:uniqueString", appUserController.verifyEmail);

router.get("/:userId", isLoggedOut);

router.post("/form/mmca/:formId", appUserController.mmcaVerify);
router.post("/form/guard/:formId", appUserController.guardVerify);
router.post("/form/guardReturn/:formId", appUserController.guardVerifyReturn);
router
  .route("/login")
  .get((req, res) => {
    res.render("login");
  })
  .post(appUserController.LoginStudent, isLoggedIn);

module.exports = router;
