// /routes/authRoutes.js
const express = require('express');
const AuthController = require('../controllers/authController');
const router = express.Router();

router.post('/register', AuthController.login);
router.post('/login', AuthController.login);

module.exports = router;
