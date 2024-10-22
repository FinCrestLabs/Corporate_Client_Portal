const FinancialData = require('../models/financialDataModel');

exports.createFinancialData = async (req, res) => {
    try {
        const financialData = req.body;
        const dataId = await FinancialData.create(financialData);
        res.status(201).json({ message: 'Financial data created', dataId });
    } catch (error) {
        res.status(500).json({ message: 'Error creating financial data', error });
    }
};

exports.getFinancialDataByClientId = async (req, res) => {
    try {
        const clientId = req.params.client_id;
        const financialData = await FinancialData.findByClientId(clientId);
        res.json(financialData);
    } catch (error) {
        res.status(500).json({ message: 'Error fetching financial data', error });
    }
};
