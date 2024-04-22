const mongoose = require("mongoose");

const complaintSchema = mongoose.Schema({
    usId: {
        type: String,
        ref: 'User',
        required: true
    },
    name:{
        required: true,
        type: String,
        trim: true,
    },
    phone:{ 
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: (value) => {
              const re ="^[0-9]{10}$"
              return value.match(re);
            },
        message: "Please enter a valid phone number",
        },
    },
    complaint:{
        required: true,
        type: String,
        trim: true,
    }
})


const Complaint = mongoose.model("Complaints", complaintSchema);
module.exports = Complaint;
