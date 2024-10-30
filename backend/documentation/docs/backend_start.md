# Corporate Client Management System Database Schema

## Overview

This database schema is designed for a Corporate Client Management System that supports two types of users: office users (admins) and clients. Office users have full access to client data, while clients can only view their personal information and receive notifications from office users.

## User Types

1. **Office Users (Admins)**: Full access to all client data.
2. **Clients**: Limited access to their own personal information and updates.

## Database Schema

### 1. Users Table
Stores user credentials and defines roles (office admins or clients).

| Column Name      | Data Type      | Description                          |
|------------------|----------------|--------------------------------------|
| `id`             | INT            | Primary key, auto-increment          |
| `username`       | VARCHAR(50)    | Unique username for the user         |
| `password_hash`  | VARCHAR(255)   | Hashed password for authentication    |
| `role`           | ENUM('admin', 'client') | User role                          |
| `client_id`      | INT            | Foreign key referencing Clients table |

### 2. Clients Table
Stores personal information for each client.

| Column Name       | Data Type      | Description                          |
|-------------------|----------------|--------------------------------------|
| `id`              | INT            | Primary key, auto-increment          |
| `name`            | VARCHAR(100)   | Client's full name                   |
| `email`           | VARCHAR(100)   | Client's email address               |
| `phone`           | VARCHAR(15)    | Client's phone number                |
| `dob`             | DATE           | Client's date of birth               |
| `city`            | VARCHAR(50)    | Client's city                        |
| `address`         | TEXT           | Client's address                     |
| `referredby`       | VARCHAR(100)   | Representative associated with client|
| `pan_card_number` | VARCHAR(15)    | Client's PAN card number             |
| `aadhar_number`   | VARCHAR(12)    | Client's Aadhar number               |

### 3. Financial Data Table
Tracks financial transactions and investments related to clients.

| Column Name           | Data Type      | Description                               |
|-----------------------|----------------|-------------------------------------------|
| `id`                  | INT            | Primary key, auto-increment               |
| `client_id`           | INT            | Foreign key referencing Clients table      |
| `action_type`         | ENUM('add', 'withdraw', 'purchase') | Type of financial action |
| `amount`              | DECIMAL(10, 2) | Amount involved in the transaction        |
| `total_invested`      | DECIMAL(10, 2) | Total amount invested by the client       |
| `current_amount`      | DECIMAL(10, 2) | Current investment amount                 |
| `task_description`    | TEXT           | Description of the task assigned          |
| `created_at`          | TIMESTAMP      | Timestamp when the record was created     |

### 4. Documents Table
Manages documents associated with each client.

| Column Name       | Data Type      | Description                          |
|-------------------|----------------|--------------------------------------|
| `id`              | INT            | Primary key, auto-increment          |
| `client_id`       | INT            | Foreign key referencing Clients table |
| `document_name`   | VARCHAR(100)   | Name of the document                 |
| `document_type`   | VARCHAR(50)    | Type of the document (stored as string) |
| `file_path`       | VARCHAR(255)   | Path where the document is stored    |
| `uploaded_by`     | INT            | Foreign key referencing Users table   |
| `uploaded_at`     | TIMESTAMP      | Timestamp when the document was uploaded |

### 5. Notifications Table
Handles communication between office users and clients.

| Column Name      | Data Type      | Description                          |
|------------------|----------------|--------------------------------------|
| `id`             | INT            | Primary key, auto-increment          |
| `client_id`      | INT            | Foreign key referencing Clients table |
| `message`        | TEXT           | Notification message                  |
| `is_read`        | BOOLEAN        | Status indicating if the message has been read |
| `created_at`     | TIMESTAMP      | Timestamp when the notification was created |

## Schema Advantages

- **Simplicity**: The schema is designed to be straightforward, ensuring easy management while providing necessary functionality.
- **Flexibility**: It allows for future enhancements, such as adding new features or data fields without major changes.
- **Data Integrity**: Maintained through the use of foreign keys, ensuring consistency across related tables.
- **Scalability**: Easily accommodates new features as requirements grow.

## Next Steps

1. Create the database using the provided schema and execute the necessary SQL statements.
2. Implement CRUD operations in the Node.js backend to manage data effectively.
3. Include authentication and authorization measures to ensure proper data access for clients and office admins.

