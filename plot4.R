
## household_power_consumption.txt is located in the working directory

## Read in the data

plot4 <- 'egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'
consumption <- read.table(pipe(plot4), header=T, sep=";")

## Paste date and time and coerce them into POSIXlt

date_list <- as.character(consumption$Date)
time_list <- as.character(consumption$Time)
Time_list <- paste(date_list, time_list)
Time_as_date <- strptime(Time_list, "%d/%m/%Y %H:%M:%S")

## create a df contains time and required data for plotting
df <- data.frame(Time_as_date, consumption[,c(3, 4, 5, 7, 8, 9)])

## Create 4 seperate plots on the same screen device
par(mfrow = c(2, 2), 
    mar = c(4, 4, 0.5, 1), 
    ps = 12, 
    cex = 1, 
    cex.axis = 0.85,
    cex.lab = 0.85)
## plot1
plot(df$Time_as_date, df$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power")
## plot2
plot(df$Time_as_date, df$Voltage, 
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")
## plot3
plot(df$Time_as_date, df$Sub_metering_1, 
     type = "l", 
     col = "black", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(df$Time_as_date, df$Sub_metering_2, 
      type = "l", 
      col = "red")
lines(df$Time_as_date, df$Sub_metering_3, 
      type = "l", 
      col = "blue")
legend("topright", lty = 1, col=c("black", "red", "blue"),
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       bty = "n",
       cex = 0.6)
## plot4
plot(df$Time_as_date, df$Global_reactive_power, 
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

## Copy the plot to PNG file 480 pixels x 480 pixels

dev.copy(png, file = "plot4.png", width = 480, height = 480)

## Close the device

dev.off()