const Scheme = require('../models/Scheme');

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

module.exports = { getSchemesByStype, addScheme };
