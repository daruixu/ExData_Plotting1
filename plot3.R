#read in the data; see plot1.R for other options.
infile<-"household_power_consumption.txt"
colTypes<-c(rep("character",2), rep("numeric",6))
df<-read.table(infile, header=T, sep=";", na.strings = "?", colClasses=colTypes)
sub_df<-df[df$Date=='1/2/2007' | df$Date=='2/2/2007',]
sub_df$Time<-strptime(paste(sub_df$Date, sub_df$Time), "%d/%m/%Y %H:%M:%S")

#send the graph to device png directly. somehow if I make it on the screen
#first then copy to png, the legend is chopped off.
png(file = "plot3.png", width=480, height=480)
# set the margin so the left side has a little more space
par(mar=c(5,5,4,2))
with(sub_df, plot(Time, Sub_metering_1, type='l', xlab="", ylab="Energy sub meeting"))
with(sub_df, lines(Time, Sub_metering_2, col='red'))
with(sub_df, lines(Time, Sub_metering_3, col='blue'))
legend("topright", lty=1,cex=0.8, col = c("black", "red", "blue"), legend = c("Sub_meeting_1", "Sub_meeting_2", "Sub_meeting_3"))
dev.off()
