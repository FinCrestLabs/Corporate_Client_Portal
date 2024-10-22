const Notification = require('../models/notificationModel');

exports.createNotification = async (req, res) => {
    try {
        const notificationData = req.body;
        const notificationId = await Notification.create(notificationData);
        res.status(201).json({ message: 'Notification created', notificationId });
    } catch (error) {
        res.status(500).json({ message: 'Error creating notification', error });
    }
};

exports.getNotificationsByClientId = async (req, res) => {
    try {
        const clientId = req.params.client_id;
        const notifications = await Notification.findByClientId(clientId);
        res.json(notifications);
    } catch (error) {
        res.status(500).json({ message: 'Error fetching notifications', error });
    }
};
