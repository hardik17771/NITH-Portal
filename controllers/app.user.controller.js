const Student = require("../models/student");

function escapeRegex(text) {
  return text.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&");
}

exports.getStudents = async (req, res, next) => {
  if (req.query.search) {
    console.log(req.query.search);
    const regex = new RegExp(escapeRegex(req.query.search), "gi");
    const student = await Student.find({ name: regex });
    res.json(student);
  } else {
    const allData = await Student.find();
    res.json(allData);
  }
};

exports.postForm = async (req, res, next) => {
  let { name, purpose, branch, duration, roll } = req.body;
  console.log(req.body);
  const regex = new RegExp(escapeRegex(req.body.roll), "gi");
  const studentExists = await Student.findOne({ roll: regex });

  if (!studentExists.form) {
    const form = req.body;
    await Student.updateOne({ form: form });
    console.log(studentExists);
    res.status(201).json({
      type: "success",
      message: "form submitted successfully",
      data: req.body,
    });
  } else {
    res.status(201).json({
      type: "failure",
      message: "form is already submitted",
    });
  }
};
