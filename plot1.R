
## household_power_consumption.txt is located in the working directory

## Read in the data

plot1 <- 'egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'
consumption <- read.table(pipe(plot1), header=T, sep=";")

## Create a histogram of global active power

hist(consumption$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     main = "Global Active Power", col = "red")

## Copy the plot to PNG file 480 pixels x 480 pixels

dev.copy(png, file = "plot1.png", width = 480, height = 480)

## Close the device

dev.off()
