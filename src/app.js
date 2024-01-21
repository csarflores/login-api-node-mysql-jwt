import express from 'express'
import morgan from 'morgan'
import authRoutes from './routes/auth.routes'
import productRoutes from './routes/products.routes'
import {functions as middleware} from './middleware/tokens.middleware'

const app = express();

// Settings
app.set('port', 4000); //configura el puerto del servidor

// Middlewares (funciones intermedias entre una petición y una respuesta)
app.use(morgan('dev')); //utilizar en desarrollo, permite ver en consola un detalle de las peticiones que se estan haciendo
app.use(express.urlencoded({extended: false})); // analizar datos de formulario
app.use(express.json()); //permite al servidor entender archivos json

// Routes
app.use("/api/auth", authRoutes)
app.use("/api/products", middleware.validateToken, productRoutes)

export default app;