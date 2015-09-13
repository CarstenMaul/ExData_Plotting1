library(lubridate)


# if source data file does not exists, download and unzip it into the working directory
if (!file.exists('household_power_consumption_tidy.txt')) {
  
  # Step 1: download data file to temp file, unzip into other temp file
  tempdownload <- tempfile()
  download.file(url='https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile=tempdownload)
  
  unzip(tempdownload,exdir=getwd())
  
  unlink(tempdownload)
  
  # Step 2: tidy data and save it
  DT <- read.table("household_power_consumption.txt",
                   header=TRUE,
                   sep=";",
                   na.strings="?",
                   colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
  )
  
  DT$Date <- dmy(DT$Date)
  DT$Time <- hms(DT$Time)
  
  startdate <- ymd("2007-02-01")
  enddate   <- ymd("2007-02-02")
  
  DT <- subset(DT, year(Date) == 2007 & month(Date) == 2 & (day(Date) == 1 | day(Date) == 2))
  
  DT$DateTime <- DT$Date + DT$Time
  
  saveRDS(DT,file="household_power_consumption_tidy.txt")
  
  unlink("household_power_consumption.txt")

} else {
  DT <- readRDS('household_power_consumption_tidy.txt')
}