-- SQL Setup Script for Flutterwave Payment Configuration

-- Create tables related to payment processing
CREATE TABLE IF NOT EXISTS payment_methods (
    id SERIAL PRIMARY KEY,
    method_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS transactions (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    payment_method_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (payment_method_id) REFERENCES payment_methods(id)
);

CREATE TABLE IF NOT EXISTS payments (
    id SERIAL PRIMARY KEY,
    transaction_id INT NOT NULL,
    flutterwave_ref VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (transaction_id) REFERENCES transactions(id)
);

-- Insert default values into payment_methods
INSERT INTO payment_methods (method_name) VALUES ('Card Payment'), ('Bank Transfer'), ('Mobile Payment');

-- Example queries for processing a payment
-- Start a payment
-- TransactionID can be obtained after inserting a new transaction
-- INSERT INTO transactions (user_id, payment_method_id, amount, currency, status) VALUES (1, 1, 100.00, 'USD', 'Pending');

-- Complete a payment based on flutterwave_ref
-- Update payments table
-- UPDATE payments SET status = 'Successful' WHERE flutterwave_ref = 'your_flutterwave_reference';

-- You can add more SQL statements as needed for your setup.