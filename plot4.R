#Read csv data
data<-read.csv("household_power_consumption.txt", sep=";")

###########PLOT 1################
data$Date<-as.Date(data$Date, "%d/%m/%Y")
#Select date
fec2<-as.Date("02/02/2007","%d/%m/%Y")
fec1<-as.Date("01/02/2007","%d/%m/%Y")
vec<-c(fec1,fec2)
midata<-data[data$Date %in% vec,]
datecomp<-paste(midata$Date, sep=" ", midata$Time)
miDate<-strptime(datecomp, "%Y-%m-%d %H:%M:%S")
odata<-cbind(midata,miDate)

##########PLOT 4###############
png("plot4.png",width = 480, height = 480)
par(mfrow = c(2, 2))
plot(odata$miDate, odata$Global_active_power,type="l", xlab="",ylab="Global active Power (Kilowatts)")
plot(odata$miDate, odata$Voltage, type="l",ylab="Global active Power (Kilowatts)",xlab="DateTime")
plot(odata$miDate, as.numeric(as.character(odata$Sub_metering_3)),type="l", col="blue",xlab="",ylab="Energy metering",ylim=c(0,30))
lines(odata$miDate,as.numeric(as.character(odata$Sub_metering_2)), type="l",col="red")
lines(odata$miDate,as.numeric(as.character(odata$Sub_metering_1)), type="l",col="black")

legend('topright', # places a legend at the appropriate place 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       lwd=c(2.5,2.5,2.5),col=c("blue","red","black")) # gives the legend lines the correct color and width

plot(odata$miDate, odata$Global_reactive_power  , type="l",ylab="Global_reactive_power",xlab="DateTime")
dev.off()     
