################################################################################
# JHPH
# Exploratory Data Analysis
# Project2
# 2014-11-23
# Gerard Lopez
################################################################################
# Plot 1
################################################################################
# setup load data
# setwd("~/School/JH/04 Exploratory Data Analysis/Projects/Project2/ExData_Plotting2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
################################################################################
# 1.    Have total emissions from PM2.5 decreased in the United States from 1999
# to 2008? Using the base plotting system, make a plot showing the total PM2.5 
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.

x <- aggregate(NEI$Emissions, list(Year=NEI$year), sum, na.rm=TRUE)

#change scientific notation threshold
options(scipen=2)

png("plot1.png")
plot(x$Year, x$x
     ,type = "l"
     , xlab= "Year", ylab = "PM2.5 (tons)"
     , main = "Total emissions from PM2.5 by year")

dev.off()
################################################################################
