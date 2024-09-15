import express from 'express'
import pool from './db.js'
import { OK, INTERNAL_SERVER } from './const.js'
import rootRoutes from './src/routers/root.router.js'

const app = express()


// midleware để đọc data json
app.use(express.json())

app.use(rootRoutes)

// app.get('/', (req, res, next) => {
//     res.status(200).json('hello word')
// })

// app.get('/test', (req, res, next) => {
//     res.status(200).json('test api nè')
// }
// )

// //demo get param --- / trên thanh địa chỉ 
// app.post('/user/:id/:hoTen', (req, res, next) => {
//     let params = req.params
//     let { id, hoTen } = params
//     console.log(id, hoTen)
//     res.send({ id, hoTen })
// }
// )
// //demo get query từ url -- thường áp dụng phân trang search  --- ? trên thanh địa chỉ
// app.get('/test_query', (req, res, next) => {
//     let query = req.query
//     res.send(query)
// }
// )
// //demo get header from reques
// app.get('/test_header', (req, res, next) => {
//     let header = req.headers
//     res.send(header)
// }
// )
// app.get('/data_users', async (req, res) => {
//     try {
//         const [data] = await pool.query("SELECT * FROM users")
//         res.status(OK).json(data)
//     } catch (error) {
//         res.status(INTERNAL_SERVER).json({ message: 'err' })
//     }
// })




// -----------------------------------------
app.listen(8080, () => {
    console.log('server is starting at port: 8080')
})