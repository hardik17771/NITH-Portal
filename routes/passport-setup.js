const passport = require("passport");
const GoogleStrategy = require("passport-google-oauth2").Strategy;

passport.serializeUser(function (user, done) {
  done(null, user);
});

passport.deserializeUser(function (user, done) {
  done(null, user);
});

passport.use(
  new GoogleStrategy(
    {
      clientID: process.env.GOOGLE_CLIENT_ID,
      clientSecret: process.env.GOOGLE_CLIENT_SECRET,
      callbackURL: "https://nith-portal-11-qsje.onrender.com",
      passReqToCallback: true,
    },
    function (reqest, accessToken, refreshToken, profile, done) {
      console.log(profile);
      return done(null, profile);
    }
  )
);
