setwd("C:\\Users\\ASUS\\Desktop\\coursera\\Exploratory Analysis")
data <- "./data/household_power_consumption.txt"
household <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
household$Date <- as.Date(household$Date, "%d/%m/%Y")

data_Feb <- household[household$Date >= "2007-02-01" &
                        household$Date <= "2007-02-02", ]

data_Feb$Global_active_power <- as.numeric(data_Feb$Global_active_power)
data_Feb$Date_Time <- strptime(paste(data_Feb$Date,data_Feb$Time, sep = " "), 
                               format = "%Y-%m-%d %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(data_Feb$Date_Time,data_Feb$Global_active_power, type = 'l', xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()
