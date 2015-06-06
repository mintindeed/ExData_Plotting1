# Load power data is abstracted into a separate script to reduce code duplication
source("loadData.R")

if ( ! exists("plot4.png") ) {
    png( "plot4.png" )

    # Prep a 4x4 chart area
    par( mfrow = c( 2, 2 ) )

    # Chart 1 - top left, similar to plot 2
    plot(hpc$datetime, hpc$Global_active_power, ylab = "Global Active Power", xlab="", type="l")

    # Chart 2 - top right
    plot(hpc$datetime, hpc$Voltage, ylab = "Voltage", xlab="datetime", type="l")

    # Chart 3 - bottom left, similar to plot 3
    plot( hpc$datetime, hpc$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l" )
    lines( hpc$datetime, hpc$Sub_metering_2, col = "red" )
    lines( hpc$datetime, hpc$Sub_metering_3, col = "blue" )
    legend( "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = "solid", bty = "n" )

    # Chart 4 - bottom right
    plot(hpc$datetime, hpc$Global_reactive_power, ylab = "Global_reactive_power", xlab="datetime", type="l")


    dev.off()
}
