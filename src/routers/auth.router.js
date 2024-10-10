import express from 'express'
import { login, register, loginFace, extendToken, loginAsyncKey } from '../controllers/auth.controller.js'

const authRouter = express.Router()

//register
authRouter.post("/register", register)
authRouter.post("/login", login) // login bang khoa doi xung 
authRouter.post("/login-face", loginFace)
authRouter.post("/extend-token", extendToken)
authRouter.post("/login-async-key", loginAsyncKey) // login bang khoa bat doi xung

export default authRouter