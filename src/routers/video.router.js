import express from 'express';
import { getListVideo, getTypes, getVideoTypeById, getVideoPage } from '../controllers/video.controller.js';
import { middlewareToken, middlewareTokenAsyncKey } from '../config/jwt.js';

const videoRoutes = express.Router();

videoRoutes.get('/get-videos', getListVideo)
videoRoutes.get('/get-types', middlewareTokenAsyncKey, getTypes)
videoRoutes.get('/get-type-video-by-id/:typeId', getVideoTypeById)
videoRoutes.get('/get-video-page/:page/:size', getVideoPage)

export default videoRoutes;