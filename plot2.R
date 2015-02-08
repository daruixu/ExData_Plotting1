#read.table is slow but it is stable without warning messages
#see plot1.R for details
infile<-"household_power_consumption.txt"
colTypes<-c(rep("character",2), rep("numeric",6))
df<-read.table(infile, header=T, sep=";", na.strings = "?", colClasses=colTypes)
sub_df<-df[df$Date=='1/2/2007' | df$Date=='2/2/2007',]
sub_df$Time<-strptime(paste(sub_df$Date, sub_df$Time), "%d/%m/%Y %H:%M:%S")

par(mar=c(5,5,4,2))
with(sub_df, plot(Time, Global_active_power,type='l', xlab="", ylab="Global Active Power (kilowatts)"), main="")
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()

