const db = require('../config/db');

class Notification {
    static create(notificationData) {
        return new Promise((resolve, reject) => {
            db.query('INSERT INTO notifications (client_id, message, is_read) VALUES (?, ?, ?)', 
                [notificationData.client_id, notificationData.message, notificationData.is_read], 
                (error, results) => {
                    if (error) return reject(error);
                    resolve(results.insertId);
                });
        });
    }

    static findByClientId(client_id) {
        return new Promise((resolve, reject) => {
            db.query('SELECT * FROM notifications WHERE client_id = ?', [client_id], (error, results) => {
                if (error) return reject(error);
                resolve(results);
            });
        });
    }
}

module.exports = Notification;
