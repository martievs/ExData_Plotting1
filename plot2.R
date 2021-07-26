setwd("C://Users//Martie//OneDrive//Documents//R//Exdata//")

#read data set
exdata<- read.table('household_power_consumption.txt', skip=1,sep=";")
names(exdata) <-  c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#subset data for the 2 days under investigation
power <- subset(exdata,exdata$Date == "1/2/2007"|exdata$Date == "2/2/2007")

#Format date and time
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

#Set time field to a concatenation between the date and time
power$Time <- as.POSIXct(paste(power$Date,power$Time),format="%Y-%m-%d %H:%M:%S")

plot(power$Time,as.numeric(as.character(power$Global_active_power)), type="l",xlab="",ylab="Global Active Power (kilowatts)") 
setwd("C://Users//Martie//OneDrive//Documents//R//ExData_Plotting1//")
dev.copy(device = png, filename = 'plot2.png', width = 480, height = 480, unit="px")

dev.off()