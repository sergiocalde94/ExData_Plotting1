data <- read.csv(file = 'household_power_consumption.txt', stringsAsFactors = F, sep = ';')

data$Date <- as.Date(data$Date, '%d/%m/%Y')
data <- subset(data, Date %in% c(as.Date('01/02/2007', '%d/%m/%Y'), 
                                 as.Date('02/02/2007', '%d/%m/%Y')))

png(filename="plot3.png",
    width = 480, 
    height = 480)

data$Date <- as.POSIXct(paste(data$Date, data$Time))
plot(data$Date,
     data$Sub_metering_1,
     type = 'n',
     col = 'red',
     ylab = 'Energy sub metering',
     xlab = '')
lines(data$Date,
      data$Sub_metering_1)
lines(data$Date,
      data$Sub_metering_2,
      col='red')
lines(data$Date,
      data$Sub_metering_3,
      col='blue')
legend("topright",
       lty=c(1),
       col=c('black', 'red', 'blue'),
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

  dev.off()
