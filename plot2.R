NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Bpm <- subset(NEI, fips==24510)
Bbyyear <- aggregate(Bpm$Emissions , by=list(Bpm$year), FUN= sum)

names(Bbyyear)[1] <- "Year"
 names(Bbyyear)[2] <- "Emissions"
 
 

barplot(Bbyyear$Emissions, names.arg=Bbyyear$Year ,xlab = "year", ylab = "pm2.5", main="Total PM2.5 Baltimore City " )

dev.copy(png, file="plot2.png")

dev.off()