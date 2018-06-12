NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Emissionbyyear <- aggregate(NEI$Emissions, by=list(NEI$year), FUN= sum)

names(Emissionbyyear)[1] <- "Year"
names(Emissionbyyear)[2]<- "Emissions"

barplot( Emissionbyyear$Emissions, names.arg= Emissionbyyear$Year , xlab = "year", ylab="pm2.5")


dev.copy(png, file="plot1.png")

dev.off()