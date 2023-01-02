const Form = require("../models/form");

exports.getForms = async (req, res, next) => {
  const courses = await Form.find({});
  res.render("admin/courses", { courses });
};

exports.getAForm = async (req, res, next) => {
  const course = await Form.findById(req.params.id);
  console.log(course.units);
  res.render("admin/show", { course });
};

exports.newForm = async (req, res, next) => {
  res.render("admin/new");
};

exports.PostnewForm = async (req, res, next) => {
  const course = new Form(req.body.course);
  console.log(course);

  await course.save();
  res.redirect(`/admin/courses/${course._id}`);
};

exports.editForm = async (req, res, next) => {
  const course = await Form.findById(req.params.id);
  res.render("admin/edit", { course });
};

exports.patchForm = async (req, res, next) => {
  const { id } = req.params;
  const course = await Form.findByIdAndUpdate(id, { ...req.body.course });

  res.redirect(`/admin/courses/${course._id}`);
};

exports.deleteForm = async (req, res, next) => {
  const { id } = req.params;
  await Course.findByIdAndDelete(id);
  res.redirect("/admin/courses");
};
