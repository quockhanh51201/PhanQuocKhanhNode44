import { INTERNAL_SERVER, OK } from "../../const.js";
import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { Op } from 'sequelize'; // operator: toán tử: LIKE, AND, IN, OR
import { PrismaClient } from '@prisma/client'

const model = initModels(sequelize)

const prisma = new PrismaClient()
const getListVideo = async (req, res) => {
    try {
        // let data = await model.video.findAll()
        let data = await prisma.video.findMany()
        return res.status(OK).json(data);
    } catch (error) {
        return res.status(INTERNAL_SERVER).json({ message: "error" });
    }
}

const getTypes = async (req, res) => {
    try {
        // let data = await model.video_type.findAll()
        let data = await prisma.video_type.findMany()
        return res.status(OK).json(data);
    } catch (error) {
        return res.status(INTERNAL_SERVER).json({ message: "error" });
    }
}
const getVideoTypeById = async (req, res) => {
    try {
        let { typeId } = req.params
        // let data = await model.video.findAll({
        //     where: {
        //         type_id: typeId
        //     }
        // })
        let data = await prisma.video.findMany({
            where: {
                type_id: Number(typeId) // Đảm bảo typeId có thể chuyển thành Number
            },
            include: {
                users: {
                    select: {
                        full_name: true,
                        email: true
                    }
                }
            }
        });
        return res.status(OK).json(data);
    } catch (error) {
        return res.status(INTERNAL_SERVER).json({ message: "error" });
    }
}
const getVideoPage = async (req, res) => {
    try {
        let { page, size } = req.params
        page = parseInt(page, 10)
        size = parseInt(size, 10)
        if (isNaN(page) || page < 0) {
            return res.status(400).json({ message: "page is wrong" })
        }
        if (isNaN(size) || page < 0) {
            return res.status(400).json({ message: "size is wrong" })
        }
        let index = (page - 1) * size
        let data = await model.video.findAll({
            offset: index,
            limit: size
        })
        return res.status(OK).json(data);
    } catch (error) {
        return res.status(INTERNAL_SERVER).json({ message: "error" });

    }
}
export {
    getListVideo, getTypes, getVideoTypeById, getVideoPage
}