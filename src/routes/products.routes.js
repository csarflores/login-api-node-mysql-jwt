import { Router } from "express";
import { methods as productsControllers } from "../controllers/products.controllers";

const router=Router(); //permite manejar las rutas del proyecto

// mostrar todos los productos
router.get("/", productsControllers.getProducts);

export default router;