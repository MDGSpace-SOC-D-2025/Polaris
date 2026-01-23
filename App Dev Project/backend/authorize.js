const jwt = require('jsonwebtoken')

function authorize(req, res, next) {
    const authHeader = req.get('Authorization') ////

    if (!authHeader) {
        return res.status(401).json({error: "Authorization header missing"})
    }

    const token = authHeader.split(" ")[1]

    if (!token) {
        return res.status(401).json({error: "Token missing"})
    }

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET)
        req.userId = decoded.userId; ////
        next()
    } catch (e) {
        res.status(401).send({error: "token not found"})
    }
}

module.exports = authorize;