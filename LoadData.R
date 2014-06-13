# author : Alicia Wang
# date : 13 June 2014
# file : LoadData.R
#-------------------------------------------------------

##-------------------------------------------------
# Loading data section
##
fnameNEI = "../exdata-data-NEI_data/summarySCC_PM25.rds"
fnameSCC = "../exdata-data-NEI_data/Source_Classification_Code.rds"

NEI <- NULL
SCC <- NULL

ClearData <- function() {
    NEI <<- NULL; SCC <<- NULL
}
LoadData <- function() {
    if ( is.null(NEI) ) { NEI <<- readRDS(fnameNEI) }
    else {
        message("Getting cached NEI data.")
    }
    if ( is.null(SCC) ) { SCC <<- readRDS(fnameSCC) }
    else {
        message("Getting cached SCC data.")
    }
}