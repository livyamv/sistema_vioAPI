const router = require("express").Router();
const verifyJWT = require("../services/verifyJWT");
const userController = require("../controllers/userController");
const organizadorController = require("../controllers/organizadorController");
const ingressoController = require("../controllers/ingressoController");
const eventoController = require("../controllers/eventoController");
const compraController = require("../controllers/compraController");
const upload = require ("../services/upload")
//usuario
router.post("/user", userController.createUser);
router.get("/user", verifyJWT, userController.getAllUsers); //
router.put("/user", userController.updateUser);
router.delete("/user/:cpf", userController.deleteUser);
router.post("/login", userController.loginUser);

//organizador
router.post("/organizador", organizadorController.createOrganizador);
router.get("/organizador", organizadorController.getAllOrganizador);
router.put("/organizador", organizadorController.updateOrganizador);
router.delete("/organizador/:id", organizadorController.deleteOrganizador);

//Rotas ingresso controler
router.post("/ingresso", ingressoController.createIngresso);
router.get("/ingresso", ingressoController.getAllIngresso);
router.put("/ingresso", ingressoController.updateIngresso);
router.delete("/ingresso/:id", ingressoController.deleteIngresso);

//rotas eventoController
router.post("/evento", upload.single("imagem"), eventoController.createEvento);
router.get("/evento", verifyJWT, eventoController.getAllEventos);
router.put("/evento", eventoController.updateEvento);
router.delete("/evento/:id", eventoController.deleteEvento);
router.get("/evento/data", verifyJWT, eventoController.getEventosPorData);
router.get("/evento/proximo", eventoController.getEventosdia);

//compra
router.post("/comprasimples", compraController.registrarCompraSimples);
router.post("/compra", compraController. registrarCompra);

module.exports = router;
