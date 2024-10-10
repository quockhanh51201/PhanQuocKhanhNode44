import { INTERNAL_SERVER, OK } from "../../const.js";
// import pool from "../../db.js";
import initModels from "../src/models/init-models.js";
import sequelize from "../src/models/connect.js";
import { Op } from 'sequelize'; // operator: toán tử: LIKE, AND, IN, OR

const model = initModels(sequelize)


const order = async (req, res) => {

}
// const createUser = async (req, res) => {
//     //lấy data từ body của req
//     try {
//         const { full_name, email, pass_word } = req.body;
//         let newUser = await model.users.create({
//             full_name,
//             email,
//             pass_word
//         })
//         return res.status(201).json(newUser);
//     } catch (error) {
//         return res.status(INTERNAL_SERVER).json({ message: "error" });
//     }

// }

// const getUser = async (req, res) => {
//     try {
//         // const [data] = await pool.query(`
//         //     SELECT * FROM users
//         // `);
//         let { full_name } = req.query
//         let data = await model.users.findAll(full_name && {
//             attributes: ['full_name'],
//             where: {
//                 full_name: {
//                     [Op.like]: `%${full_name}%`
//                 }
//             },
//             include: [
//                 {
//                     model: model.video, // chọn model mà muốn kết bảng
//                     as: 'videos',
//                     attributes: ['video_name', 'user_id'], // chỉ định những column nào sẽ hiển thị
//                     required: true, // default sẽ kết bảng theo left join, muôn inner join thì required: true
//                     include: [
//                         {
//                             model: model.video_comment,
//                             as: 'video_comments'
//                         }
//                     ]
//                 }
//             ]
//         })
//         return res.status(OK).json(data);
//     } catch (error) {
//         return res.status(INTERNAL_SERVER).json({ message: "error" });
//     }
// }

// const deleteUser = async (req, res) => {
//     try {
//         let { user_id } = req.params
//         // const [data] = await pool.query(`
//         //     DELETE FROM users
//         //     WHERE user_id = ${user_id}
//         // `);

//         let user = await model.users.findByPk(user_id);
//         if (!user) {
//             return res.status(404).json({ message: "User not found" });
//         }
//         user.destroy();
//         return res.status(OK).json({ message: "User deleted successfully!" });
//     } catch (error) {
//         res.status(INTERNAL_SERVER).json({ message: "error" });
//     }
// }
// const updateUser = async (req, res) => {
//     try {
//         const { user_id } = req.params;
//         const { full_name, pass_word } = req.body;

//         // check user có tồn tại trong database hay không
//         let user = await model.users.findByPk(user_id);
//         if (!user) {
//             return res.status(404).json({ message: "User not found!" })
//         }

//         let data = await model.users.update(
//             { full_name, pass_word },
//             {
//                 where: { user_id }
//             }
//         )
//         return res.status(OK).json({ message: "User updated successfully!" });
//     } catch (error) {
//         return res.status(INTERNAL_SERVER).json({ messgae: "error" });
//     }
// }
export {
    order
}