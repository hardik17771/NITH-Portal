const Form = require("../models/form");

//getting form functions

exports.getForms = async (req, res, next) => {
  const form = await Form.find({});
  console.log(form);
  res.render("admin/form", { form });
};

exports.getAForm = async (req, res, next) => {
  const form = await Form.findById(req.params.id);

  res.render("admin/show", { form });
};

exports.newForm = async (req, res, next) => {
  res.render("admin/new");
};

exports.PostnewForm = async (req, res, next) => {
  const form = new Form(req.body.form);
  console.log(form);
  await form.save();
  res.redirect(`/user/forms/${form._id}`);
};

//editing form function

exports.editForm = async (req, res, next) => {
  const form = await Form.findById(req.params.id);
  res.render("admin/edit", { form });
};

exports.patchForm = async (req, res, next) => {
  const { id } = req.params;
  const form = await Form.findByIdAndUpdate(id, { ...req.body.form });

  res.redirect(`/user/forms/${form._id}`);
};

exports.deleteForm = async (req, res, next) => {
  const { id } = req.params;
  await Form.findByIdAndDelete(id);
  res.redirect("/user/forms");
};
