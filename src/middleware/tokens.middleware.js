import jwt from 'jsonwebtoken';
import config from '../config';

// genera un token para el acceso a la aplicación
const generateAccessToken = (email) => {
    return jwt.sign({ email }, config.secret_token, { expiresIn: '5m' });
};

// valida el token para permitir el acceso a los usuarios
const validateToken = (req, res, next) => {
    //valida si hay token
    const accessToken = req.headers['authorization'];
    if(!accessToken) res.send('Acceso denegado');

    jwt.verify(accessToken, config.secret_token, (err, user) => {
        if(err){
            res.send("Acceso denegado, token expirado o incorrecto");
        }else{
            next();
        }
    }
)};

// Exporta las funciones
export const functions = {
    generateAccessToken,
    validateToken
  };