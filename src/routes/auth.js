const express = require('express');

const authController = require('../controllers/authController');

const router = express.Router();

router.get('/register', authController.showRegister);
router.get('/login', authController.showLogin);
router.post('/register', authController.register);

module.exports = router;