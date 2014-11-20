################################################################################
# JHPH
# Exploratory Data Analysis
# Project2
# 2014-11-23
# Gerard Lopez
################################################################################
# Plot 3
################################################################################
# setup load data
# setwd("~/School/JH/04 Exploratory Data Analysis/Projects/Project2/ExData_Plotting2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
################################################################################
# 3.	Of the four types of sources indicated by the type (point, nonpoint, 
# onroad, nonroad) variable, which of these four sources have seen decreases in 
# emissions from 1999–2008 for Baltimore City? Which have seen increases in 
# emissions from 1999–2008? Use the ggplot2 plotting system to make a plot 
# answer this question.

library(ggplot2)

a <- subset(NEI, NEI$fips == "24510")
b <- aggregate(a$Emissions, list(Year=a$year, Type =a$type), FUN=sum, na.rm=TRUE)

g <- ggplot(b, aes(x = b$Year, y = b$x, color = b$Type))


png("plot3.png")

g + geom_line() + labs(x = "Year") + labs(y = expression('PM' [2.5]*" (tons)") ) + labs(title=expression('PM' [2.5]*" Emissions for Baltimore City, Maryland")) + guides(color=guide_legend(title="Type"))

dev.off()

################################################################################