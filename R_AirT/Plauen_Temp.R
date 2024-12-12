# Load necessary libraries
if(!require(readr)) install.packages('readr')
if(!require(dplyr)) install.packages('dplyr') 
if(!require(lubridate)) install.packages('lubridate')


# Extract the day of the year from the "Date" column
Plauen_Temp$Day <- yday(Plauen_Temp$Date)

# Calculate the 90th percentile of daily temperature for each day of the year
Plauen_T_Percentile <- Plauen_Temp %>%
  group_by(Day) %>%
  summarise(Percentile90 = quantile(Max_Daily_Temp_C, 0.9, na.rm = TRUE))

# Join the "Plauen_Temp" and "Plauen_T_Percentile" tables based on the "Day" column
Plauen_Temp <- left_join(Plauen_Temp, Plauen_T_Percentile, by = "Day")

# Add the "Exceeds" column
Plauen_Temp$Exceeds <- ifelse(Plauen_Temp$Max_Daily_Temp_C > Plauen_Temp$Percentile90, "Y", 
                              ifelse(is.na(Plauen_Temp$Max_Daily_Temp_C), "NA", "N"))

# Add the "HeatWave" column
Plauen_Temp$HeatWave <- ifelse((Plauen_Temp$Exceeds == "Y") & 
                                 (((lag(Plauen_Temp$Exceeds) == "Y") & (lead(Plauen_Temp$Exceeds) == "Y")) 
                               | ((lag(Plauen_Temp$Exceeds, 2) == "Y") & (lag(Plauen_Temp$Exceeds) == "Y"))
                               | ((lead(Plauen_Temp$Exceeds, 2) == "Y") & (lead(Plauen_Temp$Exceeds) == "Y"))), "HW", "")

# Count the number of values exceeding 30
count <- sum(Plauen_T_Percentile$Percentile90 > 30, na.rm = TRUE)

# Print the count
print(count)

write.csv(Plauen_T_Percentile, file = "Plauen_T_Percentile.csv")

# Calculate the 95th percentile of daily temperature for each day of the year
Plauen_T_Percentile <- Plauen_Temp %>%
  group_by(Day) %>%
  summarise(Percentile90 = quantile(Max_Daily_Temp_C, 0.9, na.rm = TRUE),
            Percentile95 = quantile(Max_Daily_Temp_C, 0.95, na.rm = TRUE))

# Join the "Plauen_Temp" and "Plauen_T_Percentile" tables based on the "Day" column
Plauen_Temp <- left_join(Plauen_Temp, Plauen_T_Percentile, by = "Day")
Plauen_Temp$Percentile90.y <- NULL
Plauen_Temp <- rename(Plauen_Temp, percentile90=Percentile90.x)

# Count the number of values exceeding 32
count <- sum(Plauen_T_Percentile$Percentile95 > 32, na.rm = TRUE)

# Print the count
print(count)

# calculate the 90th percentile of all the days combined
Plauen_T_Percentile_full <- Plauen_Temp %>%
  summarise(Percentile90 = quantile(Max_Daily_Temp_C, 0.98, na.rm = TRUE),
            Percentile95 = quantile(Max_Daily_Temp_C, 0.99, na.rm = TRUE))

