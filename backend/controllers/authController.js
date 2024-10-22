// /controllers/authController.js
const User = require('../models/userModel');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

exports.register = async (req, res) => {
    try {
        const { username, password, role, client_id } = req.body;
        const password_hash = await bcrypt.hash(password, 10);
        const userId = await User.create(username, password_hash, role, client_id);
        res.status(201).json({ message: 'User created', userId });
    } catch (error) {
        res.status(500).json({ message: 'Error creating user', error });
    }
};

exports.login = async (req, res) => {
    try {
        const { username, password } = req.body;
        const user = await User.findByUsername(username);
        if (!user || !(await bcrypt.compare(password, user.password_hash))) {
            return res.status(401).json({ message: 'Invalid credentials' });
        }
        const token = jwt.sign({ id: user.id, role: user.role }, process.env.JWT_SECRET, { expiresIn: '1h' });
        res.json({ token });
    } catch (error) {
        res.status(500).json({ message: 'Error logging in', error });
    }
};
