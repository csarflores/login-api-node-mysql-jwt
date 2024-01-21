import app from "./app";

const main = () => {
    app.listen(app.get('port')); // asigno el puerto para conectarse
    console.log(`Server on port ${app.get('port')}`); // muestro el puerto por consola
}

main();