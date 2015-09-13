source('readandtidydata.R')

# Prepare PNG file
png(filename='Plot1.png', width = 480, height = 480)

# Generate plot
hist(DT$Global_active_power,
     main='Global Active Power', 
     xlab='Global Active Power (kilowatts)',
     col='red')

# Save file
dev.off()
