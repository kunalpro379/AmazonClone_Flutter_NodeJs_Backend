// import mongoose from "mongoose";
const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true,
    },
    email: {
        required: true,
        type: String,
        trim: true,
        // validate: {
        //     validator: (value) => {
        //         const re = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        //         return re.test(value);
        //     },
        //     message: "Email is not valid"
        // },
    },
    password: {
        type: String,
        //required: true,
        //trim: true,
        // validate: {
        //     validator: (value) => {
        //         return value.length > 6;
        //     },
        //     message: "Password should be more than 6 characters"
        // }
    },
    address: {
        type: String,
        default: "India",
        //required: true,
        trim: true,
    },
    type: {
        type: String,
        default: "normal",
        //required: true,
        trim: true,
    }
});

// Create a model
const User = mongoose.model("User", userSchema);
// export default User;
module.exports = User;

