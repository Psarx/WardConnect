// routes/userRoutes.js

const express = require("express");
const userRoutes = express.Router();

const { getUserDetails } = require("../controllers/userController");
const { getComplaints } = require("../controllers/userController");
const auth = require("../middleware/auth");

// Fetch user personal details route
userRoutes.get("/details", auth, getUserDetails);
userRoutes.get("/complaints", getComplaints);

module.exports = userRoutes;
