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
  phone: String,
  address: String,
  description: String,
  MMCAverified: Boolean,
  Guardverified: Boolean,
});

module.exports = mongoose.model("Form", FormSchema);
