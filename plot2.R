## Read the database and asign it to a variable.
power <- read.table("~/DataScienceSpecialization/4ExploratoryDataAnalysis/household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, head = TRUE)

##Subset data needer for plotting 
epower <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

##Paste Date and Time variables in Date column, and change it to Date/Time classes.
epower$Date <- paste(epower$Date, epower$Time)
epower$Date <- strptime(epower$Date, format = "%d/%m/%Y %H:%M:%S")

##Change variables to numeric. 
epower$Global_active_power <- as.numeric(epower$Global_active_power)
epower$Sub_metering_1 <- as.numeric(epower$Sub_metering_1)
epower$Sub_metering_2 <- as.numeric(epower$Sub_metering_2)

##PLOT 2 
png("plot2.png", width = 480, height = 480, units = "px")
with (epower,plot(Date, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()
