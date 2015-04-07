## This plots time v. Global Active Power for 2/1/2007-2/2/2007.

plot2 <- function() {
## Read in data
  allData <- read.table("household_power_consumption.txt", sep=(";"), header = TRUE, na.strings="?")

## Create a column for date & time together and convert dates and times.  
  allData$DT <- paste(allData$Date, allData$Time, sep=" ")
  allData$Date <- as.Date(allData$Date,"%d/%m/%Y")
  allData$DT <- strptime(allData$DT,"%d/%m/%Y %H:%M:%S")

## Subset relevant data
  relevantDates <- subset(allData, Date>="2007-02-01" & Date <= "2007-02-02")

## Plot data
  png("plot2.png", width = 480, height = 480,)
  plot(relevantDates$DT,
       relevantDates$Global_active_power,
       type="l",
       main="",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  dev.off()
}