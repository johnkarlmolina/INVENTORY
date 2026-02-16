const express = require("express");
const https = require('https');
const path = require("path");
const cors = require("cors");
const helmet = require("helmet");
const compression = require("compression");
const morgan = require("morgan");
const session = require("express-session");
const { sessionConfig } = require("./config/session");


require("dotenv").config();
const fs = require("fs");

const app = express();
const sslOptions = {
  key: fs.readFileSync('ssl/key.pem'),      // Your private key
  cert: fs.readFileSync('ssl/cert.pem')     // Your certificate
};

const server = https.createServer(sslOptions,app);

app.use('/fontawesome', express.static('node_modules/@fortawesome/fontawesome-free'));
app.use('/Images', express.static('Images'));
app.set("views", path.join(__dirname, "views"));
app.use(session(sessionConfig));

const computerRoutes = require("./route/computerRoutes");
const authRoutes = require("./route/authRoutes");
const peripheralRoute = require("./route/peripheralRoute");
const servicesRoute = require("./route/servicesRoute");
const maintenanceRoute = require("./route/maintenanceRoute");
const consumableRoute = require("./route/consumableRoute");
const reportsRoute = require("./route/reportsRoute");



app.use((req, res, next) => {
  res.set('Cache-Control', 'no-store, no-cache, must-revalidate, private');
  next();
});



//app.use("/computers", computerRoutes);

// Middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());
app.use(helmet({ contentSecurityPolicy: false }));
app.use(compression());
app.use(morgan("combined"));
app.set("trust proxy", 1);
app.set("view engine", "ejs");

app.use("/", authRoutes);
app.use("/computers", computerRoutes);
app.use("/peripherals", peripheralRoute);
app.use("/services", servicesRoute);
app.use("/maintenance", maintenanceRoute);
app.use("/consumable", consumableRoute);
app.use("/reports", reportsRoute);

module.exports = { app, server };