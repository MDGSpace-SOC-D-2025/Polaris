const express = require('express')
const controller = require("../controller/todo.controller")
const router = express.Router()

router.post("/", controller.addToDo)
router.delete("/:id", controller.deleteToDo)

module.exports = router;