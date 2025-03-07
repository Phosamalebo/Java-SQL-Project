SELECT * FROM Transactions;

-- Deposit (adds 5000.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354734, '2025-02-10 14:30:00', 'DEPOSIT', 5000.00);
 
-- Deposit (subtracts 200.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354734, '2025-02-11 15:00:00', 'DEPOSIT', 200.00);
 
-- Withdrawal (subtracts 2000.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354734, '2025-02-12 15:00:00', 'WITHDRAWAL', 2000.00);
 
-- Deposit (adds 500.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354734, '2025-02-14 14:30:00', 'DEPOSIT', 500.00);


-- Deposit (adds 10000.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354735, '2025-02-10 08:30:00', 'DEPOSIT', 10000.00);
 
-- Deposit (subtracts 3700.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354735, '2025-02-17 11:00:00', 'DEPOSIT', 3700.00);
 
-- Withdrawal (subtracts 11000.00)
INSERT INTO Transactions (account_number, transaction_date, transaction_type, amount)
VALUES (354735, '2025-02-20 18:00:00', 'WITHDRAWAL', 11000.00);


