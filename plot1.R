library(data.table)
file<-"./data/household_power_consumption.txt"
dt<-fread(file)
dt1<-dt[dt$Date=="1/2/2007"]
dt2<-dt[dt$Date=="2/2/2007"]
dt3<-rbind(dt1,dt2)
df<-data.frmae(dt3)
png(file="./data/plot1.png")
hist(as.numeric(df[,3]),main="Global Active Power",xlab="Global Active Power kilowatts)",col="red")
dev.off()