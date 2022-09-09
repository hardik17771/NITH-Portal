const express = require("express");

const userController = require("../controllers/user.controller");

const router = express.Router();

//forms
// router.get("/forms", userController.getForms);

router.get("/forms/new", userController.newForm);

router.post("/forms", userController.PostnewForm);

router.get("/forms/:id", userController.getAForm);

//form editing

router.get("/forms/:id/edit", userController.editForm);

router.put("/forms/:id", userController.patchForm);

router.delete("/forms/:id", userController.deleteForm);

module.exports = router;
