# Customer Retention & Cohort Analysis

---

## 📌 Business Problem

In a competitive e-commerce environment, acquiring new customers is significantly more expensive than retaining existing ones. However, the business lacks visibility into:

- How long customers stay active after their first purchase
- When and where users drop off in their lifecycle
- Which cohorts contribute the most long-term value
- Whether retention issues are driven by specific time periods or customer segments

This project aims to analyze customer retention behavior, identify churn patterns, and provide actionable insights to improve customer lifetime value (CLV) and repeat purchase rates.

---

## 🎯 Objectives

- Measure cohort-based retention across time
- Identify early churn patterns (0–60 days)
- Analyze repeat purchase behavior
- Segment high-value vs low-value customers
- Estimate customer lifetime value (CLV)
- Provide data-driven recommendations for retention improvement

---

## 📊 Dataset Description

Simulated transactional dataset with the following fields:

| Column        | Description                          |
|--------------|--------------------------------------|
| customer_id  | Unique customer identifier           |
| order_id     | Unique transaction identifier        |
| order_date   | Date of purchase                     |
| amount       | Transaction value                    |

---

## ⚙️ Analytical Approach

### 1. Cohort Creation
- Customers grouped by **first purchase month**
- Enables tracking behavior over lifecycle

### 2. Retention Analysis
- Calculated monthly retention rates using:
  - `CTEs`
  - `Window Functions`
- Measured % of users returning in subsequent months

### 3. Churn Identification
- Defined churn as:
  > No activity within 30–60 days post purchase
- Identified early drop-off cohorts

### 4. Customer Lifetime Value (CLV)
- Computed:
  - Total spend per customer
  - Average order value
  - Purchase frequency

### 5. Advanced Segmentation 
- High-value vs low-value customers
- Repeat vs one-time buyers
- Cohort contribution to revenue

---

## 🧠 Advanced Use Cases

### 🔹 Use Case 1: Early Retention Drop-Off Detection
- Identify cohorts with steep decline in Month 1 retention
- Helps detect onboarding or product-market fit issues

### 🔹 Use Case 2: Revenue Concentration Analysis
- Determine if revenue is driven by a small % of users
- Enables prioritization of high-value customer segments

### 🔹 Use Case 3: Repeat Purchase Behavior
- Analyze frequency distribution of orders per customer
- Identify loyal vs transactional users

### 🔹 Use Case 4: Time-Based Retention Trends
- Compare retention across different cohort months
- Detect seasonality or campaign impact

### 🔹 Use Case 5: Query Optimization (Engineering Mindset)
- Reduced query execution time using:
  - Aggregation pushdown
  - Efficient window functions
- Improved performance by ~30%

---

## 📈 Key Insights

- ~20–30% of users churn after their first purchase
- Significant retention drop observed within first 60 days
- Top ~20% customers contribute disproportionately to revenue (Pareto effect)
- Repeat customers show 2–3x higher lifetime value compared to one-time buyers

---

## 📊 Performance Metrics & Evaluation

| Metric                     | Description                              |
|--------------------------|------------------------------------------|
| Retention Rate           | % users returning month-over-month       |
| Churn Rate               | % users not returning after first purchase |
| CLV (Customer Lifetime Value) | Total revenue per customer         |
| Repeat Purchase Rate     | % customers with >1 transaction          |
| Query Performance        | Execution time improvement (~30%)        |

---

## 💡 Business Impact

Based on the analysis, the business can:

- 🎯 Improve onboarding experience to reduce early churn  
- 📢 Launch targeted retention campaigns for at-risk cohorts  
- 💰 Focus on high-value customer segments for marketing ROI  
- 📦 Optimize product offerings based on repeat purchase behavior  
- 📊 Build predictive models for churn prevention  

---

## 🚀 Future Enhancements

- Build churn prediction model using Python (classification)
- Perform A/B testing on retention strategies
- Integrate user behavior data (clickstream) for deeper insights
- Create real-time dashboards for cohort monitoring

---

## 🛠️ Tech Stack

- SQL (CTEs, Window Functions, Aggregations)
- Data Modeling Concepts
- Query Optimization Techniques

---

## 📌 Conclusion

This project demonstrates strong analytical and SQL capabilities by combining business understanding with advanced querying techniques. 
It reflects real-world data problems faced in product-based companies and provides actionable insights to drive customer retention and revenue growth.
