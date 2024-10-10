import express from 'express'
import rootRoutes from './src/routers/root.router.js'
const app = express()


// midleware để đọc data json
app.use(express.json())

app.use(rootRoutes)

app.listen(8080, () => {
    console.log('server is starting at port: 8080')
})

// npx sequelize-auto -h localhost -d node44 -u root -x 123456 -p 3306 --dialect mysql -o src/models -l esm