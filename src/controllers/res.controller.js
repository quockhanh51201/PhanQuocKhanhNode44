import { INTERNAL_SERVER, OK } from "../../const.js";
import sequelize from "../models/connect.js";
// import pool from "../../db.js";
import initModels from "../models/init-models.js";
import { Op, TIME } from 'sequelize'; // operator: toán tử: LIKE, AND, IN, OR

const model = initModels(sequelize)

const listLikeByResId = async (req, res) => {
    try {
        let { res_id } = req.params
        let listLike = await model.like_res.findAll({ where: { res_id: res_id } })
        return res.status(201).json(listLike);
    } catch (error) {
        console.log(error)
        return res.status(INTERNAL_SERVER).json({ message: "error" });
    }
}
const listRateByResId = async (req, res) => {
    try {
        let { res_id } = req.params
        let listRate = await model.rate_res.findAll({ where: { res_id: res_id } })
        return res.status(201).json(listRate);
    } catch (error) {
        console.log(error)
        return res.status(INTERNAL_SERVER).json({ message: "error" });
    }
}
const listRateByUserId = async (req, res) => {
    try {
        let { user_id } = req.params
        let listRate = await model.rate_res.findAll({ where: { user_id: user_id } })
        return res.status(201).json(listRate);
    } catch (error) {
        console.log(error)
        return res.status(INTERNAL_SERVER).json({ message: "error" });
    }
}
export {
    listLikeByResId, listRateByResId, listRateByUserId
}