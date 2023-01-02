const express = require("express");

const adminController = require("../controllers/admin.controller");

const router = express.Router();

router.get("/forms", adminController.getForms);

router.get("/forms/new", adminController.newForm);

router.post("/forms", adminController.PostnewForm);
//for editing
router.get("/forms/:id", adminController.getAForm);

router.get("/forms/:id/edit", adminController.editForm);

router.put("/forms/:id", adminController.patchForm);

router.delete("/forms/:id", adminController.deleteForm);

module.exports = router;
