SELECT * FROM Transactions;

-- Deposit (adds 750.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354740, '2025-02-14 13:30:00', 'DEPOSIT', 750.00);
 
-- Withdrawal (subtracts 400.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354740, '2025-02-18 19:15:00', 'WITHDRAWAL', 400.00);
 
-- Deposit (adds 3000.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354740, '2025-02-12 08:45:00', 'DEPOSIT', 3000.00);
 
-- Withdrawal (subtracts 1100.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354740, '2025-02-19 16:00:00', 'WITHDRAWAL', 1100.00);
 
-- Deposit (adds 500.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354740, '2025-02-21 12:00:00', 'DEPOSIT', 500.00);


-- Deposit (adds 600.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354741, '2025-02-14 09:00:00', 'DEPOSIT', 600.00);
 
-- Deposit (adds 2400.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354741, '2025-02-18 14:15:00', 'DEPOSIT', 2400.00);
 
-- Withdrawal (subtracts 500.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354741, '2025-02-20 12:00:00', 'WITHDRAWAL', 500.00);