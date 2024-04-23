const mongoose = require("mongoose");

const memberSchema = mongoose.Schema({
    mid: {
    required: true,
    type: Number,
    trim: true,
  },
  name: {
    required: true,
    type: String,
    trim:true
  },
  relation: {
    required: true,
    type: String,
    trim:true
  },
  age:{
    required:true,
    type:Number,
    trim:true
  },
  occupation:{
    required:true,
    type:String,
    trim:true
  },
  income:{
    required:true,
    type:Number,
    trim:true
  }
});

const appliedSchema = mongoose.Schema({
    rid: {
    required: true,
    type: String,
    trim: true,
  },
  total_members: {
    required: true,
    type: Number,
    trim:true
  },
  members:[{memberSchema}]
  
});

const ration_card = mongoose.model("rationcard_members", schemeSchema);
module.exports = ration_card;
