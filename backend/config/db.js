// /config/db.js
const mysql = require('mysql2/promise');
require('dotenv').config();

const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    waitForConnections: true, // Allows for waiting for connections to be available
    connectionLimit: 10,      // Maximum number of connections in the pool
    queueLimit: 0             // Unlimited queue length
});

// Function to test the connection
async function testConnection() {
    try {
        const connection = await pool.getConnection();
        console.log('MySQL Connected!');
        connection.release(); // Release connection back to the pool
    } catch (err) {
        console.error('Database connection error:', err);
    }
}

// Testing the connection
testConnection();

module.exports = pool; // Exporting the pool instead of a single connection
