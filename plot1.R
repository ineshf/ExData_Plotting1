#Read csv data
data<-read.csv("household_power_consumption.txt", sep=";")

###########PLOT 1################
data$Date<-as.Date(data$Date, "%d/%m/%Y")
#Select date
fec2<-as.Date("02/02/2007","%d/%m/%Y")
fec1<-as.Date("01/02/2007","%d/%m/%Y")
vec<-c(fec1,fec2)
midata<-data[data$Date %in% vec,]
#First plot 
png("plot1.png")
hist(as.numeric(as.character(midata$Global_active_power)),col="red", main="Histogram Global activity power",xlab="Global active Power (Kilowatts)",breaks=15, right=FALSE)
dev.off()
