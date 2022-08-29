const express = require("express");
const appUserController = require("../controllers/app.user.controller");

const router = express.Router();

router.get("/", appUserController.getStudents);

module.exports = router;
