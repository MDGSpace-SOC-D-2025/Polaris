const toDoModel = require("../model/todo.model")

const addToDo = async (req, res) => {
  await toDoModel.create(req.body)
  res.json({ message: "Todo added" })
};

const deleteToDo = async (req, res) => {
  await toDoModel.findByIdAndDelete(req.params.id)
  res.json({ message: "Todo deleted" })
};

module.exports = {
  addToDo,
  deleteToDo
}