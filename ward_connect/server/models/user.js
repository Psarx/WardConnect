const mongoose = require("mongoose");
const bcrypt = require('bcrypt');

const userSchema = mongoose.Schema({
  name: {
    type: String,
    required: true
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
// Hash the password before saving
userSchema.pre("save", async function (next) {
  const user = this;
  if (!user.isModified("password")) return next();
  const hashedPassword = await bcrypt.hash(user.password, 10);
  user.password = hashedPassword;
  next();
});

// Method to compare passwords
userSchema.methods.comparePassword = async function (candidatePassword) {
  return await bcrypt.compare(candidatePassword, this.password);
};

const User = mongoose.model("User", userSchema);
module.exports = User;
