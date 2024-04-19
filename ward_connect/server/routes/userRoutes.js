// routes/userRoutes.js

const express = require("express");
const userRoutes = express.Router();
const authMiddleware = require("../middleware/auth");
const PersonalDetails = require("../models/personal_details");

const { getUserDetails } = require("../controllers/userController");

// Fetch user personal details route
userRoutes.get("/details", authMiddleware, getUserDetails);

module.exports = userRoutes;
