const mongoose = require("mongoose");
const Schema = mongoose.Schema;

//to be added date datatype
//can be done using timestamp
//to create a function that will take the return date or time
//and will give notification accordingly

const FormSchema = new Schema({
  Name: String,
  Department: String,
  RoomNum: String,
  roll: String,
  phone: String,
  address: String,
  description: String,
  student: {
    type: Schema.Types.ObjectId,
    ref: "Student",
  },
  mmcaVerified: { type: Boolean, default: false },
  guardVerified: { type: Boolean, default: false },
  createdAt: { type: Date, default: Date.now() },
  expiresAt: { type: Date, default: Date.now() + 21600000 },
});

module.exports = mongoose.model("Form", FormSchema);
