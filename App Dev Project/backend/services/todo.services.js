const toDoModel = require('./model/todo.model');

class toDoServices{
    static async toDoList (taskName) {
        const toDoList = new toDoModel({taskName});
        return await toDoList.save();
    };
}

module.exports = toDoServices;