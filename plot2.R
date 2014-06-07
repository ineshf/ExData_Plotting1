#Read csv data
data<-read.csv("household_power_consumption.txt", sep=";")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
#Select date
fec2<-as.Date("02/02/2007","%d/%m/%Y")
fec1<-as.Date("01/02/2007","%d/%m/%Y")
vec<-c(fec1,fec2)
midata<-data[data$Date %in% vec,]

##########PLOT 2###############
datecomp<-paste(midata$Date, sep=" ", midata$Time)
miDate<-strptime(datecomp, "%Y-%m-%d %H:%M:%S")
odata<-cbind(midata,miDate)
png("plot2.png",width = 480, height = 480)
plot(odata$miDate, odata$Global_active_power,type="l", main="Plot 2", xlab="",ylab="Global active Power (Kilowatts)")
dev.off()


