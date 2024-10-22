// /controllers/authController.js
const User = require('../models/userModel');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

// Fetch all client usernames
exports.getAllClientUsernames = async (req, res) => {
    try {
        const usernames = await User.findAllClientUsernames();
        res.status(200).json({
            status: 'success',
            message: 'Fetched all client usernames',
            data: { usernames }
        });
    } catch (error) {
        res.status(500).json({
            status: 'error',
            message: 'Error fetching client usernames',
            error: error.message
        });
    }
};

// Create new client credentials
exports.createClientCredentials = async (req, res) => {
    try {
        const { username, password, clientId } = req.body;
        const userId = await User.createUser(username, password, 'client', clientId);
        res.status(201).json({
            status: 'success',
            message: 'Client credentials created',
            data: { userId }
        });
    } catch (error) {
        res.status(500).json({
            status: 'error',
            message: 'Error creating client credentials',
            error: error.message
        });
    }
};

// Update password (after login)
exports.updatePassword = async (req, res) => {
    try {
        const userId = req.user.id; // Assume user ID is set after login
        const { newPassword } = req.body;
        await User.updatePassword(userId, newPassword);
        res.status(200).json({
            status: 'success',
            message: 'Password updated successfully'
        });
    } catch (error) {
        res.status(500).json({
            status: 'error',
            message: 'Error updating password',
            error: error.message
        });
    }
};

// Reset password (by admin)
exports.resetPassword = async (req, res) => {
    try {
        const { userId, newPassword } = req.body; // Admin provides userId and new password
        await User.updatePassword(userId, newPassword);
        res.status(200).json({
            status: 'success',
            message: 'Password reset successfully'
        });
    } catch (error) {
        res.status(500).json({
            status: 'error',
            message: 'Error resetting password',
            error: error.message
        });
    }
};

// Delete user credentials (by admin)
exports.deleteUser = async (req, res) => {
    try {
        const { userId } = req.params;
        await User.deleteUser(userId);
        res.status(200).json({
            status: 'success',
            message: 'User deleted successfully'
        });
    } catch (error) {
        res.status(500).json({
            status: 'error',
            message: 'Error deleting user',
            error: error.message
        });
    }
};









// Register an admin user
exports.registerAdmin = async (req, res) => {
    try {
        const { username, password } = req.body;

        // Check if username is already taken
        const existingUser = await User.findByUsername(username);
        if (existingUser) {
            return res.status(400).json({
                status: 'error',
                message: 'Username already exists'
            });
        }

        // Create the admin user
        const userId = await User.createUser(username, password, 'admin', null);
        res.status(201).json({
            status: 'success',
            message: 'Admin registered successfully',
            data: { userId }
        });
    } catch (error) {
        res.status(500).json({
            status: 'error',
            message: 'Error registering admin',
            error: error.message
        });
    }
};

// Login for both admin and client users
exports.loginUser = async (req, res) => {
    try {
        const { username, password } = req.body;

        // Find the user by username
        const user = await User.findByUsername(username);
        if (!user) {
            return res.status(401).json({
                status: 'error',
                message: 'Invalid username or password'
            });
        }

        // Check password
        const isMatch = await bcrypt.compare(password, user.password_hash);
        if (!isMatch) {
            return res.status(401).json({
                status: 'error',
                message: 'Invalid username or password'
            });
        }

        // Generate a JWT token
        const token = jwt.sign(
            { userId: user.id, role: user.role },
            process.env.JWT_SECRET,
            { expiresIn: '1h' }
        );

        res.status(200).json({
            status: 'success',
            message: 'Login successful',
            data: {
                token,
                user: {
                    id: user.id,
                    username: user.username,
                    role: user.role,
                    clientId: user.client_id || null // Include client_id if available
                }
            }
        });
    } catch (error) {
        res.status(500).json({
            status: 'error',
            message: 'Error logging in',
            error: error.message
        });
    }
};