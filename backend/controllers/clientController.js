// /controllers/clientController.js
const Client = require('../models/clientModel');

exports.createClient = async (req, res) => {
    try {
        const clientData = req.body;
        const clientId = await Client.create(clientData);
        res.status(201).json({
            status: 'success',
            message: 'Client created',
            data: { clientId }
        });
    } catch (error) {
        res.status(500).json({
            status: 'error',
            message: 'Error creating client',
            error: error.message // More user-friendly error message
        });
    }
};

exports.getAllClients = async (req, res) => {
    try {
        const clients = await Client.findAll();
        res.status(200).json({
            status: 'success',
            message: 'Fetched all clients',
            data: { clients }
        });
    } catch (error) {
        res.status(500).json({
            status: 'error',
            message: 'Error fetching clients',
            error: error.message // More user-friendly error message
        });
    }
};

exports.getClientById = async (req, res) => {
    try {
        const clientId = req.params.id;
        const client = await Client.findById(clientId);
        if (!client) {
            return res.status(404).json({
                status: 'error',
                message: 'Client not found'
            });
        }
        res.status(200).json({
            status: 'success',
            message: 'Fetched client',
            data: { client }
        });
    } catch (error) {
        res.status(500).json({
            status: 'error',
            message: 'Error fetching client',
            error: error.message // More user-friendly error message
        });
    }
};
