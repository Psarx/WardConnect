const mongoose = require("mongoose");

const landdetSchema = mongoose.Schema({
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

const agrodetSchema = mongoose.Schema({
   paddy:0,
   coconut:0,
   sesame:0,
   vegitable:0,
   other:0
});


const appliedSchema = mongoose.Schema({
    fid: {
    required: true,
    type: String,
    trim: true,
  },
  title: {
    required: true,
    type: String,
    trim:true
  },
  instructions: {
    required:true,
    type:String,
    trim : true
  },
 
  applied_users:[{
    land_details:landdetSchema,
    agro_details:agrodetSchema
  }]
});

const form = mongoose.model("forms", schemeSchema);
module.exports = form;
