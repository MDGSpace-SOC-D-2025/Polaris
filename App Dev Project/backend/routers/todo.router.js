const express = require('express')
const controller = require("../controller/todo.controller")
const router = express.Router()
const authorize = require("../authorize")

router.get('/', authorize, controller.getToDo)
router.post('/', authorize, controller.addToDo)
router.delete("/:id", authorize, controller.deleteToDo)

module.exports = router