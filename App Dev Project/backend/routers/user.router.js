const express = require('express')
const controller = require("../controller/user.controller")
const router = express.Router()
const authorize = require("../authorize")

router.get('/', controller.getUser)
router.post('/register', controller.registerUser)
router.post('/login', controller.loginUser)
router.patch('/rewardtime/:id/complete', authorize, controller.onCompleteTodo)
router.get('/rewardtime', authorize, controller.toGetRewardTime)
router.patch('/rewardtime', authorize, controller.toSetRewardTime)

module.exports = router