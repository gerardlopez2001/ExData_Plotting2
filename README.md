# exData_Plotting Project 2

Author: Gerard Lopez

Date: 2014-11-23

Class: JHBSPH - Exploratory Data Analysis

Project: 2  


## Introduction
The data for this assignment are available from the course web site as a single zip file:


•	Data for Peer Assessment[https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip]


The zip file contains two files:

PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year.

*	fips: A five-digit number (represented as a string) indicating the U.S. county
*	SCC: The name of the source as indicated by a digit string (see source code classification table)
*	Pollutant: A string indicating the pollutant
*	Emissions: Amount of PM2.5 emitted, in tons
*	type: The type of source (point, non-point, on-road, or non-road)
*	year: The year of emissions recorded


Source Classification Code Table (Source_Classification_Code.rds): This table provides a mapping from the SCC digit strings int he Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.

## Loading the data


## Generating the plots

plot1.R, plot2.R, plot3.R, plot4.R, plot5.R, and plot6.R all produce the .png files: plot1.png, plot2.png, plot3.png, plot4.png, plot5.png and plot6.png respectively.