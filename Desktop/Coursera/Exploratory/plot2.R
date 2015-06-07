# load and read data
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date in ('1/2/2007','2/2/2007')", header=TRUE, stringsAsFactors=FALSE,sep=',')
data["dataTime"] <- NA;
data$dateTime <- paste(data$Date,data$Time, sep=" ")
data$dateTime <- as.POSIXct(strptime(data$dateTime, "%d/%m/%Y %H:%M:%S"))
# plot
png("./plot2.png", width=480, height=480)
plot(data$dateTime,data$Global_active_power,type="l", xlab = '', ylab="Global Active Power (killowatts)")
dev.off()