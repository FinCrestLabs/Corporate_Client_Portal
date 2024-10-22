// /controllers/clientController.js
const { body, validationResult } = require('express-validator');
const Client = require('../models/clientModel');

// Input validation middleware for creating a client
const validateClientData = [
    body('name').isString().notEmpty().withMessage('Name is required'),
    body('email').isEmail().withMessage('Valid email is required'),
    body('phone').isString().notEmpty().withMessage('Phone number is required'),
    body('dob').isDate().withMessage('Valid date of birth is required'),
    body('city').isString().notEmpty().withMessage('City is required'),
    body('address').isString().notEmpty().withMessage('Address is required'),
    body('reference').optional().isString(),
    body('pan_card_number').optional().isString(),
    body('aadhar_number').optional().isString()
];

exports.createClient = async (req, res) => {
    try {
        // Validate input
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({
                status: 'error',
                message: 'Validation errors',
                errors: errors.array()
            });
        }

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
