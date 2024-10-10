import express from 'express';
import { listLikeByResId, listRateByResId, listRateByUserId } from '../controllers/res.controller.js';

const resRoutes = express.Router();


resRoutes.get('/list-like/:res_id', listLikeByResId)
resRoutes.get('/list-rate-by-res/:res_id', listRateByResId)
resRoutes.get('/list-rate-by-user/:user_id', listRateByUserId)


export default resRoutes;