Bank Transactions Analysis – SQL + Excel Mini Project

Overview
This project analyzes 20 bank transactions to understand customer spending habits, income flow, and category-wise expenses using **MySQL** and **Excel visualizations**.

---

Tools Used
- MySQL Workbench  
- Excel (Charts & Visualization)  
- SQL (Aggregation, Filtering, Grouping)

---

Dataset Description
The dataset contains 20 transactions with the following columns:

- `transaction_id`  
- `customer_name`  
- `date`  
- `amount`  
- `type` (Debit / Credit)  
- `category`

---

Project Workflow
1. Created database and table structure in MySQL  
2. Inserted manually curated transaction dataset  
3. Performed SQL analysis:
   - Customer-wise spending  
   - Customer-wise credits  
   - Net balance  
   - Category-wise spending  
   - Daily totals  
4. Exported results using MySQL Workbench  
5. Built visual charts in Excel:
   - **Pie chart** – Category-wise Spending  
   - **Bar chart** – Customer Net Balance  
6. Documented insights and conclusions  

---

Key SQL Queries
Total Spending per Customer
```sql
SELECT customer_name, SUM(amount) AS total_spent
FROM bank_transactions
WHERE type='Debit'
GROUP BY customer_name;
```

Category-wise Spending
```sql
SELECT category, SUM(amount) AS total_spent
FROM bank_transactions
WHERE type='Debit'
GROUP BY category
ORDER BY total_spent DESC;
```

Customer Net Balance
```sql
SELECT customer_name,
    SUM(CASE WHEN type='Credit' THEN amount ELSE 0 END) AS total_credited,
    SUM(CASE WHEN type='Debit' THEN amount ELSE 0 END) AS total_debited,
    SUM(CASE WHEN type='Credit' THEN amount ELSE -amount END) AS net_balance
FROM bank_transactions
GROUP BY customer_name;
```

Visualizations
- Category-wise Spending Pie Chart
- Customer Net Balance Bar Chart

Insights
- Travel is the highest spending category (₹8274).
- Arjun records the highest overall spending.
- Neha receives the highest credits due to multiple salary entries.
- Bills & Shopping form major expense segments.
- Daily credit spikes occur on Feb 12 & Feb 21 (EMI and Salary credits).

Conclusion
This project showcases beginner-level SQL + Excel data analysis skills, including:
- Data preparation
- Query writing
- Aggregation & grouping
- Visualization
- Insight extraction
