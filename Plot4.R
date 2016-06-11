#get the data in R
path_rf <-"/Users/hatsumi/Documents/coursera/Exploratory\ Data\ Analysis\ with\ R"
data <- read.table(file.path(path_rf, "household_power_consumption.txt" ),header = TRUE,sep=";", stringsAsFactors=FALSE, dec=".")

#subset for necessary months (Btw 2007-02-01 and 2007-02-02)
data2<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Reformat data
data3<- transform(data2, timestamp=strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
data3$Sub_metering_1 <- as.numeric(as.character(data3$Sub_metering_1))
data3$Sub_metering_2 <- as.numeric(as.character(data3$Sub_metering_2))
data3$Sub_metering_3 <- as.numeric(as.character(data3$Sub_metering_3))
data3$Global_active_power <- as.numeric(as.character(data3$Global_active_power))
data3$Global_reactive_power <- as.numeric(as.character(data3$Global_reactive_power))
data3$Voltage <- as.numeric(as.character(data3$Voltage))

#Create graph 
par(mfrow=c(2,2))

##PLOT 1
plot(data3$timestamp,data3$Global_active_power, type="l", xlab="", ylab="Global Active Power")
##PLOT 2
plot(data3$timestamp,data3$Voltage, type="l", xlab="datetime", ylab="Voltage")
##PLOT 3
plot(data3$timestamp,data3$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data3$timestamp,data3$Sub_metering_2,col="red")
lines(data3$timestamp,data3$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
#PLOT 4
plot(data3$timestamp,data3$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#OUTPUT
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()