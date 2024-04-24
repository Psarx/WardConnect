const mongoose = require('mongoose');
const scheme = require('./Scheme');
const User = require('./user');

const applicationSchema = new mongoose.Schema({
    sid:{
        type: String,
        ref: 'schemes',
        required:true
    },
    usId:{
        type: String,
        ref: 'User',
        required:true
    },
  nameOfApplicant: {
     type: String, 
     required: true 
    },
  age: {
     type: Number,
      required: true 
    },
  headOfHousehold: { 
    type: String, 
    required: true 
},
  phoneNumber: {
     type: String, 
     required: true 
    },
  electionIdNumber: { 
    type: String, 
    required: true
 },
  memberOfKudumbasree: { 
    type: String, 
    required: true
 },
  residentOfPanchayath: {
     type: String, 
     required: true
     },
  reasonsForPriority: {
     type: String,
      required: true 
    },
  landOwned: {
    village: String,
    surveyNumber: String,
    area: String
  },
  irrigationDetails: {
    pond: Boolean,
    well: Boolean,
    pumpSet: Boolean,
    others: Boolean
  },
  otherIncomeDetails: {
    cow: Boolean,
    building: Boolean,
    vehicle: Boolean,
    others: Boolean
  },
  houseDetails: {
    ownHouse: String,
    areaOfHouse: String,
    roofing: String,
    wall: String,
    floor: String,
    hasToilet: String
  },
  previousBeneficiaries: {
    hasBeneficiaries: String,
    beneficiaries: [
      {
        name: String,
        benefitReceived: String,
        yearReceived: String
      }
    ]
  },
  affidavitChecked: { 
    type: Boolean, 
    required: true
 },
 status:{
    type: String,
    default: "Applied",
}

});

const Application = mongoose.model('Application', applicationSchema);

module.exports = Application;
