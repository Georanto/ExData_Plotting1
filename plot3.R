##Data Science: Exploratory Data Analysis
##Course Project A - Week 1
## "plot3.R"-->"plot3.png"
#*******************************
# Assumption:The file "household_power_consumption.txt" is in the working directory

#Read the .txt data file
  data<-read.table("household_power_consumption.txt", header=TRUE,sep=";")

#Convert the variable:"data$Date" to the appropriate Date format "%d/%m/%Y"
  data$Date<-as.Date(data$Date,"%d/%m/%Y") #Now, the class(data$Date) is "Date".

#Extract the selected rows (corresponding to the Dates {2007-02-01,2007-02-02}) to the variable data_pro
  data_pro<-data[data$Date=="2007-02-01" |data$Date=="2007-02-02",]
##Optional: Check for missing values: anyNA(data_pro)

##Determine a variable that combines the information  Date & Time in POSIXlt/POSIXt format "%Y-%m-%d %H:%M:%S"
  data_pro$datetime<-strptime(paste(as.character(data_pro$Date),as.character(data_pro$Time)), "%Y-%m-%d %H:%M:%S")

#Transform each Sub_metering_X into (class=numeric)
##NOTE: Here is OPTIONAL because the Sub_metering_X are already class=numeric) 
  data_pro$Sub_metering_1<-as.numeric(as.character(data_pro$Sub_metering_1))
  data_pro$Sub_metering_2<-as.numeric(as.character(data_pro$Sub_metering_2))
  data_pro$Sub_metering_3<-as.numeric(as.character(data_pro$Sub_metering_3)) 


##Create the plot1
  #Process::open the png device, create the plot3 & close the current device
  png("plot3.png", width=480, height=480)
  plot(data_pro$datetime,data_pro$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
  lines(data_pro$datetime,data_pro$Sub_metering_1,col="black",type="l")
  lines(data_pro$datetime,data_pro$Sub_metering_2,col="red",type="l")
  lines(data_pro$datetime,data_pro$Sub_metering_3,col="blue",type="l")
  legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()