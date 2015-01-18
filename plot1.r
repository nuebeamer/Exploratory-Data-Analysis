
library(dplyr)
project1<-function(filepath1, date1, date2){
    loaddata <- as.data.frame(read.csv2(filepath1, header=TRUE,sep=";", 
                                        na.strings = "?", skipNul = TRUE, dec="."))


    loaddata$Date <- as.Date(loaddata$Date, "%d/%m/%Y")
    dataforplot <- filter(loaddata, loaddata$Date >= date1 & loaddata$Date <= date2)
    #dataforplot <- filter(dataforplot, dataforplot$Global_active_power > 0 )
    dataforplot$Global_active_power <- as.numeric(dataforplot$Global_active_power)


hist(dataforplot$Global_active_power, freq = TRUE, plot=TRUE, breaks=25, col="red", xlab="Global Active Power(Kilowatts)",main="Global Active Power")


}

filepath <- "D:/Nanda/R-programming/Exploratory Data Analysis/exdata_data_household_power_consumption/household_power_consumption.txt"

date1 <- "2007-02-01"
date2 <- "2007-02-02"
project1(filepath, date1, date2)
