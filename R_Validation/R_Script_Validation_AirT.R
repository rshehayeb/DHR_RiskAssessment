# Load necessary library
if(!require(readr)) install.packages('readr')

# Read data from CSV files (edit path)
Humidity_Results <- read_csv("C:/R_Validation/Validation/Validation_ENVImet_Humidity.csv")

# Assuming the Specific Humidity data is in a column named 'Envi_SH' and SH_Mobile
SH_Model <- Humidity_Results$Envi_SH
SH_Device <- Humidity_Results$SH_Mobile

# Perform the Mann-Whitney U test
MWU_Test <- wilcox.test(SH_Model, SH_Device)

# Mean Absolute Error (MAE)
absolute_errors <- abs(SH_Model - SH_Device)
mae <- mean(absolute_errors)


# Root mean squared error (RMSE)
squared_errors <- (SH_Model - SH_Device)^2
mse <- mean(squared_errors)  #mean squared error
rmse <- sqrt(mse)  #root mean squared error


# Print test results
print(MWU_Test)
print(mae)
print(rmse)

