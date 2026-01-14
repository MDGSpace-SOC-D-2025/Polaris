const userModel = require("../model/user.model")
const toDoModel = require("../model/todo.model")
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

const getUser = async (req, res) => {
  const user = await userModel.find()
  res.json(user)
};

const registerUser = async (req, res) => {
  const {email, userId, password} = req.body
  const hashPassword = await bcrypt.hash(password, 10)
  await userModel.create({email, userId, password: hashPassword})
  const token = jwt.sign({
      userId: req.body.userId
    },
  process.env.JWT_SECRET
  )
 
  res.json({ 
    token: token,
    message: "User registered",
  })
};

const loginUser = async (req, res) => {
  try {
    const {email, password} = req.body
    const user = await userModel.findOne({email})
    if (!user){
      return res.status(400).json({message: "User not found"});
    }
      
    const match = await bcrypt.compare(password, user.password)
    if (!match){
      return res.status(400).json({message: "Incorrect user credentials"})
    }
    
    const token = jwt.sign({
        userId: user._id ////
      },
    process.env.JWT_SECRET
    )
    
    res.json({ 
      token: token,
      message: "User logged in",
    })
  } catch (error) {
    console.error(error)
  }
    
};

const onCompleteTodo = async (req, res) => {
  try {
    const task = await toDoModel.findById({_id: req.params.id})
    
    if (!task){
      return res.status(400).json({message: "to do not found"})
    }
    
    task.taskDone = true;
    
    await userModel.findByIdAndUpdate({
      rewardTime: req.rewardTime += 10
    })
    
    res.status(200).json({ 
      message: "reward time incremented successfully",
    })
  } catch (error) {
    console.error(error)
  }
  
};

module.exports = {
  getUser,
  registerUser,
  loginUser,
  onCompleteTodo
}