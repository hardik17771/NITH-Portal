const Student = require("../models/student");
const Form = require("../models/form");
const StudentVerification = require("../models/studentVerification");
const bcrypt = require("bcrypt");
//email handeler
const nodemailer = require("nodemailer");
//unique strings
const { v4: uuidv4 } = require("uuid");
//env variables

require("dotenv").config();

//nodemailer

const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: process.env.GMAIL_MAIL,
    pass: process.env.GMAIL_PASSWORD,
  },
});

transporter.verify((error, success) => {
  if (error) {
    console.log(error);
  } else {
    console.log("Lets go babbyy");
  }
});

//send verification email

const sendVerificationEmail = ({ _id, roll }, res) => {
  //url to be used in the mail
  const currentUrl = "http://localhost:8080/";
  const uniqueString = uuidv4() + _id;
  const roll2 = roll.toLowerCase();
  const email = roll2 + "@nith.ac.in";
  //mail options
  const mailOptions = {
    from: process.env.GMAIL_MAIL,
    to: email,
    subject: "Verify your email",
    html: `
‹p›Verify your email address to complete the signup and login into your account.‹/p›<p>This link link <b>expires in 6 hours</b>.</p><p>Press <a href=${
      currentUrl + "api/v1" + _id + "/" + uniqueString
    }> here </a> to proceed.</p>`,
  };

  //hashing the unique string

  const saltRounds = 10;
  bcrypt
    .hash(uniqueString, saltRounds)
    .then((hashedUniqueString) => {
      //set values in userVerification
      const userVerification = new StudentVerification({
        userId: _id,
        uniqueString: hashedUniqueString,
        createdAt: Date.now(),
        expiresAt: Date.now() + 21600000,
      });
      userVerification
        .save()
        .then(() => {
          transporter
            .sendMail(mailOptions)
            .then(() => {
              //email sent and verification saved
              res.status(201).json({
                type: "PENDING",
                message: "verification mail sent successfully",
              });
            })
            .catch((err) => {});
        })
        .catch((err) => {
          console.log(err);
          res.status(201).json({
            type: "failure",
            message: "verification email mailed",
          });
        });
    })
    .catch((err) => {
      console.log(err);
      res.status(201).json({
        type: "failure",
        message: "verification email mailed",
      });
    });
};

//verify email

module.exports.verifyEmail = (req, res) => {
  let { userId, uniqueString } = req.params;
  StudentVerification.find({ userId })
    .then((result) => {
      if (result.length > 0) {
        //user verification record exits
        const { expiresAt } = result[0];
        const hashedUniqueString = result[0].uniqueString;
        //checking for expired unique string
        if (expiresAt < Date.now()) {
          //as record has expired we delete it
          StudentVerification.deleteOne({ userId })
            .then((result) => {
              res.redirect("/api/v1/login");
            })
            .catch((err) => {
              res.status(201).json({
                type: "failure",
                message: "record not deleted",
              });
            });
        } else {
          //valid verification with not expired
          //verifiying if the unquie string has not been altered with
          bcrypt
            .compare(uniqueString, hashedUniqueString)
            .then((result) => {
              if (result) {
                //string matches
                Student.updateOne({ _id: userId }, { verified: true })
                  .then(() => {
                    StudentVerification.deleteOne({ userId })
                      .then((result) => {
                        res.status(201).json({
                          type: "success",
                          message: "login successful",
                        });
                      })
                      .catch((err) => {
                        console.log(err);
                        res.status(201).json({
                          type: "failure",
                          message: "an error occurred",
                        });
                      });
                  })
                  .catch((err) => {
                    console.log(err);
                    res.status(201).json({
                      type: "failure",
                      message: "an error occurred",
                    });
                  });
              } else {
                //existing record but incorrect verification details passed
                res.redirect("/api/v1/login");
              }
            })
            .catch((err) => {
              res.status(201).json({
                type: "failure",
                message: "verification string has been altered with",
              });
            });
        }
      } else {
        res.status(201).json({
          type: "failure",
          message: "verification record does not exist.Please login first",
        });
      }
    })
    .catch((err) => {
      console.log(err);
      res.status(201).json({
        type: "failure",
        message: "verification email mailed",
      });
    });
};

function escapeRegex(text) {
  return text.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&");
}

exports.getStudents = async (req, res, next) => {
  if (req.query.search) {
    console.log(req.query.search);
    const regex = new RegExp(escapeRegex(req.query.search), "gi");
    const student = await Student.find({ name: regex });
    res.json(student);
  } else {
    const allData = await Student.find();
    res.json(allData);
  }
};

exports.postForm = async (req, res, next) => {
  let { Name, Department, RoomNum, phone, address, description } = req.body;

  // const regex = new RegExp(escapeRegex(req.body.roll), "gi");
  const form = new Form({
    Name: Name,
    Department: Department,
    RoomNum: RoomNum,
    phone: phone,
    address: address,
    description: description,
  });
  await form
    .save()
    .then((result) => {
      console.log(result);

      res.status(201).json({
        type: "success",
        message: "form submitted successfully",
        data: result,
      });
    })
    .catch((err) => {
      console.log(err);
      res.status(201).json({
        type: "failure",
        message: "form is not submitted",
      });
    });
  console.log(form);

  // if (!studentExists.form) {
  //   const form = req.body;
  //   await Student.updateOne({ form: form });
  //   console.log(studentExists);
  // res.status(201).json({
  //   type: "success",
  //   message: "form submitted successfully",
  //   data: req.body,
  // });
  // } else {
  // res.status(201).json({
  //   type: "failure",
  //   message: "form is already submitted",
  // });
  // }
};

exports.getForm = async (req, res, next) => {
  const form = await Form.find({});
  console.log(form);
  res.status(201).json({
    type: "success",
    message: "form data",
    data: form,
  });
};

exports.LoginStudent = async (req, res, next) => {
  const { email } = req.body;
  const mail = email.slice(0, 8);
  const student = await Student.find({ roll: new RegExp(`^${mail}$`, "i") });
  console.log(student);
  const roll2 = student[0].roll;
  console.log(roll2);
  const newStudent = await Student.findOneAndUpdate(
    { roll: roll2 },
    { verified: false },
    {
      new: true,
    }
  );

  console.log(newStudent);
  if (student.length === 0) {
    res.status(201).json({
      type: "failure",
      message: "something went wrong please try again",
    });
  } else {
    res.status(201).json({
      type: "success",
      message: "logged in successfully",
      data: newStudent,
    });
  }
};
