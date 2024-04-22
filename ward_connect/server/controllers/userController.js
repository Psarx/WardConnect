const User = require("../models/user");
const PersonalDetails = require("../models/personal_details");

const getUserDetails = async (req, res) => {
  try {
    // Fetch user details using req.user (from auth middleware)
    const user = await User.findById(req.header("user"));
    console.log(req.header("user"))
    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }
    console.log
    // Fetch personal details associated with the user
    const personalDetails = await PersonalDetails.findOne({ usId: req.header("user") });

    // Combine user and personal details into a single object
    const userDetails = {
      user: user,
      personalDetails: personalDetails
    };

    // Return user and personal details in the response
    res.json(personalDetails);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

module.exports = { getUserDetails };
