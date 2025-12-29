const toDoModel = require("../model/todo.model");

exports.addToDo = async (req, res) => {
  await toDoModel.create(req.body);
  res.json({ message: "Todo added" });
};

exports.deleteToDo = async (req, res) => {
  await toDoModel.findByIdAndDelete(req.params.id);
  res.json({ message: "Todo deleted" });
};

module.exports;