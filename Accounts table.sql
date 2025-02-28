use sql_project;

CREATE TABLE Accounts (
    account_number INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    account_type ENUM('CHECKING', 'SAVINGS') NOT NULL,
    balance DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Foreign key linking to Customers table
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

ALTER TABLE Accounts AUTO_INCREMENT = 354734;


SELECT * FROM Accounts;

INSERT INTO Accounts (customer_id, account_type) 

 VALUES  

(1,'CHECKING'),  

(1, 'SAVINGS'); 

INSERT INTO Accounts (customer_id, account_type) 

 VALUES  

(2,'CHECKING'), 

(2, 'SAVINGS'), 

(3,'CHECKING'),  

(3, 'SAVINGS'), 

(4,'CHECKING'), 

(4, 'SAVINGS');


