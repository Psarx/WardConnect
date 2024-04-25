const Scheme = require('../models/Scheme');
const Application = require('../models/applications');
// Function to fetch schemes by stype
async function getSchemesByStype(stype) {
  try {
    // Find schemes with the specified stype
    const schemes = await Scheme.find({ stype: stype });
    return schemes;
  } catch (error) {
    console.error("Error fetching schemes:", error);
    throw error;
  }
}
async function getAppliedUsersBySid(sid) {
  try {
    // Find applied users with the specified sid
    const appliedUsers = await Application.find({ sid });
    return appliedUsers;
  } catch (error) {
    console.error("Error fetching applied users:", error);
    throw error;
  }
}
// Function to add a new scheme
async function addScheme(sid, sdetails, stype) {
  try {
    // Create a new Scheme object
    const newScheme = new Scheme({
      sid: sid,
      sdetails: sdetails,
      stype: stype
    });

    // Save the new scheme to the database
    await newScheme.save();
  } catch (error) {
    console.error("Error adding scheme:", error);
    throw error;
  }
}
async function getApplicationsByUsidAndSid(req, res) {
  const usId = req.headers['usid'];
  const sid = req.headers['sid'];
  console.log(usId);
  console.log(sid);
  try {
    const applications = await Application.findOne({ usId, sid });
    console.log(applications);
    res.status(200).json(applications);
  } catch (error) {
    console.error('Error fetching applications:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
}


module.exports = { getSchemesByStype,getApplicationsByUsidAndSid, addScheme, getAppliedUsersBySid };