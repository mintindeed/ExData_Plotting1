# Load power data is abstracted into a separate script to reduce code duplication
source("loadData.R")

if ( ! exists("plot1.png") ) {
    png( "plot1.png" )
    hist( hpc$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)" )
    dev.off()
}
