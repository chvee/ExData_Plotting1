plot1 <- function() {

## read in data file

colTypes <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", colClasses = colTypes)
startdate <- strptime("2007-02-01", "%Y-%m-%d")
enddate <- strptime("2007-02-03", "%Y-%m-%d")
## I use the third of February to avoid having to code in the time values

data$dateTime <- paste(data$Date, data$Time, sep=" ")
data$dateTime <- strptime(data$dateTime, format = "%d/%m/%Y %H:%M:%S")
data.sub <- subset(data, data$dateTime >= startdate & data$dateTime < enddate)


#open graphics file
png("plot1.png", width = 480, height = 480)

#generate plots
hist(data.sub$Global_active_power, col="red" ,main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)")

#close graphics file
dev.off()

}