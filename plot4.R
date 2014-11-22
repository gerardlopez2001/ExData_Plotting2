################################################################################
# JHPH
# Exploratory Data Analysis
# Project2
# 2014-11-23
# Gerard Lopez
################################################################################
# Plot 4
################################################################################
# setup load data
# setwd("~/School/JH/04 Exploratory Data Analysis/Projects/Project2/ExData_Plotting2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
################################################################################
# 4.	Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999-€“2008?

library(ggplot2)

#check out EI.Sector variable values
unique(SCC$EI.Sector)

# only 3 seem to have anything to do with coal.
coalCodes <- subset(SCC,
                    (EI.Sector == "Fuel Comb - Industrial Boilers, ICEs - Coal"
                     | EI.Sector == "Fuel Comb - Electric Generation - Coal"
                     | EI.Sector == "Fuel Comb - Comm/Institutional - Coal"),
                    select = c(SCC))

coalCodes$SCC = as.character(coalCodes$SCC)

k <- subset(NEI, NEI$SCC %in% c(coalCodes$SCC))
l <- aggregate(k$Emissions, list(Year=k$year), FUN=sum, na.rm=TRUE)

g <- ggplot(l, aes(x = l$Year, y = l$x))

png("plot4.png")

g + geom_line() + labs(x = "Year") + labs(y = expression('PM' [2.5]*" (tons)") ) + labs(title=expression('PM' [2.5]*" Emissions for Coal Combustion-Related Sources"))

dev.off()


################################################################################
