const express = require('express');
const router = express.Router();
const notificationController = require('../controllers/notificationController');

router.post('/', notificationController.createNotification);
router.get('/:client_id', notificationController.getNotificationsByClientId);

module.exports = router;
