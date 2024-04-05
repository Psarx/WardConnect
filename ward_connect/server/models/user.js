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
  username: {
    type: String,
    required: true,
    unique: true,
    validate: {
      validator: function(value) {
        return /^(USER|WUSER)/.test(value);
      },
      message: props => `${props.value} is not a valid user. Must start with USER or WUSER!`
    }
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
