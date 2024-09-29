import { INTERNAL_SERVER, OK } from "../../const.js";
import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { Op } from 'sequelize'; // operator: toán tử: LIKE, AND, IN, OR
import bcrypt, { compareSync } from 'bcrypt'
import jwt from 'jsonwebtoken'
import transporter from "../config/transporter.js";
import { createToken } from "../config/jwt.js";

const model = initModels(sequelize)
const register = async (req, res, next) => {
    try {
        const { fullName, email, pass } = req.body
        const userExist = await model.users.findOne({
            where: {
                email: email
            }
        })
        if (userExist) {
            return res.status(OK).json({
                message: 'Tài khoản đã tồn tại',
                data: null
            });
        }
        let userNew = await model.users.create({
            full_name: fullName,
            email: email,
            pass_word: bcrypt.hashSync(pass, 10)
        })
        const mailOption = {
            from: 'quockhanh51201@gmail.com',
            to: email,
            subject: "Welcome to Our service",
            text: `Hello ${fullName}. Best Regards.`
        }
        transporter.sendMail(mailOption, (err, info) => {
            if (err) {
                return res.status(500).json({ message: "Sending email error" });
            }
            return res.status(200).json({
                message: "Đăng ký thành công",
                data: userNew,
            });
        })
        return res.status(OK).json({
            message: 'Đăng kí thanh công nhé em!',
            data: userNew
        });
    } catch (error) {
        return res.status(INTERNAL_SERVER).json({ message: "error" });

    }
}
const login = async (req, res) => {
    try {
        let { email, pass } = req.body
        let user = await model.users.findOne({
            where: { email }
        })
        if (!user) {
            return res.status(400).json({ message: "Email is wrong" })
        }
        let checkPass = compareSync(pass, user.pass_word)
        if (!checkPass) {
            return res.status(400).json({ message: "Password is wrong" })
        }
        let payload = {
            userID: user.user_id
        }
        //tạo token 
        // param 1: tạo payload và luuw vào accessToken,
        // param 2: key để tạo accessToken
        // param 3: setting lifetime của token và thuật toán để  tạo token
        let accessToken = createToken(payload)
        return res.status(OK).json({
            message: 'Đăng nhập thành công!',
            data: { accessToken }
        });
    } catch (error) {
        return res.status(INTERNAL_SERVER).json({ message: "error" });
    }
}
const loginFace = async (req, res) => {
    try {
        //B1: lấy id, email, name từ req
        //B2: check id trong db
        //B2.1: nếu có id thì tạo access token => gửi về cho FE
        //B2.2: nếu không có id => tạo user mới  => tạo access token =>  gửi về FE

        let { id, email, name } = req.body
        let user = await model.users.findOne({
            where: { face_app_id: id }
        })
        if (!user) {
            let newUser = {
                fullName: name,
                face_app_id: id,
                email
            }
            user = await model.users.create(newUser)
        }
        let accessToken = createToken({ userId: user.user_id })
        return res.status(OK).json({
            message: 'Đăng nhập thành công!',
            data: { accessToken }
        });
    } catch (error) {
        return res.status(INTERNAL_SERVER).json({ message: "error" });
    }
}

export { register, login, loginFace }