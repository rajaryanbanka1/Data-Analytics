import pandas as pd

orders = pd.read_csv("data/processed/orders_cleaned.csv")

# Convert date
orders['order_date'] = pd.to_datetime(orders['order_date'])

# Monthly revenue
orders['month'] = orders['order_date'].dt.to_period('M')

revenue = orders.groupby('month')['amount'].sum()

# Customer frequency
freq = orders.groupby('customer_id').size()

# Outlier detection
q1 = orders['amount'].quantile(0.25)
q3 = orders['amount'].quantile(0.75)

outliers = orders[(orders['amount'] < q1) | (orders['amount'] > q3)]

print(revenue)
print(outliers)
