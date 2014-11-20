# Project2
# plot 4
# setup load data
# setwd("~/School/JH/04 Exploratory Data Analysis/Projects/Project2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


##########################################################################################
# 1.    Have total emissions from PM2.5 decreased in the United States from 1999
# to 2008? Using the base plotting system, make a plot showing the total PM2.5 
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.

x <- aggregate(NEI$Emissions, by=list(NEI$year), sum)
y <- x$Group.1

png("plot1.png")
format(x$x, scientific =FALSE)
plot(x$Group.1, x$x, axes = F, xlab= NA, ylab = NA, main = "Total emissions by year")
axis(1,at=c(1999,2002,2005,2008), labels=c("1999","2002","2005","2008"))
# axis(2,at=c(7332967,5635780,5454703,3464206), labels=c("7332967","5635780","5454703","3464206"))
# axis(2,at=c(7500000,5000000,2500000,0), labels=c("7500000","5000000","2500000","0"))
axis(2, axTicks(2), format(axTicks(2), scientific = F))

boxplot(x$x, main = "Total emissions by year")


plot(x$Group.1, x$x, main = "Total emissions by year")
with(subset(NEI, year == 1999), points())


dev.off()


##########################################################################################
# 4.	Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?
png("plot4.png")

dev.off()


##########################################################################################