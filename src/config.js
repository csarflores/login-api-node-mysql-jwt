import { config } from "dotenv"; // permite interactuar con las variables de entorno

config(); // pone a disposición las variables de entorno asignadas en el archivo .env

export default{
    host: process.env.HOST || '',
    database: process.env.DATABASE || '',
    user: process.env.USER || '',
    password: process.env.PASSWORD || '',
    secret_token: process.env.SECRET_TOKEN || ''
};