// /routes/clientRoutes.js
const express = require('express');
const clientController = require('../controllers/clientController');
const router = express.Router();

// Define routes for client-related operations
router.post('/', clientController.createClient); // Create a new client
router.get('/', clientController.getAllClients); // Fetch all clients
router.get('/:id', clientController.getClientById); // Fetch a client by ID

module.exports = router;
