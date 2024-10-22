const db = require('../config/db');

class User {
    static create(username, password_hash, role, client_id) {
        return new Promise((resolve, reject) => {
            db.query('INSERT INTO users (username, password_hash, role, client_id) VALUES (?, ?, ?, ?)', [username, password_hash, role, client_id], (error, results) => {
                if (error) return reject(error);
                resolve(results.insertId);
            });
        });
    }

    static findByUsername(username) {
        return new Promise((resolve, reject) => {
            db.query('SELECT * FROM users WHERE username = ?', [username], (error, results) => {
                if (error) return reject(error);
                resolve(results[0]);
            });
        });
    }
}

module.exports = User;
