# author : Alicia Wang
# date : 12 June 2014
# file : plot1.R
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
    if ( is.null(SCC) ) { SCC <<- readRDS(fnameSCC) }
}
#--------------------------------------------------
plot1 <- function() {
    LoadData()
    totalemiperyear <- tapply(NEI$Emissions, NEI$year, sum, na.rm = TRUE)
    totalemiperyear
}