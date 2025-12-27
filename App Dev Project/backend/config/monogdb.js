const mongoose = require('mongoose');

const connection = mongoose.createConnection('mongodb://localhost:27017').on('open',()=>{
    console.log('monogdb is connected');
}).on('error',()=> {
    console.log('monogdb is not connected'); 
});

module.exports = connection;