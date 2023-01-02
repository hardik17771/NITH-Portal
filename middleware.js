const Student = require("./models/student");

module.exports.isLoggedIn = (req, res, next) => {
  if (!req.isAuthenticated()) {
    req.session = null;

    res.status(201).json({
      type: "failure",
      message: "form is already submitted",
    });
  }
  next();
};
