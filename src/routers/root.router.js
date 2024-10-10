import express from 'express';
import userRoutes from './user.router.js';
import resRoutes from './res.router.js';

// tạo object router tổng
const rootRoutes = express.Router();

rootRoutes.use("/users", userRoutes);
rootRoutes.use("/res", resRoutes);

// export rootRoutes cho index.js dùng
export default rootRoutes;