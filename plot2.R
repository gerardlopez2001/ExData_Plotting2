################################################################################
# JHPH
# Exploratory Data Analysis
# Project2
# 2014-11-23
# Gerard Lopez
################################################################################
# Plot 2
################################################################################
# setup load data
# setwd("~/School/JH/04 Exploratory Data Analysis/Projects/Project2/ExData_Plotting2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
################################################################################
# 2.	Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
# plot answering this question.
###
y <- subset(NEI, NEI$fips == "24510")
z <- aggregate(y$Emissions, list(Year=y$year), FUN=sum, na.rm=TRUE)

png("plot2.png")
plot(z$Year, z$x
     ,type = "l"
     , xlab= "Year", ylab = "PM2.5 (tons)"
     , main = "Total emissions from PM2.5 by year for Baltimore City, Maryland")

dev.off()

################################################################################
