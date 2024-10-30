-- Corporate Client Management System Database Schema

-- 1. Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('admin', 'client') NOT NULL,
    client_id INT,
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

-- 2. Clients Table
CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE,
    dob DATE,
    city VARCHAR(50),
    address TEXT,
    reference VARCHAR(100), -- Representative associated with client
    pan_card_number VARCHAR(15) UNIQUE,
    aadhar_number VARCHAR(12) UNIQUE
);

-- 3. Financial Data Table
CREATE TABLE financial_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    action_type ENUM('add', 'withdraw', 'purchase') NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    total_invested DECIMAL(10, 2),
    current_amount DECIMAL(10, 2),
    task_description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

-- 4. Documents Table
CREATE TABLE documents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    document_name VARCHAR(100) NOT NULL,
    document_type VARCHAR(50) NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

-- 5. Notifications Table
CREATE TABLE notifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    message TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES clients(id)
);
