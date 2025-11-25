CREATE DATABASE IF NOT EXISTS bank_project;
USE bank_project;
DROP TABLE IF EXISTS bank_transactions;
CREATE TABLE bank_transactions (
    transaction_id INT PRIMARY KEY,
    customer_name  VARCHAR(50),
    date           DATE,
    amount         DECIMAL(10,2),
    type           VARCHAR(10),
    category       VARCHAR(50)
);
INSERT INTO bank_transactions
(transaction_id, customer_name, date, amount, type, category)
VALUES
(1,  'Arjun',  '2024-02-01',  950,   'Debit',  'Groceries'),
(2,  'Neha',   '2024-02-01', 20000,  'Credit', 'Salary'),
(3,  'Arjun',  '2024-02-03',  499,   'Debit',  'Food'),
(4,  'Neha',   '2024-02-05', 1200,   'Debit',  'Shopping'),
(5,  'Arjun',  '2024-02-06',  199,   'Debit',  'Travel'),
(6,  'Neha',   '2024-02-07',  800,   'Debit',  'Food'),
(7,  'Arjun',  '2024-02-08', 30000,  'Credit', 'Salary'),
(8,  'Arjun',  '2024-02-09', 1500,   'Debit',  'Bills'),
(9,  'Neha',   '2024-02-10',  600,   'Debit',  'Groceries'),
(10, 'Arjun',  '2024-02-11',  700,   'Debit',  'Shopping'),
(11, 'Kiran',  '2024-02-12', 1500,   'Debit',  'Shopping'),
(12, 'Priya',  '2024-02-12', 50000,  'Credit', 'EMI'),
(13, 'Neha',   '2024-02-13',   75,   'Debit',  'Travel'),
(14, 'Arjun',  '2024-02-13', 3200,   'Debit',  'Interest'),
(15, 'Rohit',  '2024-02-14',  450,   'Debit',  'Food'),
(16, 'Kiran',  '2024-02-15', 12000,  'Credit', 'Rent'),
(17, 'Sameer', '2024-02-20',  550,   'Debit',  'Groceries'),
(18, 'Neha',   '2024-02-21', 35000,  'Credit', 'Salary'),
(19, 'Anjali', '2024-02-22', 8000,   'Debit',  'Travel'),
(20, 'Arjun',  '2024-02-19', 3200,   'Debit',  'Bills');
SELECT * FROM bank_transactions;
SELECT 
    customer_name,
    SUM(amount) AS total_spent
FROM bank_transactions
WHERE type = 'Debit'
GROUP BY customer_name;
SELECT 
    customer_name,
    SUM(amount) AS total_credited
FROM bank_transactions
WHERE type = 'Credit'
GROUP BY customer_name;
SELECT 
    category,
    SUM(amount) AS total_spent
FROM bank_transactions
WHERE type = 'Debit'
GROUP BY category
ORDER BY total_spent DESC;
SELECT 
    SUM(CASE WHEN type = 'Credit' THEN amount ELSE 0 END) AS total_credits,
    SUM(CASE WHEN type = 'Debit'  THEN amount ELSE 0 END) AS total_debits
FROM bank_transactions;
SELECT 
    customer_name,
    SUM(CASE WHEN type = 'Credit' THEN amount ELSE 0 END) AS total_credited,
    SUM(CASE WHEN type = 'Debit'  THEN amount ELSE 0 END) AS total_debited,
    SUM(CASE WHEN type = 'Credit' THEN amount ELSE -amount END) AS net_balance
FROM bank_transactions
GROUP BY customer_name
ORDER BY customer_name;
SELECT 
    date,
    SUM(CASE WHEN type = 'Credit' THEN amount ELSE 0 END) AS total_credited,
    SUM(CASE WHEN type = 'Debit'  THEN amount ELSE 0 END) AS total_debited
FROM bank_transactions
GROUP BY date
ORDER BY date;