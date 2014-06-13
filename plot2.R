# author : Alicia Wang
# date : 13 June 2014
# file : plot2.R
#-------------------------------------------------------

#-------------------------------------------------------
plot2 <- function() {
    LoadData()
    
    selection <- NEI$fips == "24510"
    BAperyear <- tapply(NEI$Emissions[selection], NEI$year[selection], sum, na.rm = TRUE)

    barplot(BAperyear, xlab = "Year", ylab = "Emission",
            main = "Total emissions from PM2.5 in Baltimore City")
    
    dev.copy(png, file = "plot2.png")
    dev.off()
}