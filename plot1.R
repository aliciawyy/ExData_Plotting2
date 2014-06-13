# author : Alicia Wang
# date : 12 June 2014
# file : plot1.R
#-------------------------------------------------------

#-------------------------------------------------------
plot1 <- function() {
    LoadData()
    totalemiperyear <- tapply(NEI$Emissions, NEI$year, sum, na.rm = TRUE)
    totalemiperyear
    barplot(totalemiperyear)
    
    dev.copy(png, file = "plot1.png")
    dev.off()
}