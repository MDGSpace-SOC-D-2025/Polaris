const mongoose = require('mongoose')

const connection = mongoose.connect(process.env.MONGO_URL).then(()=>{
    console.log('connected to database')
})

module.exports = connection