const express = require("express");
const appUserController = require("../controllers/app.user.controller");
const { isLoggedIn } = require("../middleware");

const router = express.Router();

router.get("/student", appUserController.getStudents);

router.post("/form", isLoggedIn, appUserController.postForm);

module.exports = router;
