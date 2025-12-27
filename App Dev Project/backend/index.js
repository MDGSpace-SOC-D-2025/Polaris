const app = require('./app');
const monogdb = require('./config/monogdb')

const port = 3000;

app.listen(port,()=>{
    console.log('server listening on port');
})
