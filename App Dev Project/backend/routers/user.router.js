const express = require('express')
const controller = require("../controller/user.controller")
const router = express.Router()

router.get('/', controller.getUser)
router.post('/register', controller.registerUser)
router.post('/login', controller.loginUser)
router.post('/rewardtime', controller.onCompleteTodo)

module.exports = router