# Import necessary libraries
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load a dataset
# For this example, we'll use the "Titanic" dataset, which is available through seaborn
df = sns.load_dataset('titanic')

# Display the first few rows of the dataset
print("First 5 rows of the dataset:")
print(df.head())

# Data cleaning: Handle missing values
# Check for missing values in the dataset
print("\nMissing values in each column:")
print(df.isnull().sum())

# Fill missing values in 'age' column with the mean
df['age'].fillna(df['age'].mean(), inplace=True)

# Drop rows where 'embarked' is missing
df.dropna(subset=['embarked'], inplace=True)

# Data Exploration: Summary statistics
print("\nSummary statistics of the dataset:")
print(df.describe())

# Data visualization: Distribution of Age
plt.figure(figsize=(8, 6))
sns.histplot(df['age'], bins=30, kde=True, color='blue')
plt.title('Age Distribution of Titanic Passengers')
plt.xlabel('Age')
plt.ylabel('Frequency')
plt.show()

# Data visualization: Countplot of survivors
plt.figure(figsize=(8, 6))
sns.countplot(x='survived', data=df, palette='Set2')
plt.title('Survival Count (0 = No, 1 = Yes)')
plt.xlabel('Survival Status')
plt.ylabel('Count')
plt.show()

# Correlation analysis: Correlation matrix
correlation_matrix = df.corr()
plt.figure(figsize=(10, 8))
sns.heatmap(correlation_matrix, annot=True, cmap='coolwarm', fmt='.2f', linewidths=0.5)
plt.title('Correlation Matrix')
plt.show()

# Simple Analysis: Survival rate by Class
survival_by_class = df.groupby('pclass')['survived'].mean()
print("\nSurvival Rate by Class:")
print(survival_by_class)

# Simple Analysis: Average Age by Survival
avg_age_survival = df.groupby('survived')['age'].mean()
print("\nAverage Age by Survival Status:")
print(avg_age_survival)
