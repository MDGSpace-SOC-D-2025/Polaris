const app = require('./app');
const monogdb = require('./config/monogdb');
const toDoModel = require('./model/todo.model');
const toDoRouter = require('./routers/todo.router');

const port = 3000;

app.listen(port,()=>{
    console.log('server listening on port');
})
