from scipy.stats import ttest_ind
import pandas as pd

df = pd.read_csv("data/processed/insurance_cleaned.csv")

smokers = df[df['smoker'] == 'yes']['charges']
non_smokers = df[df['smoker'] == 'no']['charges']

t_stat, p_val = ttest_ind(smokers, non_smokers)

print("T-Statistic:", t_stat)
print("P-Value:", p_val)

# Interpretation
if p_val < 0.05:
    print("Significant difference in charges between smokers and non-smokers")
