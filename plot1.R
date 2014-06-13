# author : Alicia Wang
# date : 12 June 2014
# file : plot1.R
#-------------------------------------------------------

#-------------------------------------------------------
plot1 <- function() {
    LoadData()
    totalemiperyear <- tapply(NEI$Emissions, NEI$year, sum, na.rm = TRUE)
    
    par(mfrow = c(1, 1))
    barplot(totalemiperyear, xlab = "Year", ylab = "Emission",
            main = "Total emissions from PM2.5 in the United States")
    
    dev.copy(png, file = "plot1.png")
    dev.off()
}