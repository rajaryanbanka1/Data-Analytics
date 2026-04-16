from sklearn.cluster import KMeans
import pandas as pd

df = pd.read_csv("data/processed/orders_cleaned.csv")

features = df.groupby('customer_id')['amount'].agg(['sum','count']).reset_index()

kmeans = KMeans(n_clusters=3)
features['cluster'] = kmeans.fit_predict(features[['sum','count']])

print(features.head())
