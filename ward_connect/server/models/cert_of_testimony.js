const mongoose = require("mongoose");

const certificateSchema = mongoose.Schema({
    appli_name:{
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
    details:{
        required: true,
        type: String,
        trim: true,
    }
})


const cot = mongoose.model("cert_of_testimonys", certificateSchema);
module.exports = cert_of_testimony;
