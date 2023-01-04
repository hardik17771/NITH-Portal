const mongoose = require("mongoose");
const Student = require("../models/student");
const students = require("../seeds/seeder_helper");

mongoose.connect(
  "mongodb+srv://Mrigesh_Thakur:ftmZFK4URstWGGgK@cluster0.wsogi.mongodb.net/student?retryWrites=true&w=majority"
);
const db = mongoose.connection;

db.on("error", console.error.bind(console, "connection error"));
db.once("open", () => {
  console.log("DATABASE IN PLACE");
});

const seedDB = async () => {
  await Student.deleteMany({});
  for (let i = 0; i < 1858; i++) {
    const c = new Student({
      name: `${students[i].name}`,
      roll: `${students[i].roll}`,
      verified: false,
    });

    await c.save();
    console.log(c);
  }
};

seedDB();
