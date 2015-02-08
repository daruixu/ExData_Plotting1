#For project 1 of the Exploratory Analysis class. 
#Plot histogram
#The challenge in this assigment is the importing part.
#fread is supposed to handle large dataset more efficiently
#however, the NA in this dataset is represented by '?'
#It seems fread cannont properly handle the na.strings='?'
#It produces a bunch of warnings.
#read.csv.sql is another choice for only importing the data we need
#but the speed shows not much improvement and it produces the warning
#message about closing unused connection

infile<-"household_power_consumption.txt"
#specify colClasses
colTypes<-c(rep("character",2), rep("numeric",6))
df<-read.table(infile, header=T, sep=";", na.strings = "?", colClasses=colTypes)
sub_df<-df[df$Date=='1/2/2007' | df$Date=='2/2/2007',]
sub_df$Time<-strptime(paste(sub_df$Date, sub_df$Time), "%d/%m/%Y %H:%M:%S")

#set the margin left a little larger than default. 
par(mar = c(5, 5, 4, 2))
hist(sub_df$Global_active_power, col="red",yaxt="n", main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")
axis(2,seq(0,1200,200))
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()

