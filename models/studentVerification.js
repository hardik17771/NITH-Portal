const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const StudentVerificationSchema = new Schema({
  userId: String,
  uniqueString: String,
  createdAt: Date,
  expriesAt: Date,
});

module.exports = mongoose.model(
  "StudentVerfication",
  StudentVerificationSchema
);
