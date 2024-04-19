// routes/userRoutes.js

const express = require("express");
const router = express.Router();
const authMiddleware = require("../middleware/auth");
const userController = require("../controllers/userController");

// Fetch user details route
router.get("/details", authMiddleware, userController.getUserDetails);

module.exports = router;
