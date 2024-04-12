const express = require("express");
const bcrypt = require("bcrypt");
const User = require("../models/user");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");
const Complaint = require("../models/complaint");
const cert_of_testimony= require("../models/cert_of_testimony");


authRouter.post("/api/signin", async (req, res) => {
  try {
    const { username, password } = req.body;

    // Validate username format
    if (!/^USER|WUSER/.test(username)) {
      return res.status(400).json({ message: "Invalid username format" });
    }

    const user = await User.findOne({ username });
    if (!user) {
      return res.status(400).json({ message: "User not found" });
    }

    if (password !== user.password) {
      return res.status(400).json({ message: "Invalid credentials" });
    }

    const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET);
    res.json({ token, ...user._doc });
  }
   catch (err) {
    res.status(500).json({ message: err.message });
  }
});
authRouter.post("/api/complaint",async (req,res)=>{
  try {
    const {name,phone,complaint} = req.body;
    const newComplaint=new Complaint({name,phone,complaint});
    const complaintdetails = await newComplaint.save();
    res.json(complaintdetails);
  }catch(err){
    res.status(500).json({message:err.message});
  }
});

app.get('/form',(req,res)=>{
  res.send_File(__dirname+'/form.html')
})


app.post('/form', async (req, res) => {
  try {
    const memberData = req.body; // Data sent from the client
    const newMember = new Member(memberData); // Create a new Member document
    await newMember.save(); // Save the new member to the database
    res.status(201).json(newMember); // Send the new member as JSON response
  } catch (err) {
    console.error('Failed to store member data', err);
    res.status(500).json({ error: 'Failed to store member data' }); // Send error response
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
authRouter.get("/", auth, async (req, res) => {
  const user = await User.findById(req.user);
  res.json({ ...user._doc, token: req.token });
});

module.exports = authRouter;
