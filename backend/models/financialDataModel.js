const db = require('../config/db');

class FinancialData {
    static create(financialData) {
        return new Promise((resolve, reject) => {
            db.query('INSERT INTO financial_data (client_id, action_type, amount, total_invested, current_amount, task_description) VALUES (?, ?, ?, ?, ?, ?)', 
                [financialData.client_id, financialData.action_type, financialData.amount, financialData.total_invested, financialData.current_amount, financialData.task_description], 
                (error, results) => {
                    if (error) return reject(error);
                    resolve(results.insertId);
                });
        });
    }

    static findByClientId(client_id) {
        return new Promise((resolve, reject) => {
            db.query('SELECT * FROM financial_data WHERE client_id = ?', [client_id], (error, results) => {
                if (error) return reject(error);
                resolve(results);
            });
        });
    }
}

module.exports = FinancialData;
