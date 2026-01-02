const userModel = require("../model/user.model")

const getUser = async (req, res) => {
  const user = await userModel.find()
  res.json(user)
};

const addUser = async (req, res) => {
  await userModel.create(req.body)
  res.json({ message: "User added" })
};

module.exports = {
  getUser,
  addUser
}