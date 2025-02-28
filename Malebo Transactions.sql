SELECT * FROM Transactions;

-- Deposit (adds 1000.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354736, '2025-02-10 09:30:00', 'DEPOSIT', 1000.00);
 
-- Withdrawal (subtracts 377.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354736, '2025-02-20 18:00:00', 'WITHDRAWAL', 377.00);
 
-- Deposit (subtracts 3700.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354736, '2025-02-17 11:00:00', 'DEPOSIT', 3700.00);
 
-- Withdrawal (subtracts 1000.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354736, '2025-02-20 18:00:00', 'WITHDRAWAL', 1000.00);


-- Deposit (adds 500.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354737, '2025-02-11 10:00:00', 'DEPOSIT', 500.00);
 
-- Withdrawal (subtracts 250.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354737, '2025-02-18 14:30:00', 'WITHDRAWAL', 250.00);
 
-- Deposit (adds 1500.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354737, '2025-02-15 09:45:00', 'DEPOSIT', 1500.00);
 
-- Deposit (adds 800.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354737, '2025-02-23 11:45:00', 'DEPOSIT', 800.00);