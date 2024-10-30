const express = require('express');
const router = express.Router();
const financialController = require('../controllers/financialController');

router.post('/', financialController.createFinancialData);
router.get('/', financialController.getAllFinancialData);
router.get('/:id', financialController.getFinancialDataById);
router.get('/client/:client_id', financialController.getFinancialDataByClientId);

module.exports = router;
