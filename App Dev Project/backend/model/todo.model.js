const mongodb = require('../config/mongodb')
const mongoose = require('mongoose')

const toDoSchema = new mongoose.Schema({
    taskName: {
        type: String,
        required: true
    },
    taskDone: {
        type: Boolean,
        default: false
    }
});

const toDoModel = mongoose.model('todo', toDoSchema)

module.exports = toDoModel