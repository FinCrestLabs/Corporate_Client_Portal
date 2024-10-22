// /controllers/documentController.js
const Document = require('../models/documentModel');

exports.createDocument = async (req, res) => {
    try {
        const documentData = req.body;
        const documentId = await Document.create(documentData);
        res.status(201).json({ message: 'Document uploaded', documentId });
    } catch (error) {
        res.status(500).json({ message: 'Error uploading document', error });
    }
};

exports.getDocumentsByClientId = async (req, res) => {
    try {
        const clientId = req.params.client_id;
        const documents = await Document.findByClientId(clientId);
        res.json(documents);
    } catch (error) {
        res.status(500).json({ message: 'Error fetching documents', error });
    }
};