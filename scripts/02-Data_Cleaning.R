# Load your data
data <- read.csv("clean_data.csv")

# Convert Month-Year to a proper date format and create Quarter variable
data$Month_Year <- as.Date(paste(data$Year, data$Month, "01", sep = "-"), "%Y-%b-%d")
data$Quarter <- quarters(data$Month_Year)