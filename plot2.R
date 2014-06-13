# author : Alicia Wang
# date : 13 June 2014
# file : plot2.R
#-------------------------------------------------------

#-------------------------------------------------------
plot2 <- function() {
    LoadData()
    selection <- NEI$fips == 24510
    BAperyear <- tapply(NEI$Emissions[selection], NEI$year[selection], sum, na.rm = TRUE)
    BAperyear
    barplot(BAperyear)
    
    dev.copy(png, file = "plot2.png")
    dev.off()
}