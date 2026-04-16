import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

df = pd.read_csv("data/processed/insurance_cleaned.csv")

# Distribution
sns.histplot(df['charges'])
plt.title("Distribution of Medical Charges")
plt.show()

# Correlation
sns.heatmap(df.corr(numeric_only=True), annot=True)
plt.show()
