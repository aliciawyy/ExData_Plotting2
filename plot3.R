# author : Alicia Wang
# date : 13 June 2014
# file : plot3.R
#-------------------------------------------------------
library(ggplot2)

#-------------------------------------------------------
plot3 <- function() {
    LoadData()

    NEI$type <<- as.factor(NEI$type)
    NEI$year <<- as.factor(NEI$year)
    selection <- NEI$fips == "24510"
#    Nsmall <- NEI[sample(nrow(NEI), 1000), ]
    BA <- NEI[selection, ]
    q <- qplot(year, Emissions, data = BA, facets = type ~., stat = "identity", geom = "bar", ylab = "Emission")
    print(q)
    
    dev.copy(png, file = "plot3.png")
    dev.off()
}