const express = require("express");
const bcrypt = require("bcrypt");
const User = require("../models/user");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");
const Complaint = require("../models/complaint");
const cert_of_testimony= require("../models/cert_of_testimony");
const personal_details = require("../models/personal_details");

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
  
})
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
    const {appliname,phone,details} = req.body;
    const newCertificate=new cert_of_testimony({appliname,phone,details});
    const certificate = await newCertificate.save();
    res.json(certificate);
  }catch(err){
    res.status(500).json({message:err.message});
  }
})


// authRouter.post("/api/signup",async (req,res)=>{
//   try{
//       const {name,email,password}=req.body;
//       const existingUser=await User.findOne({email});
//       if(existingUser){
//           return res.status(400).json({message:"User already exists"});
//       }
//       const salt = await bcrypt.genSalt(Number(process.env.SALT));
//       const hashedPassword = await bcrypt.hash(req.body.password, salt);//hashing
//       const user=new User({name,email,password:hashedPassword});
//       const userdetails = await user.save();
//       res.json(userdetails);
//   }catch(err){
//       res.status(500).json({message:err.message});
//   }
// }
// );

//jwt token 
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

// get user data
authRouter.get('/api/personal-details/', async (req, res) => {
  try {
      // Assuming the username of the logged-in user is available in req.user.username
      const username = req.query.username;
      
      const user = await personal_details.findOne({ username: username });
      if (!user) {
          return res.status(404).json({ message: 'User not found' });
      }
      res.status(200).json(user);
  } catch (error) {
      console.error('Error fetching personal details:', error);
      res.status(500).json({ message: 'Internal server error' });
  }
});


authRouter.get("/", auth, async (req, res) => {
  const user = await User.findById(req.user);
  res.json({ ...user._doc, token: req.token });
});


module.exports = authRouter;
