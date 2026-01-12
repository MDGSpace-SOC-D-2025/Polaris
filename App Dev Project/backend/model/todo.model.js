const mongodb = require('../config/mongodb')
const mongoose = require('mongoose')
//const user = require('./user.model')

const toDoSchema = new mongoose.Schema({
    taskName: {
        type: String,
        required: true
    },
    taskDone: {
        type: Boolean,
        default: false
    },
    // userId: {
    //     type: mongoose.Schema.Types.ObjectId,
    //     ref: 'user'
    // }
   
});

const toDoModel = mongoose.model('todo', toDoSchema)

module.exports = toDoModel