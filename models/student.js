const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const StudentSchema = new Schema({
  name: String,
  mail_id: String,
  roll: String,
  form: {
    type: Schema.Types.ObjectId,
    ref: "Form",
  },
  verified: Boolean,
  mmcaVerified: Boolean,
  guardVerified: Boolean,
});

module.exports = mongoose.model("Student", StudentSchema);
