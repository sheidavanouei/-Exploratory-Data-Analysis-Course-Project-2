NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


NEISCC <- merge(NEI, SCC, by="SCC")
BaltimoreNEISCC <- subset(NEISCC, fips==24510)


vehicleNEISCC <- grepl("vehicle", BaltimoreNEISCC$SCC.Level.Two , ignore.case= TRUE)

vehicleB <- BaltimoreNEISCC[vehicleNEISCC,]

aggregatevehicleB <- aggregate(Emissions~year, vehicleB , sum)

g <- ggplot(aggregatevehicleB, aes(factor(year), Emissions))
g+geom_bar(stat = "identity")+labs(x="year", y="Total PM2.5 Emission") + 
          labs(title="PM2.5 Motor Vehicle Source Emissions in Baltimore from 1999-2008")


dev.copy(png, file="plot5.png")

dev.off()