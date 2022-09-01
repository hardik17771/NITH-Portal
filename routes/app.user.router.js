const express = require("express");
const appUserController = require("../controllers/app.user.controller");

const router = express.Router();

router.get("/student", appUserController.getStudents);

module.exports = router;
