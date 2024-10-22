// server.js
const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');

const authRoutes = require('./routes/authRoutes');
const clientRoutes = require('./routes/clientRoutes');
const documentRoutes = require('./routes/documentRoutes');
const financialRoutes = require('./routes/financialRoutes');
const notificationRoutes = require('./routes/notificationRoutes');


dotenv.config();
const app = express();

app.use(cors());
app.use(express.json());

app.use((req, res, next) => {
    console.log(`${req.method} ${req.url}`);
    next(); // Call the next middleware or route handler
});

app.use('/api/auth', authRoutes);
app.use('/api/clients', clientRoutes);
app.use('/api/documents', documentRoutes);
app.use('/api/financial', financialRoutes);
app.use('/api/notifications', notificationRoutes);


const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
