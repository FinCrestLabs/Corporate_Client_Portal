// /routes/documentRoutes.js
const express = require('express');
const multer = require('multer');
const DocumentController = require('../controllers/documentController');
const router = express.Router();

// const upload = multer({ dest: 'documents_files/' }); // Directory to save uploaded files

// router.post('/:clientId', upload.single('document'), DocumentController.uploadDocument);
// router.get('/:clientId', DocumentController.getDocumentsByClientId);

router.post('/', DocumentController.createDocument);
router.get('/:client_id', DocumentController.getDocumentsByClientId);

module.exports = router;
