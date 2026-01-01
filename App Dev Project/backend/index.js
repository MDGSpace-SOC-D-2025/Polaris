const dotenv = require('dotenv')
dotenv.config()
const app = require('./app')
const mongodb = require('./config/mongodb')
const toDoModel = require('./model/todo.model')
const userModel = require('./model/user.model')
const toDoRouter = require('./routers/todo.router')
const toDoController = require('./controller/todo.controller')

const port = 3000

app.listen(port,()=>{
    console.log('server listening on port')
})

app.use('/todo',toDoRouter)

toDoModel.create({
  taskName: 'do homework'
})


// const app = require('./app')
// const mongodb = require('./config/mongodb')
// const toDoModel = require('./model/todo.model')
// const userModel = require('./model/user.model')
// const toDoRouter = require('./routers/todo.router')
// const toDoController = require('./controller/todo.controller')
// const morgan = require('morgan')

// const port = 3000

// //app.use(express.json())
// //app.use(express.urlencoded({ extended: true }))
// //app.use(express.static("public"))

// app.use(morgan('dev'))

// app.use('/todo', toDoRouter)

// app.get('/get-todo', (req, res) => {
//     toDoModel.find().then((todo) => {
//         res.send(todo)
//     })
// })

// app.listen(port, () => {
//     console.log('server listening on port')
// })

// // app.get('/user', (req, res)=>{
// //     console.log(req.body)
// //     res.send('user data recevied')
// // })

// toDoModel.create({
//     taskName: 'do homework'
// })