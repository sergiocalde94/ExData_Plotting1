data <- read.csv(file = 'household_power_consumption.txt', stringsAsFactors = F, sep = ';')

data$Date <- as.Date(data$Date, '%d/%m/%Y')
data <- subset(data, Date %in% c(as.Date('01/02/2007', '%d/%m/%Y'), 
                                 as.Date('02/02/2007', '%d/%m/%Y')))

png(filename="plot2.png",
    width = 480, 
    height = 480)

data$Date <- as.POSIXct(paste(data$Date, data$Time))
with(data, plot(Date,
                as.numeric(Global_active_power),
                type = 'n',
                ylab = 'Global Active Power (kilowatts)',
                xlab = ''))
lines(data$Date,
      as.numeric(data$Global_active_power))

dev.off()
