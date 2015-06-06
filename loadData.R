setwd(".")
if (!file.exists("data")) {
    dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
urlParts = strsplit( URLdecode(fileUrl), "/" )
fileName <- file.path( "data", urlParts[[1]][length(urlParts[[1]])] )
if (!file.exists(fileName)) {
    download.file(fileUrl, destfile = fileName, method = "curl")
}
dataFile = file.path( "data", "household_power_consumption.txt" )
if ( !file.exists(dataFile) ) {
    unzip( fileName, exdir = "data" )
}

if ( ! exists("hpc") ) {
    hpc = read.csv( dataFile, sep=";", header = FALSE, skip = 66637, nrows = 2880 )
    hpc_headers = read.csv( dataFile, sep=";", header=TRUE, nrows=1)
    names(hpc) = names(hpc_headers)
    hpc[1] = lapply(hpc[1], function(x) as.Date( x, "%d/%m/%Y" ) )
    hpc$datetime = as.POSIXlt( paste(hpc$Date, hpc$Time, sep=" ") )
}
