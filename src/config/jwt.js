import jwt from 'jsonwebtoken'
import dotenv from 'dotenv'
import fs from 'fs'

let accessTokenPrivateKey = fs.readFileSync("access_token_private.key")
let accessTokenPublicKey = fs.readFileSync("access_token_public.key")
let refreshTokenPrivateKey = fs.readFileSync("refresh_token.private.key")
let refreshTokenPublicKey = fs.readFileSync("refresh_token.public.key")

// load .env
dotenv.config()

// create function createToken
export const createToken = (data) => {
    return jwt.sign({ playload: data }, process.env.ACCESS_TOKEN_KEY, {
        algorithm: 'HS256',
        expiresIn: '7d'
    })
}

export const createRefToken = (data) => {
    return jwt.sign({ playload: data }, process.env.REFRESH_SECRET, {
        algorithm: 'HS256',
        expiresIn: '7d'
    })
}

export const createTokenAsyncKey = (data) => {
    return jwt.sign({ playload: data }, accessTokenPrivateKey, {
        algorithm: 'RS256',
        expiresIn: '7d'
    })
}
export const createRefAsyncToken = (data) => {
    return jwt.sign({ playload: data }, accessTokenPrivateKey, {
        algorithm: 'RS256',
        expiresIn: '7d'
    })
}
const verifyToken = (token) => {
    try {
        jwt.verify(token, process.env.ACCESS_TOKEN_KEY)
        return true
    } catch (err) {
        return false
    }
}

const verifyAsyncToken = (token) => {
    try {
        jwt.verify(token, accessTokenPublicKey)
        return true
    } catch (err) {
        return false
    }
}
// create middleware token 
export const middlewareToken = (req, res, next) => {
    let { token } = req.headers
    let checkToken = verifyToken(token)
    if (checkToken) {
        // nếu token hợp lệ => pas => qua router
        next()
    } else {
        return res.status(401).json({ message: 'unauthorized' })
    }
}
export const middlewareTokenAsyncKey = (req, res, next) => {
    let { token } = req.headers
    console.log("req.headers", req.headers);
    let checkToken = verifyAsyncToken(token)
    if (checkToken) {
        // nếu token hợp lệ => pas => qua router
        next()
    } else {
        return res.status(401).json({ message: 'unauthorized' })
    }
}