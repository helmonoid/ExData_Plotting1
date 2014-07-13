
## household_power_consumption.txt is located in the working directory

## Read in the data

plot2 <- 'egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'
consumption <- read.table(pipe(plot2), header=T, sep=";")

## Paste date and time and coerce them into POSIXlt

date_list <- as.character(consumption$Date)
time_list <- as.character(consumption$Time)
Time_list <- paste(date_list, time_list)
Time_as_date <- strptime(Time_list, "%d/%m/%Y %H:%M:%S")

## Create a df contains the time and gap data only
Global_active_power <- consumption$Global_active_power
df <- data.frame(Time_as_date, Global_active_power)

## Create a plot of global active power

plot(df$Time_as_date, df$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

## Copy the plot to PNG file 480 pixels x 480 pixels

dev.copy(png, file = "plot2.png", width = 480, height = 480)

## Close the device

dev.off()