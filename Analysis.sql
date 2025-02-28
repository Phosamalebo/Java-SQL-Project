use sql_project; 

-- Query to test that given  customer ID, we can see their address data
SELECT address FROM Customers WHERE customer_id = 2;

-- Query to check total no. of customers we have in a database
SELECT COUNT(*) FROM Customers;

-- Query to check that each customer has a minimum of 2 bank accounts
SELECT c.customer_id, c.first_name, c.last_name, COUNT(a.account_number) AS account_count
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(a.account_number) >= 2;

--  query to retrieve all transactions for CHECKING accounts of a given customer_id
SELECT t.account_number, t.transaction_date, t.amount, t.transaction_type
FROM transactions t
JOIN accounts a ON t.account_number = a.account_number
WHERE a.customer_id = 3
AND a.account_type = 'CHECKING'
ORDER BY t.transaction_date;

-- Query to verify that each customer  has 1 checking and 1 savings account
SELECT customer_id, 
       account_type, 
       COUNT(account_type) AS account_count
FROM accounts
GROUP BY customer_id, account_type
HAVING COUNT(account_type) >= 1;


-- Query to verify that there are at-least 3 transactions per account
SELECT a.customer_id, 
       t.account_number, 
       COUNT(t.transaction_id) AS transaction_count
FROM transactions t
JOIN accounts a ON t.account_number = a.account_number
GROUP BY a.customer_id, t.account_number
HAVING COUNT(t.transaction_id) >= 3;


-- Query to verify that the first transaction was a deposit
SELECT account_number, 
       (SELECT transaction_type 
        FROM transactions t2
        WHERE t2.transaction_id = MIN(t1.transaction_id)) AS first_transaction
FROM transactions t1
GROUP BY account_number;

-- Query to check Top 2 Customers by Total Transaction Amount
SELECT a.customer_id, 
       SUM(CASE WHEN t.transaction_type = 'DEPOSIT' THEN t.amount ELSE 0 END) 
       - SUM(CASE WHEN t.transaction_type = 'WITHDRAWAL' THEN t.amount ELSE 0 END) AS net_amount
FROM transactions t
JOIN accounts a ON t.account_number = a.account_number
GROUP BY a.customer_id
ORDER BY net_amount DESC
LIMIT 2;

-- Query to confirm that there are no accounts where withdrawals surpass deposits.
SELECT t.account_number,
       SUM(CASE WHEN t.transaction_type = 'WITHDRAWAL' THEN t.amount ELSE 0 END) AS total_withdrawals,
       SUM(CASE WHEN t.transaction_type = 'DEPOSIT' THEN t.amount ELSE 0 END) AS total_deposits
FROM transactions t
GROUP BY t.account_number
HAVING total_withdrawals > total_deposits;












