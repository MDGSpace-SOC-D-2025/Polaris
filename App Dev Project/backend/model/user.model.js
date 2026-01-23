const mongoose = require('mongoose')

const userSchema = new mongoose.Schema({
    email: {
        type: String,
        required: true,
        unique: true
    },
    userId: {
        type: String,
        required: true,
        unique: true
    },
    password: {
        type: String,
        required: true
    },
    rewardTime: {
        type: Number,
        default: 0
    }
});

const userModel = mongoose.model('user', userSchema)

module.exports = userModel