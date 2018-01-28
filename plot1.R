data <- read.csv(file = 'household_power_consumption.txt', stringsAsFactors = F, sep = ';')

data$Date <- as.Date(data$Date, '%d/%m/%Y')
data <- subset(data, Date %in% c(as.Date('01/02/2007', '%d/%m/%Y'), as.Date('02/02/2007', '%d/%m/%Y')))

png(filename="plot1.png",
    width = 480, 
    height = 480)

hist(as.numeric(data$Global_active_power),
     col='red',
     xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency',
     main = 'Global Active Power')

dev.off()
