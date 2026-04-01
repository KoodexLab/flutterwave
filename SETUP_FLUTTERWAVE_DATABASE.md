# SETUP FLUTTERWAVE DATABASE

## Instructions to Set Up Flutterwave Payment Configuration Database

### Step 1: Ensure Prerequisites
Before setting up the database, ensure that you have the following prerequisites:
- **SQL Database**: MySQL or PostgreSQL installed on your machine.
- **Database Client**: A database client tool like MySQL Workbench or pgAdmin.

### Step 2: Create the Database
Run the following SQL command to create a new database for Flutterwave:
```sql
CREATE DATABASE flutterwave_db;
```

### Step 3: Define the Schema
Execute the following SQL commands to create the necessary tables:

```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

### Step 4: Configure Flutterwave API Keys
In your application's configuration file, set the following environment variables:
```plaintext
FLUTTERWAVE_PUBLIC_KEY=your_flutterwave_public_key
FLUTTERWAVE_SECRET_KEY=your_flutterwave_secret_key
```
Make sure to replace `your_flutterwave_public_key` and `your_flutterwave_secret_key` with your actual Flutterwave API keys.

### Step 5: Test the Setup
To test your setup, you can run sample API requests to ensure that transactions are processed correctly. Consult the Flutterwave documentation for further examples.