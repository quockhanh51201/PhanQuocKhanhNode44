import { INTERNAL_SERVER, OK } from "../../const.js";
import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { Op } from 'sequelize'; // operator: toán tử: LIKE, AND, IN, OR
import bcrypt, { compareSync } from 'bcrypt'
import transporter from "../config/transporter.js";
import { createRefAsyncToken, createRefToken, createToken, createTokenAsyncKey } from "../config/jwt.js";

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
        // create refresh token và lưu vào db
        let refreshToken = createRefToken(payload)
        await model.users.update({
            refresh_token: refreshToken
        }, {
            where: { user_id: user.user_id }
        })
        // lưu refresh token vào cookie
        res.cookie('refreshToken', refreshToken, {
            httpOnly: true, // cookie không thể truy cập từ javascrip
            secure: false, // để chạy dưới localhost
            sameSite: 'Lax', // để đảm bảo cookie được gửi trong các domain khác nhau 
            maxAge: 7 * 24 * 60 * 60 * 1000 // thời gian tồn tại cookie trong browser
        })
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
const extendToken = async (req, res) => {
    // lấy refresh token từ cookie request
    const refreshToken = req.cookies.refreshToken
    if (!refreshToken) {
        return res.status(401)
    }
    const checkRefToken = await model.users.findOne({
        where: {
            refresh_token: refreshToken
        }
    })
    if (!checkRefToken) {
        return res.status(401)
    }
    const newToken = createToken({ userID: checkRefToken.user_id })
    // const newToken = createTokenAsyncKey({ userID: checkRefToken.user_id })

    return res.status(OK).json({
        message: 'Success!',
        data: { newToken }
    });
}
const loginAsyncKey = async (req, res) => {
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
        // param 1: tạo payload và luu vào accessToken,
        // param 2: key để tạo accessToken
        // param 3: setting lifetime của token và thuật toán để  tạo token
        let accessToken = createTokenAsyncKey(payload)
        // create refresh token và lưu vào db
        let refreshToken = createRefAsyncToken(payload)
        await model.users.update({
            refresh_token: refreshToken
        }, {
            where: { user_id: user.user_id }
        })
        // lưu refresh token vào cookie
        res.cookie('refreshToken', refreshToken, {
            httpOnly: true, // cookie không thể truy cập từ javascrip
            secure: false, // để chạy dưới localhost
            sameSite: 'Lax', // để đảm bảo cookie được gửi trong các domain khác nhau 
            maxAge: 7 * 24 * 60 * 60 * 1000 // thời gian tồn tại cookie trong browser
        })
        return res.status(OK).json({
            message: 'Đăng nhập thành công!',
            data: { accessToken }
        });
    } catch (error) {
        return res.status(INTERNAL_SERVER).json({ message: "error" });
    }
}

export { register, login, loginFace, extendToken, loginAsyncKey }