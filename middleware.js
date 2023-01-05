const student = require("./models/student");
const Student = require("./models/student");

module.exports.isLoggedIn = async (req, res, next) => {
  const { email } = req.body;
  const mail = email.slice(0, 8);
  console.log(mail);
  Student.find({ roll: new RegExp(`^${mail}$`, "i") })
    .then((result) => {
      console.log(result);
      if (result[0].verified === true) {
        console.log("here");
        res.status(401).json({
          type: "success",
          message: "You are  logged in",
          data: result,
        });
      } else {
        console.log("here");
        next();
      }
    })
    .catch((err) => {
      console.log(err);
    });
};

module.exports.isLoggedOut = async (req, res, next) => {
  userId = req.params;
  const id = userId.userId;
  console.log(userId);
  console.log(id);

  const student = await Student.findById(id);

  student
    .update({ verified: false })
    .then((result) => {
      res.status(401).json({
        type: "success",
        message: "You are  logged out successfully",
      });
    })
    .catch((err) => {
      console.log(err);
    });
};
