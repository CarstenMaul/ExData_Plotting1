source('readandtidydata.R')

# Prepare PNG file
png(filename='Plot2.png', width = 480, height = 480)

# Make plot
plot(DT$DateTime,
     DT$Global_active_power,
     ylab='Global Active Power (kilowatts)',
     xlab='', type='l')

# Save file
dev.off()