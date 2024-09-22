import { INTERNAL_SERVER, OK } from "../../const.js";
import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { Op } from 'sequelize'; // operator: toán tử: LIKE, AND, IN, OR

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
            pass_word: pass
        })
        return res.status(OK).json({
            message: 'Đăng kí thanh công nhé em!',
            data: userNew
        });
    } catch (error) {
        return res.status(INTERNAL_SERVER).json({ message: "error" });

    }
}

export { register }