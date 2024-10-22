// /routes/authRoutes.js
const express = require('express');
const authController = require('../controllers/authController');
const authMiddleware = require('../middlewares/authMiddleware');
const router = express.Router();

// Route to register a new admin
router.post('/register', authController.registerAdmin);

// Route to login a user (both admin and client users)
router.post('/login', authController.loginUser);

router.get('/usernames', authController.getAllClientUsernames);
router.post('/create', authController.createClientCredentials);
router.put('/update-password', authController.updatePassword);
router.put('/reset-password',authMiddleware ,authController.resetPassword);
router.delete('/delete/:userId', authMiddleware,authController.deleteUser);

module.exports = router;
