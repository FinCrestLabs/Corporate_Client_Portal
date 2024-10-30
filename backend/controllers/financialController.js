const { body, validationResult } = require('express-validator');
const FinancialData = require('../models/financialDataModel');

// Input validation middleware for creating a financial data entry
const validateFinancialData = [
    body('client_id').isInt().withMessage('Client ID is required and should be an integer'),
    body('action_type').isIn(['add', 'withdraw', 'purchase']).withMessage('Action type must be add, withdraw, or purchase'),
    body('amount').isDecimal().withMessage('Amount must be a decimal'),
    body('total_invested').optional().isDecimal(),
    body('current_amount').optional().isDecimal(),
    body('task_description').optional().isString()
];

exports.createFinancialData = async (req, res) => {
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

        const data = req.body;
        const entryId = await FinancialData.create(data);
        res.status(201).json({
            status: 'success',
            message: 'Financial data entry created',
            data: { entryId }
        });
    } catch (error) {
        res.status(500).json({
            status: 'error',
            message: 'Error creating financial data entry',
            error: error.message
        });
    }
};

// Get all financial data entries
exports.getAllFinancialData = async (req, res) => {
    try {
        const financialData = await FinancialData.findAll();
        res.status(200).json({
            status: 'success',
            message: 'Fetched all financial data entries',
            data: { financialData }
        });
    } catch (error) {
        res.status(500).json({
            status: 'error',
            message: 'Error fetching financial data',
            error: error.message
        });
    }
};


// Get financial data entry by ID
exports.getFinancialDataById = async (req, res) => {
    try {
        const entryId = req.params.id;
        const entry = await FinancialData.findById(entryId);
        if (!entry) {
            return res.status(404).json({
                status: 'error',
                message: 'Financial data entry not found'
            });
        }
        res.status(200).json({
            status: 'success',
            message: 'Fetched financial data entry',
            data: { entry }
        });
    } catch (error) {
        res.status(500).json({
            status: 'error',
            message: 'Error fetching financial data entry',
            error: error.message
        });
    }
};

// Get financial data entries by client ID
exports.getFinancialDataByClientId = async (req, res) => {
    try {
        const clientId = req.params.client_id;
        const entries = await FinancialData.findByClientId(clientId);
        if (!entries.length) {
            return res.status(404).json({
                status: 'error',
                message: 'No financial data found for the specified client'
            });
        }
        res.status(200).json({
            status: 'success',
            message: 'Fetched financial data for client',
            data: { entries }
        });
    } catch (error) {
        res.status(500).json({
            status: 'error',
            message: 'Error fetching financial data for client',
            error: error.message
        });
    }
};
