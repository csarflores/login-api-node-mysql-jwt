import mysql from "promise-mysql";
import config from "./../config";


const connection = mysql.createConnection({
    host:config.host,
    database: config.database,
    user: config.user,
    password: config.password
});

//la función retorna la conexión
const getConnection = () => {
    return connection;
}

//exporta la conexión
module.exports = {
    getConnection
}