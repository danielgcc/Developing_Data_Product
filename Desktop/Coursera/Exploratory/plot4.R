# load and read data
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date in ('1/2/2007','2/2/2007')", header=TRUE, stringsAsFactors=FALSE,sep=',')
data["dataTime"] <- NA;
data$dateTime <- paste(data$Date,data$Time, sep=" ")
data$dateTime <- as.POSIXct(strptime(data$dateTime, "%d/%m/%Y %H:%M:%S"))
# plot
png("./plot4.png", width=480, height=480)
par(mfrow = c(2,2), mar = c(4,4,2,1))
with(data, plot(dateTime, Global_active_power,type="l", xlab = '', ylab="Global Active Power (killowatts)"))

with(data, plot(dateTime, Voltage, type="l", xlab = 'datetime', ylab="Voltage"))


with(data, plot(dateTime, Sub_metering_1,type='l', col='black',xlab = '', ylab="Energy sub metering"))
with(subset(data), points(dateTime, Sub_metering_2,type='l',col='red'))
with(subset(data), points(dateTime, Sub_metering_3,type='l',col='blue'))
legend("topright", pch='-',col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(data, plot (dateTime, Global_reactive_power, type="l", xlab = 'datetime', ylab="Global_reactive_power"))

dev.off()