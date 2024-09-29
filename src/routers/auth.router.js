import express from 'express'
import { login, register, loginFace } from '../controllers/auth.controller.js'

const authRouter = express.Router()

//register
authRouter.post("/register", register)
authRouter.post("/login", login)
authRouter.post("/login-face", loginFace)


export default authRouter