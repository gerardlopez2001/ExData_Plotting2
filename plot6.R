################################################################################
# JHPH
# Exploratory Data Analysis
# Project2
# 2014-11-23
# Gerard Lopez
################################################################################
# Plot 6
################################################################################
# setup load data
# setwd("~/School/JH/04 Exploratory Data Analysis/Projects/Project2/ExData_Plotting2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
################################################################################
# 6.	Compare emissions from motor vehicle sources in Baltimore City with 
# emissions from motor vehicle sources in Los Angeles County, California 
# (fips == "06037"). Which city has seen greater changes over time in motor 
# vehicle emissions?

library(ggplot2)

#check out EI.Sector variable values for motor vehicles
unique(SCC$EI.Sector)

# defining motor vehicle from US attorneys' manual (http://www.justice.gov/usao/eousa/foia_reading_room/usam/title9/crm01303.htm)
#The terms "motor vehicle" and "aircraft" are defined in 18 U.S.C. §  2311. 
# Motor vehicle includes road vehicles, such as automobiles, vans, motorcycles, 
# and trucks, as well as off-road vehicles such as self-propelled construction 
# and farming equipment. 

#I've decided that Mobile & On-Road from the SCC list fit this most closely:

# Mobile - On-Road Gasoline Light Duty Vehicles      
# Mobile - On-Road Gasoline Heavy Duty Vehicles     
# Mobile - On-Road Diesel Light Duty Vehicles        
# Mobile - On-Road Diesel Heavy Duty Vehicles

mvCodes <- subset(SCC,
                  (EI.Sector == "Mobile - On-Road Gasoline Light Duty Vehicles"
                   | EI.Sector == "Mobile - On-Road Gasoline Heavy Duty Vehicles"
                   | EI.Sector == "Mobile - On-Road Diesel Light Duty Vehicles"
                   | EI.Sector == "Mobile - On-Road Diesel Heavy Duty Vehicles"),
                  select = c(SCC))

mvCodes$SCC = as.character(mvCodes$SCC)

t <- subset(NEI, (NEI$SCC %in% c(mvCodes$SCC) 
                  & (NEI$fips == "24510" | NEI$fips == "06037")))

u <- aggregate(t$Emissions, list(Year=t$year, fips=t$fips), FUN=sum, na.rm=TRUE)
u$fips <- factor(u$fips,levels = c("24510", "06037" )
                 , labels = c("Baltimore City", "Los Angeles County") )

g <- ggplot(u, aes(x = u$Year, y = u$x, color = u$fips))

png("plot6.png")
g + geom_line() + labs(x = "Year") + labs(y = expression('PM' [2.5]*" (tons)") ) + labs(title=expression('PM' [2.5]*" Emissions for Motor Vehicle Sources")) + guides(color=guide_legend(title="County"))
dev.off()
################################################################################