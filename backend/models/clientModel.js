const db = require('../config/db'); // Ensure this is using the promise-based pool

class Client {
    // Method to create a new client
    static async create(clientData) {
        try {
            const [result] = await db.query(
                'INSERT INTO clients (name, email, phone, dob, city, address, reference, pan_card_number, aadhar_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', 
                [clientData.name, clientData.email, clientData.phone, clientData.dob, clientData.city, clientData.address, clientData.reference, clientData.pan_card_number, clientData.aadhar_number]
            );
            return result.insertId; // Return the inserted ID
        } catch (error) {
            throw new Error('Error creating client: ' + error.message);
        }
    }

    // Method to find all clients
    static async findAll() {
        try {
            const [results] = await db.query('SELECT * FROM clients');
            return results; // Return the list of clients
        } catch (error) {
            throw new Error('Error fetching clients: ' + error.message);
        }
    }

    // Method to find a client by ID
    static async findById(id) {
        try {
            const [results] = await db.query('SELECT * FROM clients WHERE id = ?', [id]);
            return results[0]; // Return the found client or undefined if not found
        } catch (error) {
            throw new Error('Error fetching client: ' + error.message);
        }
    }
}

module.exports = Client;
