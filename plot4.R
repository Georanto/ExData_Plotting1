##Data Science: Exploratory Data Analysis
##Course Project A - Week 1
## "plot4.R"-->"plot4.png"
#*******************************
# Assumption:The file "household_power_consumption.txt" is in the working directory

#Read the .txt data file
  data<-read.table("household_power_consumption.txt", header=TRUE,sep=";")

#Convert the variable:"data$Date" to the appropriate Date format "%d/%m/%Y"
  data$Date<-as.Date(data$Date,"%d/%m/%Y") #Now, the class(data$Date) is "Date".

#Extract the selected rows (corresponding to the Dates {2007-02-01,2007-02-02}) to the variable data_pro
  data_pro<-data[data$Date=="2007-02-01" |data$Date=="2007-02-02",]
##Optional: Check for missing values: anyNA(data_pro)

##Determine a variable that combines the information  Date & Time in POSIXlt/POSIXt format  data_pro$datetime<-strptime(paste(as.character(data_pro$Date),as.character(data_pro$Time)), "%Y-%m-%d %H:%M:%S")
  data_pro$datetime<-strptime(paste(as.character(data_pro$Date),as.character(data_pro$Time)), "%Y-%m-%d %H:%M:%S")

##Tranformations##
#For plot(1,1):Transform the Global_active_power (class=factor) into (class=numeric)
  ##NOTE: In order to do so, first tranform it from (class=factor)-> (class=character) 
  data_pro$Global_active_power<-as.numeric(as.character(data_pro$Global_active_power))
  
#For plot(1,2):Transform the Voltage into class=numeric
  data_pro$Voltage<-as.numeric(as.character(data_pro$Voltage))

#For plot(2,1): Transform each Sub_metering_X into (class=numeric)
  #NOTE: Here is OPTIONAL because the Sub_metering_X are already class=numeric) 
  data_pro$Sub_metering_1<-as.numeric(as.character(data_pro$Sub_metering_1))
  data_pro$Sub_metering_2<-as.numeric(as.character(data_pro$Sub_metering_2))
  data_pro$Sub_metering_3<-as.numeric(as.character(data_pro$Sub_metering_3)) 
  
#For plot(2,2): Tranform the Global_reactive_power into (class=numeric)
  data_pro$Global_reactive_power<-as.numeric(as.character(data_pro$Global_reactive_power))
  
##Create the plot4
  #Process::open the png device, create the plot4 & close the current device
  png("plot4.png", width=480, height=480)
  par(mfrow=c(2,2))

##PLOT(1,1):
  plot(data_pro$datetime, data_pro$Global_active_power, xlab="", ylab="Global Active Power", type="l")

##PLOT(1,2):
  plot(data_pro$datetime, data_pro$Voltage, xlab="datetime", ylab="Voltage", type="l")

##PLOT(2,1):
  plot(data_pro$datetime,data_pro$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
  lines(data_pro$datetime,data_pro$Sub_metering_1,col="black",type="l")
  lines(data_pro$datetime,data_pro$Sub_metering_2,col="red",type="l")
  lines(data_pro$datetime,data_pro$Sub_metering_3,col="blue",type="l")
  legend("topright",lwd=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
##PLOT(2,2)
  plot(data_pro$datetime, data_pro$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()
