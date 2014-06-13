# author : Alicia Wang
# date : 13 June 2014
# file : plot4.R
#-------------------------------------------------------
library(ggplot2)

#-------------------------------------------------------
plot4 <- function() {
    LoadData()
    
    NEI$type <<- as.factor(NEI$type)
    NEI$year <<- as.factor(NEI$year)
    
    # For coal combustion-related sources I filtered SCC.Level.One for "Combustion" and EI.Sector for "Coal" 
    selectSCC <- grepl("Coal", SCC$EI.Sector) & grepl("Combustion", SCC$SCC.Level.One)
    SCCID <- SCC$SCC[selectSCC]

    selection <- is.element(NEI$SCC, SCCID)
    CoalComb <- NEI[selection, ]
#    q <- qplot(year, Emissions, data = CoalComb, stat = "identity", geom = "bar", ylab = "Emission")
#    print(q)
     b <- tapply(CoalComb$Emissions, CoalComb$year, sum, na.rm = TRUE)
     barplot(b)
    
    
    dev.copy(png, file = "plot4.png")
    dev.off()
}