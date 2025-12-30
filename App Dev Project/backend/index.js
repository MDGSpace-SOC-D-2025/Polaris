const app = require('./app')
const monogdb = require('./config/monogdb')
const toDoModel = require('./model/todo.model')
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