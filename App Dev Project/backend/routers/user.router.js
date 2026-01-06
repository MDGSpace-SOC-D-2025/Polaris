const express = require('express')
const controller = require("../controller/user.controller")
const router = express.Router()

router.get('/', controller.getUser)
router.post('/register', controller.registerUser)

module.exports = router 