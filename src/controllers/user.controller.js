import { INTERNAL_SERVER, OK } from "../../const.js";
import pool from "../../db.js";

const createUser = (req, res) => {
    let params = req.params;
    let { id, hoTen } = params;
    let body = req.body;
    res.send({
        id,
        hoTen
    });
}

const getUser = async (req, res) => {
    try {
        const [data] = await pool.query(`
            SELECT * FROM users
        `);
        res.status(OK).json(data);
    } catch (error) {
        res.status(INTERNAL_SERVER).json({ message: "error" });
    }
}

const deleteUser = async (req, res) => {
    let { user_id } = req.params
    try {
        const [data] = await pool.query(`
            DELETE FROM users
            WHERE user_id = ${user_id}
        `);
        res.status(OK).json(data);
    } catch (error) {
        res.status(INTERNAL_SERVER).json({ message: "error" });
    }
}
export {
    createUser, getUser, deleteUser
}