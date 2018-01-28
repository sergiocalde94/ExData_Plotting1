data <- read.csv(file = 'household_power_consumption.txt', stringsAsFactors = F, sep = ';')

data$Date <- as.Date(data$Date, '%d/%m/%Y')
data <- subset(data, Date %in% c(as.Date('01/02/2007', '%d/%m/%Y'), 
                                 as.Date('02/02/2007', '%d/%m/%Y')))

png(filename="plot4.png",
    width = 480, 
    height = 480)

data$Date <- as.POSIXct(paste(data$Date, data$Time))

par(mfrow = c(2, 2))
# FIRST PLOT
with(data, plot(Date,
                as.numeric(Global_active_power),
                type = 'n',
                ylab = 'Global Active Power (kilowatts)',
                xlab = ''))
lines(data$Date,
      as.numeric(data$Global_active_power))
# SECOND PLOT
with(data, plot(Date,
                as.numeric(Voltage),
                type = 'n',
                xlab = 'datetime',
                ylab = 'Voltage'))
lines(data$Date,
      as.numeric(data$Voltage))
# THIRD PLOT
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
# FOURTH PLOT
with(data, plot(Date,
                as.numeric(Global_reactive_power),
                type = 'n',
                xlab = 'datetime',
                ylab = 'Global_reactive_power'))
lines(data$Date,
      as.numeric(data$Global_reactive_power))

dev.off()
