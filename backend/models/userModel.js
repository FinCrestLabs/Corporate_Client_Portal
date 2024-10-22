// /models/userModel.js
const db = require('../config/db'); // Assuming db is set up for MySQL connection
const bcrypt = require('bcryptjs');

class User {
    static async findAllClientUsernames() {
        const [rows] = await db.query("SELECT username FROM users WHERE role = 'client'");
        return rows;
    }

    static async createUser(username, password, role, clientId) {
        const passwordHash = await bcrypt.hash(password, 10);
        const [result] = await db.query(
            "INSERT INTO users (username, password_hash, role, client_id) VALUES (?, ?, ?, ?)",
            [username, passwordHash, role, clientId]
        );
        return result.insertId;
    }

    static async updatePassword(userId, newPassword) {
        const passwordHash = await bcrypt.hash(newPassword, 10);
        await db.query(
            "UPDATE users SET password_hash = ? WHERE id = ?",
            [passwordHash, userId]
        );
    }

    static async findById(userId) {
        const [rows] = await db.query("SELECT * FROM users WHERE id = ?", [userId]);
        return rows[0];
    }

    static async findByUsername(username) {
        const [rows] = await db.query("SELECT * FROM users WHERE username = ?", [username]);
        return rows[0];
    }

    static async deleteUser(userId) {
        await db.query("DELETE FROM users WHERE id = ?", [userId]);
    }
}

module.exports = User;
