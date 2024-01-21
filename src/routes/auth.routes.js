import { Router } from "express";
import { methods as authControllers } from "../controllers/auth.controllers";

const router=Router(); //permite manejar las rutas del proyecto

router.post("/register", authControllers.register);
router.post("/login", authControllers.login);

export default router;