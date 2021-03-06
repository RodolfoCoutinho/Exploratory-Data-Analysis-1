#read data from a file, plot a graphic using base plot and create a png file with the plot
plot4<-function(){
  
  #read a csv file, with first line as column names and '?' as NA
  arq<-read.csv("household_power_consumption.txt",header = TRUE,sep=";",na.strings="?")
  
  #transform date column from string to date
  arq$Date<-as.Date(arq$Date,"%d/%m/%Y")
  
  #filter for a spcecif period 
  arq<-subset(arq,arq$Date>=as.Date("2007-02-01") & arq$Date<=as.Date("2007-02-02"))
  
  #transform the date and time columns from string to a timestamp
  date_time_string<-paste0(arq$Date," ",arq$Time)
  date_time<-as.POSIXct(strptime(date_time_string, "%Y-%m-%d %H:%M:%S"))
  
  
  #open the plot device, plot the data and close the device, creating a png file
  png("plot4.png",width=480,height=480)
    
    #set the plot area as a 2x2 panel
    par(mfrow=c(2,2))
  
    plot(date_time, arq$Global_active_power,ylab="Global Active Power",xlab="", type="l")
  
    plot(date_time, arq$Voltage, ylab="Voltage",xlab="datetime",type="l")
  
    plot(date_time, arq$Sub_metering_1,ylab="Energy sub metering",xlab="", type="l",col="black")
      lines(date_time, arq$Sub_metering_2,col="red")
      lines(date_time, arq$Sub_metering_3,col="blue")
      legend('topright', legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty=c(1,1),bty="n")
    
    plot(date_time, arq$Global_reactive_power, ylab="Global_reactive_power",xlab="datetime",type="l")
  
  dev.off()
  
}