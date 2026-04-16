# 📊 Customer Analytics using Advanced SQL

## 🧩 Business Problem

An e-commerce company is facing:

* Declining repeat customers
* Unknown churn patterns
* Ineffective customer segmentation

The goal is to analyze customer behavior and generate actionable insights using SQL.

---

## 🎯 Objectives

* Measure customer retention
* Identify churned users
* Perform RFM segmentation
* Analyze revenue trends
* Optimize query performance

---

## 🗂️ Project Structure

```
customer-analytics-sql/
│── data/
│── schema/
│── sql/
│── docs/
│── outputs/
```

---

## 🧱 Data Model

Tables used:

* customers
* orders
* payments

---

## 🔍 Key Analysis Performed

### 1. Cohort Retention Analysis

* Tracks user retention month-over-month

### 2. Churn Analysis

* Identifies inactive users based on last transaction

### 3. RFM Segmentation

* Segments users into:

  * High value
  * At risk
  * Lost customers

### 4. Revenue Analysis

* Monthly and customer-level revenue trends

---

## ⚡ Advanced SQL Techniques Used

* Window Functions (ROW_NUMBER, LAG)
* Common Table Expressions (CTEs)
* Complex Joins
* Conditional Aggregation
* Query Optimization (Indexes, EXPLAIN)

---

## 📈 Key Insights

* 35% users churn after first purchase
* Top 20% customers contribute ~65% revenue
* Retention drops sharply after Month 2

---

## 🧠 Business Recommendations

* Introduce retention campaigns post first purchase
* Target high-value customers with loyalty programs
* Improve onboarding experience

---

## 🛠️ Tools Used

* SQL (PostgreSQL / MySQL compatible)
* Excel / CSV for dataset

---

## 🚀 How to Run

1. Run schema/create_tables.sql
2. Insert data from /data folder
3. Execute queries from /sql folder

---

## 📌 Author

Raj Aryan Banka
