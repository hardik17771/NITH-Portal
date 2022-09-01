const express = require("express");

const adminController = require("../controllers/admin.controller");

const router = express.Router();

//courses
router.get("/forms", adminController.getForms);

router.get("/forms/new", adminController.newForm);

router.post("/forms", adminController.PostnewForm);

//courses editing
router.get("/forms/:id", adminController.getAcourse);

router.get("/forms/:id/edit", adminController.editCourse);

router.put("/forms/:id", adminController.patchCourse);

router.delete("/forms/:id", adminController.deleteCourse);

module.exports = router;
