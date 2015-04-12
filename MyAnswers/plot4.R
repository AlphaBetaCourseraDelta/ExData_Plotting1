plot4 <- function() {
## Get Data 
  allData <- read.table("household_power_consumption.txt", sep=(";"), header = TRUE, na.strings="?")
## Update time/date format, subset correct dates  
  allData$DT <- paste(allData$Date, allData$Time, sep=" ")
  allData$Date <- as.Date(allData$Date,"%d/%m/%Y")
  allData$DT <- strptime(allData$DT,"%d/%m/%Y %H:%M:%S")
  myDates <- subset(allData, Date>="2007-02-01" & Date <= "2007-02-02")

## firstPlot, secondPlot, thirdPlot, and fourthPlot create functions to create the plot.
## they do not actually plot anything.

## Plot 1 - Global Active Power v. Time
  firstPlot<-function(){
    plot(myDates$DT,
         myDates$Global_active_power,
         type="l",
         main="",
         lwd=0.5,
         xlab="",
         ylab="Global Active Power")}

## Plot 2 - Voltage v Time
  secondPlot<-function(){
    plot(myDates$DT,
         myDates$Voltage,
         type="l",
         main="",
         xlab="datetime",
         ylab="Voltage")}
  

## Plot 3 - Sub Meterings 1-3 v. Time
  thirdPlot<-function(){
  plot(myDates$DT,myDates$Sub_metering_1,
       main="",
       type="l",
       xlab="",
       ylab="Energy sub metering",
       col="Black")
       lines(myDates$DT,myDates$Sub_metering_2,col="Red")
       lines(myDates$DT,myDates$Sub_metering_3,col="Blue")
       legend("topright","(x,y)",
              cex=1,
              bty="n",
              c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
              lty=c(1,1,1),
              lwd=c(1,1,1),col=c("Black","Red","Blue"))}

## Plot 4 - Global Reactive Power v. Time
  fourthPlot<-function(){
    plot(myDates$DT,
         myDates$Global_reactive_power,
         type="l",
         main="",
         xlab="datetime",
         ylab="Global_reactive_power")}


## This actually calls the functions created above, plots them,
## and puts the whole thing into a png file.
## I'm using the default transparent background
  png("plot4.png", width = 480, height = 480,)
    par(mfrow=c(2,2))
    firstPlot()
    secondPlot()
    thirdPlot()
    fourthPlot()
    dev.off()
}