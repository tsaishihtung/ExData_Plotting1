library(data.table)
file<-"./data/household_power_consumption.txt"
dt<-fread(file)
dt1<-dt[dt$Date=="1/2/2007"]
dt2<-dt[dt$Date=="2/2/2007"]
dt3<-rbind(dt1,dt2)
df<-data.frmae(dt3)
Date_time<-as.POSIXct(paste(df[,1],df[,2]),format="%d/%m/%Y %H:%M:%S")
png(file="./data/plot2.png")
plot(Date_time,df[,3],type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()