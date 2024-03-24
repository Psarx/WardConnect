const express = require("express");
const bcrypt = require("bcrypt");
const User = require("../models/user");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");

authRouter.post("/api/signin",async (req,res)=>{ 
  try{
      const {email,password}=req.body;
      const user=await User.findOne({email:email});
      if(!user){
          return res.status(400).json({message:"User not found"});
      }
      const isMatch=await bcrypt.compare(password,user.password);
      if(!isMatch){
          return res.status(400).json({message:"Invalid credentials"});
      }
  const token=jwt.sign({id:user._id},process.env.JWT_SECRET);
  res.json({token,...user._doc});
  }catch(err){
      res.status(500).json({message:err.message});
  }
});
authRouter.post("/api/signup",async (req,res)=>{
  try{
      const {name,email,password}=req.body;
      const existingUser=await User.findOne({email});
      if(existingUser){
          return res.status(400).json({message:"User already exists"});
      }
      const salt = await bcrypt.genSalt(Number(process.env.SALT));
      const hashedPassword = await bcrypt.hash(req.body.password, salt);//hashing
      const user=new User({name,email,password:hashedPassword});
      const userdetails = await user.save();
      res.json(userdetails);
  }catch(err){
      res.status(500).json({message:err.message});
  }
}
);
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
