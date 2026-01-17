const toDoModel = require("../model/todo.model")

const getToDo = async (req, res) => {
  //const todo = await toDoModel.find()
  const todo = await toDoModel.find({user_id: req.userId})
  res.json(todo)
};

const addToDo = async (req, res) => {
  await toDoModel.create({
    taskName: req.body.taskName,
    taskDone: req.body.taskDone,
    user_id: req.userId}) //// req.userId ?? why not req.body.user_id
  res.json({message: "Todo added"})
};

const deleteToDo = async (req, res) => {
  //await toDoModel.findByIdAndDelete({_id: req.params.id, user_id: req.userId})
  await toDoModel.findByIdAndDelete({_id: req.params.id})
  res.json({message: "Todo deleted"})
};

module.exports = {
  getToDo,
  addToDo,
  deleteToDo
}