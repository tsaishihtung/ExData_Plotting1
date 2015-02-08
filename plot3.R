library(data.table)
file<-"./data/household_power_consumption.txt"
dt<-fread(file)
dt1<-dt[dt$Date=="1/2/2007"]
dt2<-dt[dt$Date=="2/2/2007"]
dt3<-rbind(dt1,dt2)
df<-data.frmae(dt3)
Date_time<-as.POSIXct(paste(df[,1],df[,2]),format="%d/%m/%Y %H:%M:%S")
c7<-as.numeric(df[,7])
c8<-as.numeric(df[,8])
c9<-as.numeric(df[,9])
png(file="./data/plot3.png")
plot(Date_time,c7,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(Date_time,c8,type="l",col="red")
lines(Date_time,c9,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
