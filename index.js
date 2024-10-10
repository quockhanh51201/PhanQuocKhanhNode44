import express from 'express'
import { OK, INTERNAL_SERVER } from './const.js'
import rootRoutes from './src/routers/root.router.js'
import cors from 'cors'
import cookieParser from 'cookie-parser'

const app = express()


// midleware để đọc data json
app.use(express.json())
// thêm middleware cors để FE có thể call API tới BE
app.use(cors({
    origin: 'http://localhost:3000', // cấp quyền cho FE
    credentials: true, // cho phép FE lấy cookie và lưu vào cookie browser
}))
// thêm middleware để dduocj cookie từ request
app.use(cookieParser())

app.use(rootRoutes)

app.listen(8080, () => {
    console.log('server is starting at port: 8080')
})

// npx sequelize-auto -h localhost -d ytb_node44 -u root -x 123456 -p 3306 --dialect mysql -o src/models -l esm