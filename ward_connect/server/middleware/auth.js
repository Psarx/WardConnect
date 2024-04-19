const jwt = require("jsonwebtoken");
require('dotenv').config();
// Load secret key from environment variable
const secretKey = process.env.JWT_SECRET;

// Use the secret key to sign and verify JWTs
const auth = async (req, res, next) => {
  try {
    const token = req.header("Authorization");
    console.log(token);
    if (!token)
      return res.status(401).json({ msg: "No auth token, access denied" });
      console.log(secretKey);
    // Compare the secret key used for verification with the one loaded from environment variable
    const verified = jwt.verify(token,secretKey);
    if (!verified)
      return res
        .status(401)
        .json({ msg: "Token verification failed, authorization denied." });

    req.user = verified.id;
    req.token = token;
    next();
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = auth;
