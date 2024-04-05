const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  name: {
    required: true,
    type: String,
    trim: true,
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
  password: {
    required: true,
    type: String,
  },
});

const User = mongoose.model("User", userSchema);
module.exports = User;
