source('readandtidydata.R')

# Prepare PNG file
png(filename='Plot3.png', width = 480, height = 480)


#Create plot
plot(DT$DateTime,
     DT$Sub_metering_1, type='l',
     xlab='',
     ylab='Energy sub metering')

lines(DT$DateTime, DT$Sub_metering_2, col='red')
lines(DT$DateTime, DT$Sub_metering_3, col='blue')

legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid')

# Save file
dev.off()