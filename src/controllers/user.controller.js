import { INTERNAL_SERVER, OK } from "../../const.js";
import sequelize from "../models/connect.js";
// import pool from "../../db.js";
import initModels from "../models/init-models.js";
import { Op, TIME } from 'sequelize'; // operator: toán tử: LIKE, AND, IN, OR

const model = initModels(sequelize)


const order = async (req, res) => {
    try {
        const { user_id, food_id, amount, code, arr_sub_id } = req.body
        let newOder = await model.order.create({
            user_id, food_id, amount, code, arr_sub_id
        })
        return res.status(201).json(newOder);
    } catch (error) {
        console.log(error)
        return res.status(INTERNAL_SERVER).json({ message: "error" });
    }
}
const like = async (req, res) => {
    try {
        let { user_id, res_id } = req.params
        let like = await model.like_res.create({
            user_id, res_id
        })
        return res.status(201).json(like);
    } catch (error) {
        console.log(error)
        return res.status(INTERNAL_SERVER).json({ message: "error" });
    }
}
const unLike = async (req, res) => {
    try {
        let { user_id, res_id } = req.params
        let unLike = await model.like_res.destroy({ where: { user_id: user_id, res_id: res_id } })
        return res.status(201).json(unLike);
    } catch (error) {
        console.log(error)
        return res.status(INTERNAL_SERVER).json({ message: "error" });
    }
}
const listLikeByUserId = async (req, res) => {
    try {
        let { user_id } = req.params
        let listLike = await model.like_res.findAll({ where: { user_id: user_id } })
        return res.status(201).json(listLike);
    } catch (error) {
        console.log(error)
        return res.status(INTERNAL_SERVER).json({ message: "error" });
    }
}

const rate = async (req, res) => {
    try {
        const { user_id, res_id, amount } = req.body
        let rate = await model.rate_res.create({
            user_id, res_id, amount
        })
        return res.status(201).json(rate);
    } catch (error) {
        console.log(error)
        return res.status(INTERNAL_SERVER).json({ message: "error" });
    }
}
export {
    order, like, unLike, listLikeByUserId, rate
}