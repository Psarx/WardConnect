const mongoose = require("mongoose");

const schemeSchema = mongoose.Schema({
  sid: {
    required: true,
    type: String,
    trim: true,
  },
  sdetails: {
    required: true,
    type: String,
    trim:true
  },
  stype:{
    required:true,
    type:String,
    trim:true
  }
});

const scheme = mongoose.model("schemes", schemeSchema);
module.exports = scheme;