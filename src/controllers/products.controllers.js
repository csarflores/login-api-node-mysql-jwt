import { getConnection } from "./../database/database"

// Permite listar usuarios
const getProducts = async (req, res) => {
  try {
    //const connection = await getConnection();
    //const result = await connection.query("SELECT * FROM users");
    res.json('Productos');
  } catch (error) {
    res.status(500);
    res.send(error.message)
  }
};

// Exporta las funciones
export const methods = {
    getProducts
  };