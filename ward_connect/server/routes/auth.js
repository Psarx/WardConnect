const express = require("express");
const bcrypt = require("bcrypt");
const User = require("../models/user");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");
const Complaint = require("../models/complaint");
const cert_of_testimony= require("../models/cert_of_testimony");
const personal_details = require("../models/personal_details");
const Application = require('../models/applications');

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { username, password, name } = req.body;

    // Validate username format
    if (!/^USER|WUSER/.test(username)) {
      return res.status(400).json({ message: "Invalid username format" });
    }

    // Check if the username is already taken
    const existingUser = await User.findOne({ username });
    if (existingUser) {
      return res.status(400).json({ message: "Username already exists" });
    }

    // Create a new user record
    const newUser = new User({
      username,
      password, // Note: You should hash the password before saving it in the database for security
      name
    });
    await newUser.save();

    res.status(201).json({ message: "User created successfully" });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

authRouter.post("/api/signin", async (req, res) => {
  try {
    const { username, password } = req.body;
    console.log(password);
    // Validate username format
    if (!/^USER|WUSER/.test(username)) {
      return res.status(400).json({ message: "Invalid username format" });
    }

    const user = await User.findOne({ username });
    if (!user) {
      return res.status(400).json({ message: "User not found" });
    }

    // Compare passwords using bcrypt
    const isPasswordMatch = await bcrypt.compare(password, user.password);
    if (!isPasswordMatch) {
      return res.status(400).json({ message: "Incorrect Password" });
    }

    const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET);
    res.json({ token, ...user._doc });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});
authRouter.post("/api/complaint",async (req,res)=>{
  try {
    const usId = req.header('usId');
    const {name,phone,complaint} = req.body;
    const newComplaint=new Complaint({usId,name,phone,complaint});
    const complaintdetails = await newComplaint.save();
    res.status(201).json({ message: "Complaint submitted successfully", complaint: complaintdetails });
  }catch(err){
    res.status(500).json({message:err.message});
  }
  
});
authRouter.get("/api/complaints", async (req, res) => {
  try {
    // Extract the user ID from the request headers
    const usId = req.header('usId');

    // Fetch complaints associated with the user ID
    const userComplaints = await Complaint.find({ usId: usId });

    // Respond with the fetched complaints
    res.status(200).json({ complaints: userComplaints });
  } catch (error) {
    // Handle errors
    console.error("Error fetching complaints:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});
authRouter.post('/api/person', async (req, res) => {
  try {
    const {username,name,phone,age,hno,hname,rid,rtype,adhar_no} = req.body; 
    // Assuming the request body contains the data to be added
      const newData=new personal_details({username,name,phone,age,hno,hname,rid,rtype,adhar_no});
      const result = await newData.save(newData);
      res.status(201).json(result);
  } catch (error) {
      console.error("Error adding data:", error);
      res.status(500).json({ error: "Failed to add data" });
  }
});

authRouter.post("/api/certificate",async (req,res)=>{
  try {
    const usId = req.header('usId');
    const {appliname,phone,details} = req.body;
    const newCertificate=new cert_of_testimony({usId,appliname,phone,details});
    const certificate = await newCertificate.save();
    res.json(certificate);
  }catch(err){
    res.status(500).json({message:err.message});
  }
});

authRouter.post("/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json(false);
    const verified = jwt.verify(token, process.env.JWT_SECRET);
    if (!verified) return res.json(false);

    const user = await User.findById(verified.id);
    if (!user) return res.json(false);
    res.json(true);
  } catch (e) {
    res.status(500).json("h"+{ error: e.message });
  }
});

authRouter.post("/api/application", async (req, res) => {
  try {
    const { nameOfApplicant, age, headOfHousehold, phoneNumber, electionIdNumber, memberOfKudumbasree, residentOfPanchayath, reasonsForPriority, landOwned, irrigationDetails, otherIncomeDetails, houseDetails, previousBeneficiaries, affidavitChecked } = req.body;
    console.log(req.headers["user"]);
    // Extract usId and sid from headers
    const usId = req.headers['user'];
    const sid = req.headers['sid'];
    console.log(sid);
    // Check if usId and sid are provided
    if (!usId || !sid) {
      return res.status(400).json({ message: 'User ID (usId) and Scheme ID (sid) are required in headers' });
    }

    const newApplication = new Application({
      nameOfApplicant,
      age,
      headOfHousehold,
      phoneNumber,
      electionIdNumber,
      memberOfKudumbasree,
      residentOfPanchayath,
      reasonsForPriority,
      landOwned,
      irrigationDetails,
      otherIncomeDetails,
      houseDetails,
      previousBeneficiaries,
      affidavitChecked,
      sid,
      usId
    });
    
    // Save the new application
    const application = await newApplication.save();
    console.log(application);
    res.status(201).json(application);
  } catch (err) {
    console.error('Error:', err);
    res.status(500).json({ message: 'Internal server error' });
  }
});

authRouter.get("/", auth, async (req, res) => {
  const user = await User.findById(req.user);
  res.json({ ...user._doc, token: req.token });
});
authRouter.put('/api/certificates/approve/:id', async (req, res) => {
  const certificateId = req.params.id;
  console.log(cert_of_testimony);
  try {
    // Find the certificate by ID and update its state to "Approved"
    const updatedCertificate = await cert_of_testimony.findByIdAndUpdate(
      certificateId,
      { state: 'Approved' },
      { new: true }
    );

    if (!updatedCertificate) {
      return res.status(404).json({ message: 'Certificate not found' });
    }

    res.status(200).json(updatedCertificate);
  } catch (error) {
    console.error('Error approving certificate:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});
authRouter.put('/api/auth/applications/:action/:usId/:sid', async (req, res) => {
  const { action, usId, sid } = req.params;

  try {
    let updateStatus;
    if (action === 'approve') {
      updateStatus = 'Approved';
    } else if (action === 'reject') {
      updateStatus = 'Rejected';
    } else {
      return res.status(400).json({ message: 'Invalid action' });
    }

    // Find the application by usId and sid and update its status
    const updatedApplication = await Application.findOneAndUpdate(
      { usId, sid },
      { status: updateStatus },
      { new: true }
    );

    if (!updatedApplication) {
      return res.status(404).json({ message: 'Application not found' });
    }

    res.status(200).json(updatedApplication);
  } catch (error) {
    console.error(`Error ${action}ing application:`, error);
    res.status(500).json({ message: 'Internal server error' });
  }
});
module.exports = authRouter;
