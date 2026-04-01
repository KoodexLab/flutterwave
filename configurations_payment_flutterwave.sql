-- Flutterwave Payment Configuration SQL

CREATE TABLE flutterwave_payments (
    id SERIAL PRIMARY KEY,
    transaction_id VARCHAR(255) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    currency VARCHAR(10) NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add any additional configurations or tables needed for integration