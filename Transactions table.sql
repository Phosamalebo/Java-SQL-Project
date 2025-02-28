use sql_project;

CREATE TABLE Transactions (     
transaction_id INT AUTO_INCREMENT PRIMARY KEY,     
account_number INT NOT NULL,     
transaction_date DATETIME NOT NULL,     
transaction_type ENUM('WITHDRAWAL', 'DEPOSIT') NOT NULL,     
amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
balance DECIMAL(10,2) NOT NULL, 
-- Foreign key linking to Accounts table
FOREIGN KEY (account_number) REFERENCES Accounts(account_number) ON DELETE CASCADE );

SELECT * FROM Transactions;

DELIMITER //
 
CREATE TRIGGER before_transaction_insert
BEFORE INSERT ON Transactions
FOR EACH ROW
BEGIN
    DECLARE last_balance DECIMAL(10,2);
 
    -- Get the most recent balance for the account
    SELECT balance INTO last_balance
    FROM Transactions
    WHERE account_number = NEW.account_number
    ORDER BY transaction_id DESC
    LIMIT 1;
 
    -- If no previous transactions, initialize balance from the Accounts table
    IF last_balance IS NULL THEN
        SELECT balance INTO last_balance FROM Accounts WHERE account_number = NEW.account_number;
    END IF;
 
    -- Calculate new balance based on transaction type
    IF NEW.transaction_type = 'DEPOSIT' THEN
        SET NEW.balance = last_balance + NEW.amount;
    ELSE
        SET NEW.balance = last_balance - NEW.amount;
    END IF;
END;
 
//
DELIMITER ;






