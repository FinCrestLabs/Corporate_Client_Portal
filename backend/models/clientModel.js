const db = require('../config/db');

class Client {
    static create(clientData) {
        return new Promise((resolve, reject) => {
            db.query('INSERT INTO clients (name, email, phone, dob, city, address, reference, pan_card_number, aadhar_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', 
                [clientData.name, clientData.email, clientData.phone, clientData.dob, clientData.city, clientData.address, clientData.reference, clientData.pan_card_number, clientData.aadhar_number], 
                (error, results) => {
                    if (error) return reject(error);
                    resolve(results.insertId);
                });
        });
    }

    static findAll() {
        return new Promise((resolve, reject) => {
            db.query('SELECT * FROM clients', (error, results) => {
                if (error) return reject(error);
                resolve(results);
            });
        });
    }

    static findById(id) {
        return new Promise((resolve, reject) => {
            db.query('SELECT * FROM clients WHERE id = ?', [id], (error, results) => {
                if (error) return reject(error);
                resolve(results[0]);
            });
        });
    }
}

module.exports = Client;
