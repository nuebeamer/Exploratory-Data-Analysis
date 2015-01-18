
library(dplyr)
project1<-function(filepath1, date1, date2){
    loaddata <- as.data.frame(read.csv2(filepath1, header=TRUE,sep=";", 
                                        na.strings = "?", skipNul = TRUE, dec="."))

loaddata$Date <- as.Date(loaddata$Date, "%d/%m/%Y")

loaddata$DateTime <- paste(loaddata$Date," ", loaddata$Time)#, format="%d/%m/%Y %H:%M:%S") 
#loaddata$DateTime <- as.POSIXct(as.character(loaddata$DateTime), format="%d/%m/%Y %H:%M:%S") 
#print(max(loaddata$DateTime))

    dataforplot <- filter(loaddata, loaddata$Date >= date1 & loaddata$Date <= date2)
    dataforplot$Global_active_power <- as.numeric(dataforplot$Global_active_power)
    #print(colnames(dataforplot))
    dataforplot$DateTime <- strptime(dataforplot$DateTime, format="%Y-%m-%d %H:%M:%S") 
    print(dataforplot[1:5, ])
# 
# #hist(dataforplot$Global_active_power, freq = TRUE, plot=TRUE, breaks=25, col="red", xlab="Global Active Power(Kilowatts)",main="Global Active Power")
 plot(y=dataforplot$Global_active_power, x=dataforplot$DateTime,type="l", ylab="Global Active Power", xlab="Date")

}

filepath <- "D:/Nanda/R-programming/Exploratory Data Analysis/exdata_data_household_power_consumption/household_power_consumption.txt"

date1 <- "2007-02-01"
date2 <- "2007-02-02"
project1(filepath, date1, date2)
