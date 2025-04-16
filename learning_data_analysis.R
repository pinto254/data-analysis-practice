# Load necessary libraries
library(ggplot2)
library(dplyr)

# Step 1: Create a small dataset manually
data <- data.frame(
  ID = 1:8,
  AGE = c(25, 30, 22, 40, 35, 28, 45, 50),
  INCOME = c(30000, 40000, 25000, 50000, 45000, 32000, 60000, 70000),
  GENDER = c("FEMALE", "MALE", "FEMALE", "MALE", "FEMALE", "MALE", "MALE", "FEMALE"),
  PURCHASE = c("Yes", "No", "Yes", "No", "Yes", "Yes", "No", "Yes")
)

# Step 2: View the first few rows
head(data)

# Step 3: Basic summary
summary(data)

# Step 4: Plot Age distribution
ggplot(data, aes(x = AGE)) +
  geom_histogram(binwidth = 5, fill = "lightblue", color = "black") +
  labs(title = "Age Distribution", x = "Age", y = "Count")

# Step 5: Gender distribution
ggplot(data, aes(x = GENDER)) +
  geom_bar(fill = "coral") +
  labs(title = "Gender Count", x = "Gender", y = "Number of People")

# Step 6: Income vs Purchase (Boxplot)
ggplot(data, aes(x = PURCHASE, y = INCOME, fill = PURCHASE)) +
  geom_boxplot() +
  labs(title = "Income by Purchase Decision", x = "Purchase?", y = "Income")

# Step 7: Average Age and Income by Purchase Status
summary_table <- data %>%
  group_by(PURCHASE) %>%
  summarise(
    Average_Age = mean(AGE),
    Average_Income = mean(INCOME),
    Count = n()
  )
print(summary_table)
