const Scheme = require('../models/Scheme');

// Function to fetch schemes by stype
async function getSchemesByStype(stype) {
  try {
    // Find schemes with the specified stype
    const schemes = await Scheme.find({ stype:stype });
    return schemes;
  } catch (error) {
    console.error("Error fetching schemes:", error);
    throw error;
  }
}

module.exports = { getSchemesByStype };