setwd("~/ExploratoryDataAnalysis/ExData_Plotting1")
file<-"~/ExploratoryDataAnalysis/data/household_power_consumption.txt"
filedata<-read.table(file,header=T,sep=";",na.strings="?")
sub.filedata = subset(filedata, as.Date(Date, "%d/%m/%Y") >= as.Date('2007-02-01') & as.Date(Date, "%d/%m/%Y") <= as.Date('2007-02-02') )
rm(filedata)
sub.filedata$DateTime<-paste(sub.filedata$Date,sub.filedata$Time)
sub.filedata$DateTime<-strptime(sub.filedata$DateTime, "%d/%m/%Y %H:%M:%S")


png("plot4.png",width=480,height=480)

par(mfrow=c(2,2))
with(sub.filedata,plot(DateTime,Global_active_power, ylab="Global Active Power",xlab="",type="n"))
with(sub.filedata,lines(DateTime,Global_active_power))

with(sub.filedata,plot(DateTime,Voltage, ylab="Voltage",xlab="datetime",type="n"))
with(sub.filedata,lines(DateTime,Voltage))

with(sub.filedata,plot(DateTime,Sub_metering_1, ylab="Energy sub metering",xlab="",type="n"))
with(sub.filedata,lines(DateTime,Sub_metering_1, col="black"))
with(sub.filedata,lines(DateTime,Sub_metering_2, col="red"))
with(sub.filedata,lines(DateTime,Sub_metering_3, col="blue"))
legend("topright", pch ="_", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), bty="n")

with(sub.filedata,plot(DateTime,Global_reactive_power, ylab="Global_reactive_power",xlab="datetime",type="n"))
with(sub.filedata,lines(DateTime,Global_reactive_power))

dev.off()
