const User = require("../models/user");
const personal_details = require("../models/personal_details");

const getUserDetails = async (req, res) => {
  try {
    // Fetch user details using req.user (from auth middleware)
    const user = await User.findById(req.user);

    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }

    // Fetch personal details associated with the user
    const personalDetails = await personal_details.findOne({ username: req.user });

    // Combine user and personal details into a single object
    const userDetails = {
      user: user,
      personalDetails: personalDetails
    };

    // Return user and personal details in the response
    res.json(userDetails);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

module.exports = { getUserDetails };
