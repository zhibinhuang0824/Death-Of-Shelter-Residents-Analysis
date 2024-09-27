# Load the data
data <- read.csv("Deaths of Shelter Residents.csv")

# Remove the last column (Transgender/Non-binary/Two-Spirit)
clean_data <- data %>%
  select(-Transgender.Non.binary.Two.Spirit)

# Save the cleaned data to a new CSV file
write.csv(clean_data, "clean_data.csv", row.names = FALSE)


# Load the tidyverse package
library(tidyverse)

# Set a seed for reproducibility
set.seed(123)

# Simulate data
data <- tibble(
  id = 1:100,
  Year = sample(2007:2022, size = 100, replace = TRUE), # Randomly sample years between 2007 and 2022
  Month = sample(month.name, size = 100, replace = TRUE), # Sample month names
  Total_decedents = rpois(100, lambda = 2) # Use Poisson distribution with lambda = 2
)

# Simulate gender based on Total_decedents
data <- data %>%
  mutate(
    Male = rpois(n(), lambda = Total_decedents * 0.6), # Assume 60% are male
    Female = Total_decedents - Male, # The rest are female
  )

# Print the first few rows of the data to check it
print(head(data))

# Write the data to a CSV file
write.csv(data, "simulated_data.csv", row.names = FALSE)

