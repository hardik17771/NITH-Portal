const Student = require("../models/student");
exports.getStudents = (req, res, next) => {
  Student.find()
    .then((student) => {
      res.status(200).json({ message: "Students Fetched", students: student });
    })
    .catch((err) => {
      if (!err.status) {
        err.status = 500;
      }
      console.log(err);
      next(err);
    });
};
