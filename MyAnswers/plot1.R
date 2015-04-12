## This plots a histogram of Global Active Power for 2/1/2007-2/2/2007.

plot1 <- function() {
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