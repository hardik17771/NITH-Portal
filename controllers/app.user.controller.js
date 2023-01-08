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
  port: 465,
  host: "smtp.gmail.com",
});

transporter.verify((error, success) => {
  if (error) {
    console.log(error);
  } else {
    console.log("Lets go babbyy");
  }
});

// const msg = {
//   from: process.env.GMAIL_MAIL,
//   to: "21bma016@nith.ac.in",
//   subject: "Asrani ka NUNU",
//   text: "Asrani ka NUNU!!!",
// };

// module.exports.checkMail = transporter.sendMail(msg, (err) => {
//   if (err) {
//     console.log(err);
//   } else {
//     console.log("mail sent");
//   }
// });

//send verification email

const sendVerificationEmail = ({ _id, roll }, res) => {
  //url to be used in the mail
  _id = _id.toString();

  const currentUrl = "https://nith-portal-11-qsje.onrender.com/";
  const uniqueString = uuidv4() + _id;
  console.log(roll);
  console.log(_id);
  // const roll2 = roll.toLowerCase();
  console.log(roll);
  //mail options
  const mailOptions = {
    from: process.env.GMAIL_MAIL,
    to: roll,
    subject: "Verify your email",
    html: `
Verify your email address to complete the signup and login into your account.<p>This link link <b>expires in 6 hours</b>.</p><p>Press <a href=${
      currentUrl + "api/v1/verify/" + _id + "/" + uniqueString
    }> here </a> to proceed.</p>`,
  };

  //hashing the unique string

  const saltRounds = 10;
  bcrypt
    .hash(uniqueString, saltRounds)
    .then(async (hashedUniqueString) => {
      const check = await StudentVerification.find({ userId: _id });
      //set values in userVerification
      if (!check.length > 0) {
        console.log(check);
        const userVerification = new StudentVerification({
          userId: _id,
          uniqueString: hashedUniqueString,
          createdAt: Date.now(),
          expiresAt: Date.now() + 21600000,
        });
        userVerification
          .save()
          .then(() => {
            // console.log(mailOptions);
            transporter
              .sendMail(mailOptions)
              .then(() => {
                //email sent and verification saved
                res.status(201).json({
                  type: "PENDING",
                  message: "verification mail sent successfully",
                });
              })
              .catch((err) => {
                console.log(err);
                res.status(201).json({
                  type: "failure",
                  message: "verification email not sent",
                });
              });
          })
          .catch((err) => {
            console.log(err);
            res.status(201).json({
              type: "failure",
              message: "verification email not sent",
            });
          });
      } else {
        res.status(201).json({
          type: "failure",
          message: "verification email is already sent",
        });
      }
    })
    .catch((err) => {
      console.log(err);
      res.status(201).json({
        type: "failure",
        message: "verification email not mailed",
      });
    });
};

//verify email

module.exports.verifyEmail = (req, res) => {
  let { userId, uniqueString } = req.params;
  console.log(userId, uniqueString);
  StudentVerification.find({ userId })
    .then((result) => {
      if (result.length > 0) {
        console.log(result);
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
                  .then((result) => {
                    console.log(result);
                    StudentVerification.deleteOne({ userId })
                      .then((result) => {
                        res.render("verify");
                        // res.status(201).json({
                        //   type: "success",
                        //   message: "login successful",
                        // });
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
  let { Name, Department, RoomNum, phone, address, description, roll } =
    req.body;
  userId = req.params;
  const id = userId.id;
  console.log(userId);
  console.log(id);

  // const regex = new RegExp(escapeRegex(req.body.roll), "gi");
  // console.log(first);

  const form = new Form({
    Name: Name,
    roll: roll,
    Department: Department,
    RoomNum: RoomNum,
    phone: phone,
    address: address,
    description: description,
  });

  const student = await Student.findById(id);
  await form.save().then(async (result) => {
    console.log(result);
    if (student.form === undefined) {
      student.form = form._id;

      await student
        .save()
        .then(async (result) => {
          form.student = id;
          await form
            .updateOne({ student: id })
            .then(async (result) => {
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
                message: "System error",
              });
            });
        })
        .catch((err) => {
          console.log(err);
          res.status(201).json({
            type: "failure",
            message: "System error",
          });
        });

      console.log(student.form);
    } else {
      res.status(201).json({
        type: "failure",
        message: "form is already  submitted",
      });
    }
  });

  //   .then((result) => {
  //     console.log(result);

  // res.status(201).json({
  //   type: "success",
  //   message: "form submitted successfully",
  //   data: result,
  // });
  //   })
  //   .catch((err) => {
  //     console.log(err);

  //   });
  // console.log(form);

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
  // console.log(student);
  const roll2 = student[0].roll;
  console.log(roll2);
  const newStudent = await Student.findOneAndUpdate(
    { roll: roll2 },
    { verified: false },
    {
      new: true,
    }
  );
  const _id = student[0]._id;
  const roll = email.toLowerCase();
  // console.log(newStudent);
  // if (student.length === 0) {
  //   res.status(201).json({
  //     type: "failure",
  //     message: "something went wrong please try again",
  //   });
  // } else {
  //   res.status(201).json({
  //     type: "success",
  //     message: "logged in successfully",
  //     data: newStudent,
  //   });
  // }
  // console.log(mail);
  sendVerificationEmail({ _id, roll }, res);
};

exports.mmcaVerify = async (req, res, next) => {
  formId = req.params;
  const id = formId.formId;
  console.log(formId);
  console.log(id);

  Form.findByIdAndUpdate(id, { mmcaVerified: true })
    .then((result) => {
      console.log(result);
      const address = result.address;
      const name = result.Name;
      const email = result.roll + "@nith.ac.in";
      const mailOptions = {
        from: process.env.GMAIL_MAIL,
        to: email,
        subject: "MMCA has verified your outpass",
        html: `
    Dear ${name} your outpass with the request to go to <b>${address}</b> has been approved .Please show this message to respective authorites at gate for further proceedings`,
      };
      console.log(mailOptions);

      transporter
        .sendMail(mailOptions)
        .then(() => {
          //email sent and verification saved
          console.log("first");
          res.status(201).json({
            type: "success",
            message: "mmca has approved the form",
          });
        })
        .catch((err) => {
          console.log(err);
          res.status(201).json({
            type: "failure",
            message: "verification email not sent",
          });
        });
    })
    .catch((err) => {
      console.log(err);
    });
};

exports.guardVerify = async (req, res, next) => {
  formId = req.params;
  const id = formId.formId;
  console.log(formId);
  console.log(id);

  Form.findByIdAndUpdate(id, { guardVerified: true })

    .then((result) => {
      // res.status(401).json({
      //   type: "success",
      //   message: "guard has verified your form",
      // });
      console.log(result);
      const address = result.address;
      const name = result.Name;
      const email = "21bma010@nith.ac.in";
      const mailOptions = {
        from: process.env.GMAIL_MAIL,
        to: email,
        subject: `${name} has left the campus`,
        html: `
        ${name}'s Outpass with the request to go to ${address} has been verified by the guard`,
      };
      console.log(mailOptions);

      transporter
        .sendMail(mailOptions)
        .then(() => {
          //email sent and verification saved
          console.log("first");
          res.status(201).json({
            type: "success",
            message: "guard has verified your outpass",
          });
        })
        .catch((err) => {
          console.log(err);
          res.status(201).json({
            type: "failure",
            message: "verification email not sent",
          });
        });
    })
    .catch((err) => {
      console.log(err);
    });
};

exports.guardVerifyReturn = async (req, res, next) => {
  formId = req.params;
  const id = formId.formId;
  console.log(formId);
  console.log(id);
  const form = await Form.findById(id);
  console.log(form.student);
  studentId = form.student;
  const student = await Student.findOneAndUpdate(
    { _id: studentId },
    { $unset: { form: 1 } }
  );

  Form.findByIdAndDelete(id)
    .then((result) => {
      console.log(result);
      const address = result.address;
      const name = result.Name;
      const email = "21bma010@nith.ac.in";
      const mailOptions = {
        from: process.env.GMAIL_MAIL,
        to: email,
        subject: `${name} has returned to the campus`,
        html: `
        ${name} has returned to the campus `,
      };
      console.log(mailOptions);

      transporter
        .sendMail(mailOptions)
        .then(() => {
          //email sent and verification saved
          console.log("first");
          res.status(201).json({
            type: "success",
            message: "guard has verified your outpass",
          });
        })
        .catch((err) => {
          console.log(err);
          res.status(201).json({
            type: "failure",
            message: "verification email not sent",
          });
        });
    })
    .catch((err) => {
      console.log(err);
    });
};

exports.mmcaDeny = async (req, res, next) => {
  formId = req.params;
  const id = formId.formId;
  console.log(formId);
  console.log(id);

  Form.findByIdAndUpdate(id, { mmcaVerified: false })
    .then((result) => {
      console.log(result);
      const address = result.address;
      const name = result.Name;
      const email = result.roll + "@nith.ac.in";
      const mailOptions = {
        from: process.env.GMAIL_MAIL,
        to: email,
        subject: "MMCA has declined your outpass",
        html: `
    Dear ${name} your outpass with the request to go to <b>${address}</b> has been Denied .Please contact MMCA for more information`,
      };
      console.log(mailOptions);

      transporter
        .sendMail(mailOptions)
        .then(() => {
          //email sent and verification saved
          console.log("first");
          res.status(201).json({
            type: "success",
            message: "mmca has denied the form",
          });
        })
        .catch((err) => {
          console.log(err);
          res.status(201).json({
            type: "failure",
            message: "denial email not sent",
          });
        });
    })
    .catch((err) => {
      console.log(err);
    });
};

exports.mmcaDenyButton = async (req, res, next) => {
  formId = req.params;
  const id = formId.formId;
  console.log(formId);
  console.log(id);

  Form.findByIdAndUpdate(id, { mmcaVerified: false })
    .then((result) => {
      res.status(201).json({
        type: "success",
        message: "form denied successfully",
      });
    })
    .catch((err) => {
      console.log(err);
    });
};
