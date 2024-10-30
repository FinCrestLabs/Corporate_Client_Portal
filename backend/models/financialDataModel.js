const db = require('../config/db');

class FinancialData {
    static async create(data) {
        try {
            const [result] = await db.query(
                `INSERT INTO financial_data (client_id, action_type, amount, total_invested, current_amount, task_description) 
                 VALUES (?, ?, ?, ?, ?, ?)`, 
                [
                    data.client_id,
                    data.action_type,
                    data.amount,
                    data.total_invested,
                    data.current_amount,
                    data.task_description
                ]
            );
            return result.insertId; // Return the inserted ID
        } catch (error) {
            throw new Error('Error creating financial data entry: ' + error.message);
        }
    }
 // Method to fetch all financial data entries
 static async findAll() {
    try {
        const [results] = await db.query('SELECT * FROM financial_data');
        return results; // Return the list of financial data entries
    } catch (error) {
        throw new Error('Error fetching financial data: ' + error.message);
    }
}

static async findByClientId(client_id) {
    try {
        const [results] = await db.query('SELECT * FROM financial_data WHERE client_id = ?', [client_id]);
        return results; // Return the list of entries for the specified client
    } catch (error) {
        throw new Error('Error fetching financial data by client ID: ' + error.message);
    }
}
    static async findById(id) {
        try {
            const [results] = await db.query('SELECT * FROM financial_data WHERE id = ?', [id]);
            return results[0]; // Return the found entry or undefined if not found
        } catch (error) {
            throw new Error('Error fetching financial data entry: ' + error.message);
        }
    }
}

module.exports = FinancialData;
