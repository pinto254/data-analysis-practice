# Load necessary packages
library(dplyr)
library(stringi)

# Set seed for reproducibility
set.seed(123)

# Create dataset
n <- 100  # number of rows

data <- data.frame(
  ID = 1:n,
  Name = stri_rand_strings(n, 5, pattern = "[A-Za-z]"),
  Age = sample(18:65, n, replace = TRUE),
  Gender = sample(c("Male", "Female"), n, replace = TRUE),
  Income = round(rnorm(n, mean = 60000, sd = 15000), 0),
  Location = sample(c("Nairobi", "Nakuru", "Kisumu", "Mombasa", "Eldoret"), n, replace = TRUE),
  Product = sample(c("Electronics", "Clothing", "Groceries", "Books", "Furniture"), n, replace = TRUE),
  Purchase_Amount = round(runif(n, 100, 5000), 0),
  Purchased = sample(c("Yes", "No"), n, replace = TRUE, prob = c(0.7, 0.3))
)

# View the first few rows
head(data)
