const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const StudentVerificationSchema = new Schema({
  userId: String,
  uniqueString: String,
  createdAt: Date,
  expiresAt: Date,
});

module.exports = mongoose.model(
  "StudentVerfication",
  StudentVerificationSchema
);
