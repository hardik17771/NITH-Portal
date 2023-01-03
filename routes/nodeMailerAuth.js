const nodemailer = require("nodemailer");

const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: "nithportal11@gmail.com",
    pass: process.env.GMAIL_PASSWORD,
  },
});
