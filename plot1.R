#read data from a file, plot a graphic using base plot and create a png file with the plot
plot1<-function(){
  
  #read a csv file, with first line as column names and '?' as NA
  arq<-read.csv("household_power_consumption.txt",header = TRUE,sep=";",na.strings="?")
  
  #transform date column from string to date
  arq$Date<-as.Date(arq$Date,"%d/%m/%Y")
  
  #filter for a spcecif period 
  arq<-subset(arq,arq$Date>=as.Date("2007-02-01") & arq$Date<=as.Date("2007-02-02"))

  #open the plot device, plot the data and close the device, creating a png file
  png("plot1.png",width=480,height=480)
    hist(arq$Global_active_power,col="Red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
  dev.off()

}