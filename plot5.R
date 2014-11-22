################################################################################
# JHPH
# Exploratory Data Analysis
# Project2
# 2014-11-23
# Gerard Lopez
################################################################################
# Plot 5
################################################################################
# setup load data
# setwd("~/School/JH/04 Exploratory Data Analysis/Projects/Project2/ExData_Plotting2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
################################################################################
# 5.	How have emissions from motor vehicle sources changed from 1999â€“2008 in 
# Baltimore City?

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

r <- subset(NEI, (NEI$SCC %in% c(mvCodes$SCC) & NEI$fips == "24510"))

s <- aggregate(r$Emissions, list(Year=r$year), FUN=sum, na.rm=TRUE)

g <- ggplot(s, aes(x = s$Year, y = s$x))


png("plot5.png")
g + geom_line() + labs(x = "Year") + labs(y = expression('PM' [2.5]*" (tons)") ) + labs(title=expression('PM' [2.5]*" Emissions for Motor Vehicle Sources in Baltimore City"))
dev.off()

################################################################################
