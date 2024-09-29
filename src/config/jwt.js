import jwt from 'jsonwebtoken'

import dotenv from 'dotenv'

// load .env
dotenv.config()

// create function createToken
export const createToken = (data) => {
    return jwt.sign({ playload: data }, process.env.ACCESS_TOKEN_KEY, {
        algorithm: 'HS256',
        expiresIn: '1d'
    })
}

const verifytoken = (token) => {
    try {
        jwt.verify(token, process.env.ACCESS_TOKEN_KEY)
        return true
    } catch (err) {
        return false
    }
}
// create middleware token 
export const middlewareToken = (req, res, next) => {
    let { token } = req.headers
    let checkToken = verifytoken(token)
    if (checkToken) {
        // nếu token hợp lệ => pas => qua router
        next()
    } else {
        return res.status(401).json({ message: 'unauthorized' })
    }
}