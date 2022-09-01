const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const methodOverride = require("method-override");
const path = require("path");
const mongoose = require("mongoose");
const cors = require("cors");
const port = process.env.PORT || 8080;
const adminRoutes = require("./routes/admin.router");
const ejsMate = require("ejs-mate");
const formRoutes = require("./routes/form.router");
const authRoutes = require("./routes/auth");
const passport = require("passport");
const session = require("express-session");
const userRoutes = require("./routes/app.user.router");
const studentModel = require("./models/student");

const sessionConfig = {
  secret: "thisshouldbeabettersecret!",
  resave: false,
  saveUninitialized: true,
  cookie: {
    httpOnly: true,
    expires: Date.now() + 1000 * 60 * 60 * 24 * 7,
    maxAge: 1000 * 60 * 60 * 24 * 7,
  },
};

require("dotenv").config();

app.engine("ejs", ejsMate);
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));
app.use(express.static(path.join(__dirname, "public")));

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(methodOverride("_method"));

app.use(session(sessionConfig));
app.use(passport.initialize());
app.use(passport.session());

app.use("/admin", adminRoutes);
app.use("/user", formRoutes);
app.use("/", authRoutes);
app.use("/api/v1", userRoutes);

app.all("*", (req, res, next) => {
  next(res.render("errorAll"));
});

app.use((err, req, res, next) => {
  const { statusCode = 500 } = err;
  if (!err.message) err.message = "Oh No, Something Went Wrong!";
  res.status(statusCode).render("error", { err });
});

mongoose
  .connect(
    `mongodb+srv://Mrigesh_Thakur:ftmZFK4URstWGGgK@cluster0.wsogi.mongodb.net/student?retryWrites=true&w=majority`
  )
  .then((result) => {
    console.log("Database Connected!!");
    app.listen(port, () => {
      console.log("lets goo");
    });
  })
  .catch((err) => {
    console.log(err);
  });
