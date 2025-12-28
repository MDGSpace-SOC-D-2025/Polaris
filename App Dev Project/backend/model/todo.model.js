const monogdb = require('../config/monogdb');
const mongoose = require('mongoose');

const {Schema} = mongoose;

const toDoSchema = new Schema({
    taskName: {
        type: String,
        required: true
    }
});

const toDoModel = mongoose.model('todo', toDoSchema);
module.exports = toDoModel;