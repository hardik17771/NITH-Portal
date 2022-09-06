const express = require("express");
const appUserController = require("../controllers/app.user.controller");

const router = express.Router();

router.get("/student", appUserController.getStudents);

router.post("/form", appUserController.postForm);

module.exports = router;
