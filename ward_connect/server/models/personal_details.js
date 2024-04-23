const mongoose = require("mongoose");

const personalSchema = mongoose.Schema({
    usId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },
    username :{
        required: true,
        type: String,
        trim: true
    },
    name: {
        required: true,
        type: String,
        trim: true
    },
    hno: {
        required: true,
        type: Number,
        trim: true
    },
    hname: {
        required: true,
        type: String,
        trim: true
    },
    age: {
        required: true,
        type: Number,
        trim: true
    },
    phone: {
        required: true,
        type: String,
        validate: {
            validator: (value) => {
                const re = /^[0-9]{10}$/;
                return value.match(re);
            },
            message: "Please enter a valid phone number",
        },
    },
    rid: {
        required: true,
        type: Number,
        trim: true
    },
    rtype: {
        required: true,
        type: String,
        trim: true
    },
    adhar_no: {
        required: true,
        type: Number,
        trim: true
    }
});

const personal_details = mongoose.model("personal_details", personalSchema);
module.exports = personal_details;