##Data Science: Exploratory Data Analysis
##Course Project A - Week 1
## "plot2.R"-->"plot2.png"
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

#Transform the Global_active_power (class=factor) into (class=numeric)
##NOTE: In order to do so, first tranform it from (class=factor)-> (class=character) 
  data_pro$Global_active_power<-as.numeric(as.character(data_pro$Global_active_power))

##Create the plot1
  #Process::open the png device, create the plot2 & close the current device
  png("plot2.png", width=480, height=480)
  plot(data_pro$datetime, data_pro$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
  dev.off()
