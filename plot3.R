# Load power data is abstracted into a separate script to reduce code duplication
source("loadData.R")

if ( ! exists("plot3.png") ) {
    png( "plot3.png" )
    plot( hpc$datetime, hpc$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l" )
    lines( hpc$datetime, hpc$Sub_metering_2, col = "red" )
    lines( hpc$datetime, hpc$Sub_metering_3, col = "blue" )
    legend( "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = "solid" )
    dev.off()
}
