const userModel = require("../model/user.model")
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

const getUser = async (req, res) => {
  const user = await userModel.find()
  res.json(user)
};

const addUser = async (req, res) => {
  const {email, userId, password} = req.body;
  const hashPassword = await bcrypt.hash(password, 10);
  await userModel.create({email, userId, password: hashPassword})
  const token = jwt.sign({
      userId: req.body.userId
    },
  process.env.JWT_SECRET
  )
  res.cookie('token',token)
  res.json({ 
    message: "User added",
  })
};

module.exports = {
  getUser,
  addUser
}