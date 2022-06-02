const express = require("express");
const router = express.Router();

const mainController = require("../controllers/mainController");

router.get("/",mainController.home);
router.get("/producto/:id?",mainController.product);
router.get("/carrito",mainController.cart);
router.get("/register", mainController.register);

module.exports = router;