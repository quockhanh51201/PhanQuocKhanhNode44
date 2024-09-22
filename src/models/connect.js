import { Sequelize } from 'sequelize'

const sequelize = new Sequelize(
    'ytb_node44',// tên db
    'root',//username
    '123456',//pass
    {
        host: 'localhost',
        port: 3306,
        dialect: 'mysql'
    }
)

export default sequelize