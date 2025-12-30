const monogdb = require('../config/monogdb')
const mongoose = require('mongoose')

const toDoSchema = new mongoose.Schema({
    id:{
        type: number,
        required: true
    },
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