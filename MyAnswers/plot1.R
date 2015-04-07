## This plots a histogram of Global Active Power for 2/1/2007-2/2/2007.

plot1 <- function() {
## Read data
  allData <- read.table("household_power_consumption.txt", sep=(";"), header = TRUE, na.strings="?")
## Transform and subset the data 
  allData$Date <- as.Date(allData$Date,"%d/%m/%Y")
  relevantDates <- subset(allData, Date>="2007-02-01" & Date <= "2007-02-02")
## Plot the histogram and save it to a PNG file  
  png("plot1.png", width = 480, height = 480,)
    hist(relevantDates$Global_active_power,
       main="Global Active Power",
       xlab="Global Active Power (kilowatts)",
       ylab="Frequency",
       col="Red")
  dev.off()
}