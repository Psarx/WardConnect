const mongoose = require("mongoose");
const addressSchema = mongoose.Schema({
  hno:{
    required: true,
    type: Number,
    trim: true
  },
  hname:{
    required: true,
    type: Number,
    trim: true
  }
});
const userSchema = mongoose.Schema({
  uid:{
    required:true,
    type: String,
    trim: true
  },
  pwd:{
    required: true,
    type: String,
    trim: true
  },
  name: {
    required: true,
    type: String,
    trim: true,
  },
  age:{
    required: true,
    type: Number,
    trim: true
  },
  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: "Please enter a valid email address",
    },
  },
  phone: {
    required: true,
    type: String,
    validate:{
      validator: (value)=>{
        const re="^[0-9]{10}$";
        return value.match(re);
      },
      message: "Please enter a valid phone number",
      },
    },
  address:addressSchema,
  rid:{
    required: true,
    type: Number,
    trim: true
  },
  rtype:{
    required: true,
    type: Number,
    trim: true
  },
  adhar_no:{
    required: true,
    type: Number,
    trim: true
  }
});

const User = mongoose.model("User", userSchema);
module.exports = User;
