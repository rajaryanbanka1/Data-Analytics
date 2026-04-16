from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
import pandas as pd

df = pd.read_csv("data/processed/insurance_cleaned.csv")

# Encoding
df['smoker'] = df['smoker'].map({'yes':1, 'no':0})

X = df[['age','bmi','children','smoker']]
y = df['charges']

X_train, X_test, y_train, y_test = train_test_split(X,y,test_size=0.2)

model = LinearRegression()
model.fit(X_train, y_train)

print("Model Score:", model.score(X_test, y_test))
