setwd("C:\\Users\\ASUS\\Desktop\\coursera\\Exploratory Analysis")
data <- "./data/household_power_consumption.txt"
household <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
household$Date <- as.Date(household$Date, "%d/%m/%Y")

data_Feb <- household[household$Date >= "2007-02-01" &
                        household$Date <= "2007-02-02", ]

data_Feb$Date_Time <- strptime(paste(data_Feb$Date,data_Feb$Time, sep = " "), 
                               format = "%Y-%m-%d %H:%M:%S")
data_Feb$Sub_metering_1 <- as.numeric(data_Feb$Sub_metering_1)
data_Feb$Sub_metering_2 <- as.numeric(data_Feb$Sub_metering_2)
data_Feb$Sub_metering_3 <- as.numeric(data_Feb$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(data_Feb$Date_Time, data_Feb$Sub_metering_1, col = "black",
     ylab = "Energy sub metering", xlab = "", type ="l")
lines(data_Feb$Date_Time, data_Feb$Sub_metering_2, col = "red")
lines(data_Feb$Date_Time, data_Feb$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()