# load and read data
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date in ('1/2/2007','2/2/2007')", header=TRUE, stringsAsFactors=FALSE,sep=',')

# plot
png("./plot1.png", width=480, height=480)
hist(data$Global_active_power,col='red',main="Global Active Power", xlab= "Global Active Power(killowatts)")
dev.off()