x <- readClipboard()
wd <- gsub("\\\\", "/", x)


library(dplyr)

#Download the dataset from "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"
#Then we unzip the data and read the activity dataset
unzip("repdata-data-activity.zip")

activitydata <- read.csv("activity.csv", sep = ",")

#View the structure of dataset
str(activitydata)
#Need to change date to date format
activitydata$date <- as.Date(activitydata$date)

#Filter NA observations
activity <- activitydata %>% filter(complete.cases(activitydata))

head(activity)


#####
## What is the mean total number of steps taken per day?
#####

## Need to print out plots and save them.


png(filename = "Histogram Total Steps.png")

hist(totalsteps$steps, xlab = "Number of Steps", main = "Histogram of Total Number of Steps Each Day", col = 'light blue')

dev.off()

