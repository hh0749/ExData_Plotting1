#get the data in R
path_rf <-"/Users/hatsumi/Documents/coursera/Exploratory\ Data\ Analysis\ with\ R"
data <- read.table(file.path(path_rf, "household_power_consumption.txt" ),header = TRUE,sep=";", stringsAsFactors=FALSE, dec=".")

#subset for necessary months (Btw 2007-02-01 and 2007-02-02)
data2<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Create graph - png1
globalActivePower <- as.numeric(data2$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()

plot(datetime,globalActivePower, type="l", )