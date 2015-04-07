## This plots time v. Sub_metering for 2/1/2007-2/2/2007.
plot3 <- function() {
  
## Read in data
  allData <- read.table("household_power_consumption.txt", sep=(";"), header = TRUE, na.strings="?")

## Create a column for date & time together and convert dates and times.  
  allData$DT <- paste(allData$Date, allData$Time, sep=" ")
  allData$Date <- as.Date(allData$Date,"%d/%m/%Y")
  allData$DT <- strptime(allData$DT,"%d/%m/%Y %H:%M:%S")
## Subset relevant data
  relevantDates <- subset(allData, Date>="2007-02-01" & Date <= "2007-02-02")

## Plot data
  png("plot3.png", width = 480, height = 480,)
    plot(relevantDates$DT,relevantDates$Sub_metering_1,
       main="",
       type="l",
       xlab="",
       ylab="Energy sub metering",
       col="Black")
       lines(relevantDates$DT,relevantDates$Sub_metering_2,col="Red")
       lines(relevantDates$DT,relevantDates$Sub_metering_3,col="Blue")
       legend("topright","(x,y)",
              c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
              lty=c(1,1,1),
              lwd=c(1,1,1),col=c("Black","Red","Blue"))
  dev.off()
}