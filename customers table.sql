use sql_project;

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    address VARCHAR(200) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Unique constraint to prevent duplicate records based on 4 key fields
    UNIQUE (first_name, last_name, date_of_birth, phone_number)
);

SELECT * FROM Customers;

INSERT INTO Customers (first_name, last_name, date_of_birth, address, email, phone_number)

VALUES ('Mbongiseni', 'Phakathi', '1985-07-15', 'Main Street, 123, 2000, Johannesburg, Gauteng, South Africa', 'Mphakathi@gmail.com', '+27731234567'),

('Malebo', 'Phosa', '1992-03-28', 'Long Road, 45, 8000, Cape Town, Western Cape, South Africa', 'MPhosa@gmail.com', '+27829876543'),

('Omphemetse', 'Lekaba', '1978-11-05', 'Park Avenue, 789, 4000, Durban, KwaZulu-Natal, South Africa', 'OLekaba@gmail.com', '+27715554433'),

('Ntokozo', 'Mbuli', '1995-06-18', 'Short Street, 10, 9300, Bloemfontein, Free State, South Africa', 'NMbuli@email.com', '+27638887766');



