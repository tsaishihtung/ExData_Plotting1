library(data.table)
file<-"./data/household_power_consumption.txt"
dt<-fread(file)
dt1<-dt[dt$Date=="1/2/2007"]
dt2<-dt[dt$Date=="2/2/2007"]
dt3<-rbind(dt1,dt2)
df<-data.frmae(dt3)
Date_time<-as.POSIXct(paste(df[,1],df[,2]),format="%d/%m/%Y %H:%M:%S")
c3<-as.numeric(df[,3])
c4<-as.numeric(df[,4])
c5<-as.numeric(df[,5])
c7<-as.numeric(df[,7])
c8<-as.numeric(df[,8])
c9<-as.numeric(df[,9])
df1<-data.frame(Date_time,c3,c4,c5,c7,c8,c9)
png(file="./data/plot4.png")
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(df1,{
plot(Date_time,c3,type="l",xlab="",ylab="Global Active Power")
plot(Date_time,c5,type="l",xlab="datetime",ylab="Voltage")
plot(Date_time,c7,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(Date_time,c8,type="l",col="red")
lines(Date_time,c9,type="l",col="blue")
legend("topright",lty=1,bty="n",cex=0.75,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(Date_time,c4,type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()

