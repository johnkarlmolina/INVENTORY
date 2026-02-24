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
const dashboardRoute = require("./route/dashboardRoute");
const inventoryRoute = require("./route/inventoryRoute");
const peripheralRoute = require("./route/peripheralRoute");
const servicesRoute = require("./route/servicesRoute");
const maintenanceRoute = require("./route/maintenanceRoute");
const consumableRoute = require("./route/consumableRoute");
const reportsRoute = require("./route/reportsRoute");
const loginRoute = require("./route/loginRoute");
const { isAuthenticated } = require("./middleware/authMiddleware");



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
app.use("/login", loginRoute);
app.use("/dashboard", isAuthenticated, dashboardRoute);
app.use("/inventory", isAuthenticated, inventoryRoute);
app.use("/computers", isAuthenticated, computerRoutes);
app.use("/peripherals", isAuthenticated, peripheralRoute);
app.use("/services", isAuthenticated, servicesRoute);
app.use("/maintenance", isAuthenticated, maintenanceRoute);
app.use("/consumable", isAuthenticated, consumableRoute);
app.use("/reports", isAuthenticated, reportsRoute);

module.exports = { app, server };