const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const StudentSchema = new Schema({
  name: String,
  mail_id: String,
  roll: String,
});

module.exports = mongoose.model("Student", StudentSchema);
