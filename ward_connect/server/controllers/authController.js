const jwt = require("jsonwebtoken");
const User = require("../models/user");

const signup = async (req, res) => {
    try {
      const { name,username, password } = req.body;
  
      // Check if user already exists
      const existingUser = await User.findOne({ username });
      if (existingUser) {
        return res.status(400).json({ message: "User already exists" });
      }
  
      // Create a new user
      const newUser = new User({ name , username, password });
      await newUser.save();
  
      // Generate JWT token
      const token = jwt.sign({ id: newUser._id }, process.env.JWT_SECRET);
  
      // Send token in the response
      res.status(201).json({ token });
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  };
const login = async (req, res) => {
  try {
    const { username, password } = req.body;

    // Check if user exists
    const user = await User.findOne({ username });
    if (!user) {
      return res.status(401).json({ message: "Invalid username or password" });
    }

    // Check password
    const isPasswordValid = await user.comparePassword(password);
    if (!isPasswordValid) {
      return res.status(401).json({ message: "Invalid username or password" });
    }

    // Generate JWT token
    const token = jwt.sign({ userId: user._id }, process.env.JWT_SECRET, { expiresIn: '1h' });
    res.json({ token, ...user._doc });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: 'Server error' });
  }
};

module.exports = { login,signup };
