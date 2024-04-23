// routes/userRoutes.js

const express = require("express");
const userRoutes = express.Router();

const { getUserDetails } = require("../controllers/userController");
const { getComplaints } = require("../controllers/userController");

const { getCertificates } = require("../controllers/userController");
// const { getSchemes } = require("../controllers/userController");
const { getMComplaints } = require("../controllers/userController");
const { getApplications } = require("../controllers/userController");
const auth = require("../middleware/auth");
const { getMCertificates } = require("../controllers/userController");
// Fetch user personal details route
userRoutes.get("/details", auth, getUserDetails);
userRoutes.get("/complaints", getComplaints);
userRoutes.get("/certificates", getCertificates);
// userRoutes.get("/schemes", getSchemes);
userRoutes.get("/mcomplaints", getMComplaints);
userRoutes.get("/mcertificates", getMCertificates);
userRoutes.get("/applications", getApplications);
module.exports = userRoutes;
