source('readandtidydata.R')

# Prepare PNG file
png(filename='Plot4.png', width = 480, height = 480)

## Prepare plot layout
par(mfrow=c(2,2))

# Plot #1
plot(DT$DateTime, DT$Global_active_power,
     ylab='Global Active Power', xlab='',
     type='l')

# Plot #2
plot(DT$DateTime, DT$Voltage,
     xlab='datetime', ylab='Voltage',
     type='l')

# Plot #3
plot(DT$DateTime, DT$Sub_metering_1,
     xlab='', ylab='Energy sub metering',
     type='l')
lines(DT$DateTime, DT$Sub_metering_2, col='red')
lines(DT$DateTime, DT$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid', bty='n')

# Plot #4
plot(DT$DateTime, DT$Global_reactive_power,
     xlab='datetime', ylab='Global_reactive_power',
     type='l')

# Save file
dev.off()