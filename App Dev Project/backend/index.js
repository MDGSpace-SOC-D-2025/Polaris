const dotenv = require('dotenv')
dotenv.config()
const express = require('express')
const app = express()
const cors = require('cors')
const toDoRouter = require('./routers/todo.router')
const userRouter = require('./routers/user.router')
const mongodb = require('./config/mongodb')
const toDoModel = require('./model/todo.model')
const toDoController = require('./controller/todo.controller')
const userModel = require('./model/user.model')
const userController = require('./controller/user.controller')

const port = 3000

// middleware
app.use(cors()) 
app.use(express.json())

// routers
app.use('/todo', toDoRouter)
app.use('/user',userRouter)

app.get('/',(req,res)=>{
    res.send("hello world")
})

app.listen(port,()=>{
    console.log('server listening on port')
})