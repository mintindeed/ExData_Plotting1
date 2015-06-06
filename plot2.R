# Load power data is abstracted into a separate script to reduce code duplication
source("loadData.R")

if ( ! exists("plot2.png") ) {
    png( "plot2.png" )
    plot(hpc$datetime, hpc$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab="", type="l")
    dev.off()
}
