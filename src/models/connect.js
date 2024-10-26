import { Sequelize } from 'sequelize'
import configDB from '../config/connect_db.js'
const sequelize = new Sequelize(
    configDB.database,// tên db
    configDB.user,//username
    configDB.pass,//pass
    {
        host: configDB.host,
        port: configDB.port,
        dialect: 'mysql'//configDB.dialect
    }
)

export default sequelize 