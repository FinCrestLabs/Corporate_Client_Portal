// /routes/clientRoutes.js
const express = require('express');
const ClientController = require('../controllers/clientController');
const router = express.Router();

router.post('/', ClientController.createClient);
router.get('/', ClientController.getAllClients);
router.get('/:id', ClientController.getClientById);

module.exports = router;
