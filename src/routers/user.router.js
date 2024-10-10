import express from 'express';
import { order, like, unLike, listLikeByUserId, rate } from '../controllers/user.controller.js';

const userRoutes = express.Router();

userRoutes.post('/oder', order)
userRoutes.post('/like/:user_id/:res_id', like)
userRoutes.post('/un-like/:user_id/:res_id', unLike)
userRoutes.get('/list-like/:user_id', listLikeByUserId)
userRoutes.post('/rate', rate)

export default userRoutes;