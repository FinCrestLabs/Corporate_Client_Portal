# API Documentation

## Auth Routes Overview
**Base URL**: `/auth`

| Method | Endpoint                   | Description                                         | Auth Required | Request Body (JSON)                                                                                         | Response (JSON)                                                                                          |
|--------|----------------------------|-----------------------------------------------------|---------------|-------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| POST   | `/register`                | Register a new admin user.                          | No            | `{ "username": "string", "password": "string" }`                                                            | `{ "status": "success", "message": "Admin registered successfully", "data": { "userId": "number" }}`       |
| POST   | `/login`                   | Login for both admin and client users.               | No            | `{ "username": "string", "password": "string" }`                                                            | `{ "status": "success", "message": "Login successful", "data": { "token": "string", "user": { "id": "number", "username": "string", "role": "string", "clientId": "number or null" }}}` |
| GET    | `/usernames`               | Fetch all client usernames.                         | Yes           | -                                                                                                           | `{ "status": "success", "message": "Fetched all client usernames", "data": { "usernames": ["string", ...] }}` |
| POST   | `/create`                  | Create new client credentials.                      | Yes           | `{ "username": "string", "password": "string", "clientId": "number" }`                                      | `{ "status": "success", "message": "Client credentials created", "data": { "userId": "number" }}`          |
| PUT    | `/update-password`         | Update password for the logged-in user.             | Yes           | `{ "newPassword": "string" }`                                                                               | `{ "status": "success", "message": "Password updated successfully" }`                                     |
| PUT    | `/reset-password`          | Reset password of any user (admin only).            | Yes (Admin)   | `{ "userId": "number", "newPassword": "string" }`                                                           | `{ "status": "success", "message": "Password reset successfully" }`                                       |
| DELETE | `/delete/:userId`          | Delete a user by their ID (admin only).             | Yes (Admin)   | -                                                                                                           | `{ "status": "success", "message": "User deleted successfully" }`                                         |

## Authentication Middleware
- Requires `Authorization` header with format: `Bearer <token>`.
- Decodes JWT and attaches user information to the request (`req.user`).
- Returns `401 Unauthorized` if token is missing or invalid.

## Error Responses
- All endpoints may return a 500 status with `{ "status": "error", "message": "Error message", "error": "Detailed error" }` for server-side issues.
- Unauthorized requests due to missing/invalid tokens return `{ "status": "error", "message": "No token provided" }` or `{ "status": "error", "message": "Invalid token" }`.

## JWT Token
- Use the token received from the `/login` response for subsequent authenticated requests.
- Token expires in `1 hour`.

## Note for Frontend Developers
- Use the `/login` endpoint to authenticate and store the returned JWT token for future requests.
- Use the `Authorization` header with each request that requires authentication.
- Handle different user roles (`admin` and `client`) to determine access levels for the frontend.
