// routes/authRoutes.js

const express = require("express");
const router = express.Router();
const authController = require("../controllers/authController");
const schemeController = require("../controllers/schemeController");

// Login route
router.post("/login", authController.login);

// Signup route
router.post("/signup", authController.signup);

router.get("/schemes", async (req, res) => {
    try {
      // Fetch schemes with stype "type1"
      const schemesOfType1 = await schemeController.getSchemesByStype("BP");
      console.log("Schemes of type 'type1':", schemesOfType1);
  
      // Fetch schemes with stype "type2"
      const schemesOfType2 = await schemeController.getSchemesByStype("DC");
      console.log("Schemes of type 'type2':", schemesOfType2);
  
      // Send response
      res.json({ schemesOfType1, schemesOfType2 });
    } catch (error) {
      console.error("Error:", error);
      res.status(500).json({ error: "Internal server error" });
    }
  });

module.exports = router;
