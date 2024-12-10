# Load necessary libraries
if(!require(readr)) install.packages('readr')
if(!require(dplyr)) install.packages('dplyr') 
if(!require(lubridate)) install.packages('lubridate')


plot(MAX_TEMP ~ PM10, data = Plauen_AirQ)

#Correlating the max temp with PM10 and excluding any NA values
cor(Plauen_AirQ$MAX_TEMP, Plauen_AirQ$PM10, use = "complete.obs")

#Plotting all the variables within the Plauen_AirQ against each other
plot(Plauen_AirQ)

#Check distribution over years
plot(Plauen_AirQ_PAW_T$Date ~ Plauen_AirQ_PAW_T$PM10)

#find weekday
Plauen_AirQ_2005_2024$WeekDay <- wday(Plauen_AirQ_2005_2024$Date, week_start = 7) 

#find correlation if weekday is 1 (Sunday)
cor(Plauen_AirQ$AVG_TEMP[Plauen_AirQ$Week_Day == 4], Plauen_AirQ$PM2.5[Plauen_AirQ$Week_Day == 4], use = "complete.obs")

#Plotting correlation
plot(AVG_TEMP[Plauen_AirQ$Week_Day == 1] ~ PM2.5[Plauen_AirQ$Week_Day == 1], data = Plauen_AirQ)

#Join the AirQ with the PAW60 with month/year and with Plauen_Temp with Date
Plauen_AirQ_2005_2024$Month_Year <- format(Plauen_AirQ_2005_2024$Date, "%m-%Y")
write.csv(Plauen_AirQ_2005_2024, file = "PL_AirQ_2005_2024.csv")

PL_AirQ_PAW_2005_2024 <- left_join(PL_AirQ_2005_2024, PL_PAW_60, by = "Month_Year", relationship= "many-to-one")
PL_AirQ_PAW_T_2005_2024 <- merge(PL_AirQ_PAW_2005_2024, Plauen_Temp, by = "Date", all = TRUE)

#Create a csv file from data frame
write.csv(PL_AirQ_PAW_T_2005_2024, file = "PL_AirQ_PAW_T.csv")

#Find correlation if Plant Available Water (PAW) is less than 70
cor(Plauen_AirQ_SM_T$MAX_TEMP[Plauen_AirQ_SM_T$PAW < 70],Plauen_AirQ_SM_T$PM2.5[Plauen_AirQ_SM_T$PAW < 70], use = "complete.obs" )

#Find correlation if Plant Available Water (PAW) is less than 70 and weekday is 1
cor(PL_AirQ_PAW_T_v3$Max_Daily_Temp_C[PL_AirQ_PAW_T_v3$PAW_60cm < 51.58 & PL_AirQ_PAW_T_v3$WeekDay == 1],PL_AirQ_PAW_T_v3[PL_AirQ_PAW_T_v3$PAW_60cm < 51.58 & PL_AirQ_PAW_T_v3$WeekDay == 1], use = "complete.obs" )

#Create subset for weekday (1) and PAW<50
subset_df <- PL_AirQ_PAW_T_v3[PL_AirQ_PAW_T_v3$PAW_60cm < 51.58 & PL_AirQ_PAW_T_v3$WeekDay == 6, ]
plot(subset_df$Max_Daily_Temp_C ~ subset_df$PM10, data = subset_df)
cor.test(subset_df$Max_Daily_Temp_C, subset_df$PM10, use = "complete.obs", method = "spearman")


