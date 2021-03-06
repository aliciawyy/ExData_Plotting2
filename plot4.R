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
     barplot(b, xlab = "Year", ylab = "Emission")
    
    
    dev.copy(png, file = "plot4.png")
    dev.off()
}

#-------------------------------------------------------
plot5 <- function() {
    LoadData()
    
    NEI$type <<- as.factor(NEI$type)
    NEI$year <<- as.factor(NEI$year)
    
    # Motorcycles : On-road 2- and 3-wheeled vehicles, mopeds, and scooters
    # ref. http://www.epa.gov/otaq/standards/basicinfo.htm
    selectSCC <- grepl("On-Road", SCC$EI.Sector)
    SCCID <- SCC$SCC[selectSCC]
    
    selection <- is.element(NEI$SCC, SCCID) & NEI$fips == "24510"
    MotorC <- NEI[selection, ]
    #    q <- qplot(year, Emissions, data = CoalComb, stat = "identity", geom = "bar", ylab = "Emission")
    #    print(q)
    b <- tapply(MotorC$Emissions, MotorC$year, sum, na.rm = TRUE)
    barplot(b, xlab = "Year", ylab = "Emission")
    
    
    dev.copy(png, file = "plot5.png")
    dev.off()
}

#-------------------------------------------------------
plot6 <- function() {
    LoadData()
    
    NEI$type <<- as.factor(NEI$type)
    NEI$year <<- as.factor(NEI$year)
    
    # Motorcycles : On-road 2- and 3-wheeled vehicles, mopeds, and scooters
    # ref. http://www.epa.gov/otaq/standards/basicinfo.htm
    selectSCC <- grepl("On-Road", SCC$EI.Sector)
    SCCID <- SCC$SCC[selectSCC]
    
    par(mfrow = c(1,2))
    
    selection <- is.element(NEI$SCC, SCCID) & NEI$fips == "24510"
    MotorC <- NEI[selection, ]
    b1 <- tapply(MotorC$Emissions, MotorC$year, sum, na.rm = TRUE)
    barplot(b1, main = "Baltimore", xlab = "Year", ylab = "Emission" )
    selection2 <- is.element(NEI$SCC, SCCID) & NEI$fips == "06037"
    MotorC2 <- NEI[selection2, ]
    b2 <- tapply(MotorC2$Emissions, MotorC2$year, sum, na.rm = TRUE)
    barplot(b2, main = "Los Angeles", xlab = "Year", ylab = "Emission" )
    
    dev.copy(png, file = "plot6.png")
    dev.off()
}