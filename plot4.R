#read the data with read.table
#see plot1.R for other options
infile<-"household_power_consumption.txt"
colTypes<-c(rep("character",2), rep("numeric",6))
df<-read.table(infile, header=T, sep=";", na.strings = "?", colClasses=colTypes)
sub_df<-df[df$Date=='1/2/2007' | df$Date=='2/2/2007',]
#strptime needs both date and time to correctly display the actual date and time
sub_df$Time<-strptime(paste(sub_df$Date, sub_df$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", width=480, height=480)
par(mar = c(5, 5, 4, 2), mfcol=c(2,2))
with(sub_df, plot(Time, Global_active_power,type='l', xlab="", ylab="Global Active Power (kilowatts)"), main="")
with(sub_df, plot(Time, Sub_metering_1, type='l', xlab="", ylab="Energy sub meeting"))
with(sub_df, lines(Time, Sub_metering_2, col='red'))
with(sub_df, lines(Time, Sub_metering_3, col='blue'))
with(sub_df, plot(Time, Voltage, type='l', xlab="datetime"))
with(sub_df, plot(Time, Global_reactive_power, type='l', xlab="datetime"))
par(mfcol=c(1,1))
dev.off()