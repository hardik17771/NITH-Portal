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
