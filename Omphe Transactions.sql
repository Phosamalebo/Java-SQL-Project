SELECT * FROM Transactions;

-- Deposit (adds 2000.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354738, '2025-02-12 12:00:00', 'DEPOSIT', 2000.00);
 
-- Withdrawal (subtracts 500.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354738, '2025-02-19 16:30:00', 'WITHDRAWAL', 500.00);
 
-- Deposit (adds 1000.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354738, '2025-02-22 10:15:00', 'DEPOSIT', 1000.00);
 
-- Withdrawal (subtracts 1500.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354738, '2025-02-24 12:00:00', 'WITHDRAWAL', 1500.00);
 
-- Deposit (adds 1200.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354738, '2025-02-25 08:30:00', 'DEPOSIT', 1200.00);


-- Deposit (adds 1200.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354739, '2025-02-13 14:00:00', 'DEPOSIT', 1200.00);
 
-- Withdrawal (subtracts 600.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354739, '2025-02-17 18:30:00', 'WITHDRAWAL', 600.00);
 
-- Withdrawal (subtracts 700.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354739, '2025-02-20 13:30:00', 'WITHDRAWAL', 700.00);
 
-- Deposit (adds 1800.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354739, '2025-02-22 09:45:00', 'DEPOSIT', 1800.00);