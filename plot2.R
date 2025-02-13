#reading data (same as plot 1.R)
data_full <- read.csv("household_power_consumption.txt",header=T, sep=';',na.strings="?",nrows=2075259,check.names=F,stringsAsFactors=F,comment.char="",quote='\"')

#creating subset of data between required dates (same as plot 1.R)
data1<-subset(data_full,Date %in% c("1/2/2007","2/2/2007"))
data1$Date<-as.Date(data1$Date,format="%d/%m/%Y")

#formatting date and time
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

#plotting
with(data1, {
  plot(Global_active_power~Datetime, type="l",
    ylab="Global Active Power (kilowatts)", xlab="")
 })
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
