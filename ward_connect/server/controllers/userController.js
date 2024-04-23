const User = require("../models/user");
const PersonalDetails = require("../models/personal_details");
const Complaint = require("../models/complaint");
const Certificate = require("../models/cert_of_testimony");
const Application = require("../models/applications");

const getUserDetails = async (req, res) => {
  try {
    // Fetch user details using req.user (from auth middleware)
    const user = await User.findById(req.header("user"));
    console.log(req.header("user"))
    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }
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

const getComplaints = async (req, res) => {
  try {
    const complaintdetails = await Complaint.find({ usId: req.header("user") });
    res.json(complaintdetails);
  } 
  catch (error) {
    res.status(500).json({ error: error.message });
  }
}
const getCertificates = async (req, res) => {
  try {
    const certificatedetails = await Certificate.find({ usId: req.header("user") });
    res.json(certificatedetails);
  } 
  catch (error) {
    res.status(500).json({ error: error.message });
  }
}

const getSchemes = async (req, res) => {
  try {
    const applidetails = await Application.find({ usId: req.header("user") });
    res.json(applidetails);
  } 
  catch (error) {
    res.status(500).json({ error: error.message });
  }
}
module.exports = { getUserDetails,getComplaints,getCertificates,getSchemes };
