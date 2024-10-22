const db = require('../config/db');

class Document {
    static create(documentData) {
        return new Promise((resolve, reject) => {
            db.query('INSERT INTO documents (client_id, document_name, document_type, file_path) VALUES (?, ?, ?, ?)', 
                [documentData.client_id, documentData.document_name, documentData.document_type, documentData.file_path], 
                (error, results) => {
                    if (error) return reject(error);
                    resolve(results.insertId);
                });
        });
    }

    static findByClientId(client_id) {
        return new Promise((resolve, reject) => {
            db.query('SELECT * FROM documents WHERE client_id = ?', [client_id], (error, results) => {
                if (error) return reject(error);
                resolve(results);
            });
        });
    }
}

module.exports = Document;
