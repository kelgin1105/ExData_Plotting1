data <- "./data/household_power_consumption.txt"
household <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
household$Date <- as.Date(household$Date, "%d/%m/%Y")

data_Feb <- household[household$Date >= "2007-02-01" &
                        household$Date <= "2007-02-02", ]

data_Feb$Global_active_power <- as.numeric(data_Feb$Global_active_power)

png("plot1.png", width=480, height=480)
hist(data_Feb$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()