## This plots time v. Sub_metering for 2/1/2007-2/2/2007.
plot3 <- function() {
  
## Get the data.  While it was recommended that we not download the entire file,
## it was not required that we do so.
## I decided to download and read in the whole thing and subset it
## later.
  
  temp <-tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp,mode="wb")
  theUnzippedFile <- unz(temp,"household_power_consumption.txt")
  
  allData <- read.table(theUnzippedFile,
                        sep=(";"),
                        header = TRUE,
                        na.strings="?")
  unlink(temp)
  
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