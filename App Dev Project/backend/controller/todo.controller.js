const toDoServices = require('../services/todo.services');

exports.toDoList = async(req,res,next) => {
    try{
        const {taskName} = req.body;
        let todo = await toDoServices.toDoList(taskName);
        res.json({status: true, success: todo});
    }catch (error) {
        next(error)
    }
}

//module.exports = toDoList;