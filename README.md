# Aplicación de Inicio de Sesión con Node.js y MySQL

Esta es una aplicación de inicio de sesión simple desarrollada en Node.js con una base de datos MySQL y autenticación basada en JSON Web Token (JWT).

## Requisitos Previos

Asegúrate de tener instalados los siguientes requisitos previos antes de ejecutar la aplicación:

- Node.js: [Descargar e Instalar Node.js](https://nodejs.org/)
- MySQL: [Descargar e Instalar MySQL](https://www.mysql.com/)

## Configuración

1. Clona este repositorio en tu máquina local:

```bash
git clone https://github.com/tu-usuario/tu-repositorio.git
cd tu-repositorio
Instala las dependencias:
bash
Copy code
npm install
Configura la base de datos:

Crea una base de datos MySQL.
Copia el archivo .env.example a .env y configura las variables de entorno, incluyendo la conexión a la base de datos.
Ejecuta la aplicación:

bash
Copy code
npm start
La aplicación estará disponible en http://localhost:3000.

Funcionalidades
Registro de usuarios.
Inicio de sesión con autenticación basada en JWT.
Estructura del Proyecto
La estructura del proyecto está organizada de la siguiente manera:

src/controllers: Controladores para manejar las solicitudes HTTP.
src/database: Configuración y funciones relacionadas con la base de datos.
src/middleware: Middleware para autenticación y funciones adicionales.
src/routes: Rutas de la aplicación.

Tecnologías Utilizadas
Node.js
MySQL
JSON Web Token (JWT)
Express
Contribuciones
¡Las contribuciones son bienvenidas! Si encuentras algún problema o tienes sugerencias de mejora, por favor, abre un problema o envía una solicitud de extracción.

Licencia
Este proyecto está bajo la Licencia MIT - ver el archivo LICENSE para más detalles.