const User = require("../models/user");
const PersonalDetails = require("../models/personal_details");
const Complaint = require("../models/complaint");
const Certificate = require("../models/cert_of_testimony");
const Application = require("../models/applications");
// const Application = require("../models/applications");
const Scheme = require("../models/Scheme");
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

// const getSchemes = async (req, res) => {
//   try {
//     // Fetch applications from the Application schema
//     const applications = await Application.find({ usId: req.header("user") }, "sid");

//     // Extract sid from applications
//     const sids = applications.map(application => application.sid);

//     // Fetch schemes using the extracted sids
//     const schemes = await Scheme.find({ _id: { $in: sids } }, "sdetails");

//     res.status(200).json(schemes);
//   } catch (error) {
//     console.error("Error fetching schemes:", error);
//     res.status(500).json({ message: "Internal server error" });
//   }
// };


const getMComplaints = async (req, res) => {
  try {
    const complaintdetails = await Complaint.find({ });
    res.json(complaintdetails);
  } 
  catch (error) {
    res.status(500).json({ error: error.message });
  }
}

const getMCertificates = async (req, res) => {
  try {
    const certificatedetails = await Certificate.find({});
    res.json(certificatedetails);
  } 
  catch (error) {
    res.status(500).json({ error: error.message });
  }
}
const getApplications = async (req, res) => {
  try {
    // Fetch applications from the Application schema
    const applications = await Application.find({ usId: req.header("user") });

    // Extract sid and status from applications
    const extractedApplications = applications.map(application => ({
      sid: application.sid,
      status: application.status,
      nameOfApplicant: application.nameOfApplicant
    }));

    // Get sdetails for each sid
    const applicationsWithDetails = await Promise.all(extractedApplications.map(async application => {
      const schemeDetails = await Scheme.findOne({ sid: application.sid }, "sdetails");
      return { ...application, sdetails: schemeDetails.sdetails };
    }));

    // Return applications with sid, status, and sdetails
    res.status(200).json(applicationsWithDetails);
  } catch (error) {
    console.error("Error fetching applications:", error);
    res.status(500).json({ message: "Internal server error" });
  }
};



module.exports = { getUserDetails,getComplaints,getCertificates,getApplications,getMComplaints,getMCertificates };
