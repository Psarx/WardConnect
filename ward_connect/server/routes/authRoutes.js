// routes/authRoutes.js

const express = require("express");
const router = express.Router();
const authController = require("../controllers/authController");
const schemeController = require("../controllers/schemeController");
const { getAppliedUsersBySid } = require('../controllers/schemeController');
const applicationController = require('../controllers/schemeController');
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
  router.post('/schemes/add', async (req, res) => {
    try {
      // Extract scheme details from request body
      const { sid, sdetails, stype } = req.body;
  
      // Validate stype value
      if (stype !== "BP" && stype !== "DC") {
        return res.status(400).json({ error: "Invalid stype value. Accepted values are 'BP' and 'DC'" });
      }
  
      // Call the addScheme function from the SchemeController to add the scheme
      await schemeController.addScheme(sid, sdetails, stype);
  
      // Respond with success message
      res.status(201).json({ message: 'Scheme added successfully' });
    } catch (error) {
      console.error("Error adding scheme:", error);
      res.status(500).json({ error: "Internal server error" });
    }
  });
// Route to fetch applied users by sid
  router.get('/applied-users', async (req, res) => {
    try {
      // Extract sid from headers
      const sid = req.headers['sid'];

      // Check if sid is provided
      if (!sid) {
        return res.status(400).json({ message: 'SID is required in headers' });
      }

      // Fetch applied users by sid
      const appliedUsers = await getAppliedUsersBySid(sid);

      // Return the applied users
      res.status(200).json(appliedUsers);
    } catch (error) {
      console.error("Error fetching applied users:", error);
      res.status(500).json({ message: 'Internal server error' });
    }
  });
  router.get('/applications', applicationController.getApplicationsByUsidAndSid);

module.exports = router;
