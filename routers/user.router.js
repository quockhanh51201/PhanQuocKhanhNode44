import express from 'express';
import { order } from '../src/controllers/user.controller.js';

const userRoutes = express.Router();

userRoutes.post('/oder', order)


export default userRoutes;