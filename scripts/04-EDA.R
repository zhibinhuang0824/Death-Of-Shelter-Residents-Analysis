ggplot(data, aes(x = Total.decedents)) +
  geom_histogram(aes(y = ..density..), bins = 20, fill = "blue", alpha = 0.6) +
  geom_density(color = "red", size = 1) +
  labs(title = "Normal Distribution of Total Decedents", x = "Total Decedents", y = "Density") +
  theme_bw()  # This sets a white background

# Descriptive statistics table
descriptive_stats <- data %>%
  summarise(
    Mean = mean(Total.decedents, na.rm = TRUE),
    Median = median(Total.decedents, na.rm = TRUE),
    SD = sd(Total.decedents, na.rm = TRUE),
    Min = min(Total.decedents, na.rm = TRUE),
    Max = max(Total.decedents, na.rm = TRUE)
  )
kable(descriptive_stats, format = "markdown", col.names = c("Mean", "Median", "Standard Deviation", "Minimum", "Maximum"), caption = "Descriptive Statistics for Total Decedents")


# Simple line plot with ggplot
ggplot(data, aes(x = Month_Year, y = Total.decedents)) +
  geom_line(color = "blue") +
  labs(title = "Time Series of Total Decedents", x = "Time", y = "Total Decedents") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))



# Aggregate total decedents by each quarter across all years
quarterwise_data <- data %>%
  group_by(Quarter) %>%
  summarise(Total_decedents = sum(Total.decedents, na.rm = TRUE))

# Bar plot for total decedents by Quarter across all years
ggplot(quarterwise_data, aes(x = Quarter, y = Total_decedents, fill = Quarter)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("Q1" = "steelblue", "Q2" = "coral", "Q3" = "chocolate1", "Q4" = "purple")) +
  labs(title = "Total Decedents by Quarter (Across All Years)", x = "Quarter", y = "Total Decedents") +
  theme_minimal()

# Aggregate data by year and gender
yearwise_gender_data <- data %>%
  group_by(Year) %>%
  summarise(Male = sum(Male, na.rm = TRUE),
            Female = sum(Female, na.rm = TRUE))

# Bar plot for year-wise male and female decedents
ggplot(yearwise_gender_data, aes(x = Year)) +
  geom_bar(aes(y = Male, fill = "Male"), stat = "identity", position = "dodge") +
  geom_bar(aes(y = Female, fill = "Female"), stat = "identity", position = "dodge") +
  labs(title = "Year-wise Gender-wise Decedents", x = "Year", y = "Number of Decedents", fill = "Gender") +
  scale_fill_manual(values = c("Male" = "steelblue", "Female" = "darkorange")) +
  theme_minimal()