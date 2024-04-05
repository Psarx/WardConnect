const mongoose = require("mongoose");

const landSchema = mongoose.Schema({
    village: {
    required: false,
    type: String,
    trim: true,
  },
  survey_no: {
    required: false,
    type: String,
    trim:true
  },
  land_area: {
    required: false,
    type: String,
    trim:true
  }
});

const appliedSchema = mongoose.Schema({
    fid: {
    required: true,
    type: String,
    trim: true,
  },
  uid: {
    required: true,
    type: String,
    trim:true
  },
  land_details: landSchema,
  agro_details:{
    required:false,
    type:Number,
    trim:true
  }
});

const appliuser = mongoose.model("applied_users", schemeSchema);
module.exports = appliuser;
