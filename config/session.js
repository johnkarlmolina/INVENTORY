// config/session.js
const session = require("express-session");

const sessionConfig = {
  secret: process.env.SESSION_SECRET || "superSecretKey",
  resave: false,
  saveUninitialized: true,
  cookie: {
    secure: process.env.NODE_ENV === "production",
    httpOnly: true,
    sameSite: "lax",
    maxAge: 1000 * 60 * 60 * 2, // 2h
  },
};

module.exports = { sessionConfig };
