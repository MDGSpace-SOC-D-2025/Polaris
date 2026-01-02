const express = require('express')
const controller = require("../controller/user.controller")
const router = express.Router()

router.get('/', controller.getUser)
router.post('/', controller.addUser)

module.exports = router 