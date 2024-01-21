import { getConnection } from '../database/database';
import bcrypt from 'bcrypt';
import {functions as middleware} from '../middleware/tokens.middleware'

// Registro de usuarios
const register = async (req, res) => {
  try {
    const connection = await getConnection();
    const { email, password } = req.body;

    // Verificar que los campos no estén vacíos
    if (!email || !password) {
      return res.status(400).json({ message: 'Por favor, completa todos los campos.' });
    }

    // Verificar si el usuario ya existe
    const existingUser = await connection.query('SELECT * FROM users WHERE email = ?', [email]);

    if (existingUser.length > 0) {
      return res.status(409).json({ message: 'El usuario ya existe.' });
    }

    // Hash de la contraseña antes de almacenarla
    const hashedPassword = await bcrypt.hash(password, 10);

    // Insertar nuevo usuario en la base de datos
    await connection.query('INSERT INTO users (email, password, rol, active, date) VALUES (?, ?, ?, ?, ?)', [
      email,
      hashedPassword,
      'admin',
      1,
      new Date(),
    ]);

    res.status(201).json({ message: 'Usuario registrado correctamente.' });
  } catch (error) {
    console.error('Error en el registro:', error);
    res.status(500).json({ message: 'Error interno del servidor.' });
  }
};

// Login de usuarios
const login = async (req, res) => {
  try {
    const { email, password } = req.body;

    // Verificar que los campos no estén vacíos
    if (!email || !password) {
      return res.status(400).json({ message: 'Por favor, completa todos los campos.' });
    }

    const connection = await getConnection();

    // Obtener el usuario por email desde la base de datos
    const user = await connection.query('SELECT * FROM users WHERE email = ?', [email]);

    if (user.length === 0) {
      return res.status(401).json({ message: 'Credenciales de usuario inválidas.' });
    }

    // Verificar la contraseña
    const passwordMatch = await bcrypt.compare(password, user[0].password);

    if (!passwordMatch) {
      return res.status(401).json({ message: 'Credenciales de password inválidas.' });
    }

    // Generar token de acceso
    const accessToken = middleware.generateAccessToken(email);

    res.header('authorization', accessToken).json({
      message: 'Inicio de sesión exitoso.',
      token: accessToken,
    });
  } catch (error) {
    console.error('Error en el inicio de sesión:', error);
    res.status(500).json({ message: 'Error interno del servidor.' });
  }
};

// Exporta las funciones
export const methods = {
  register,
  login,
};