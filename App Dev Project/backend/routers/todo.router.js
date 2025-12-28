const router = require('express').Router();
const toDoController = require('../controller/todo.controller');

router.post('/storeToDo',toDoController.ToDoList);

module.exports = router;