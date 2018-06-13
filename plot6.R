NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISCC <- merge(NEI, SCC, by="SCC")
vehicleNEISCC <- grepl("vehicle", NEISCC$SCC.Level.Two, ignore.case = TRUE)

vehicletotalNEISCC <- NEISCC[vehicleNEISCC,]

vehicleBA <- vehicletotalNEISCC[vehicletotalNEISCC$fips=="24510",]
vehicleBA$city <- "Baltimore"

vehicleLOS <- vehicletotalNEISCC[vehicletotalNEISCC$fips=="06037",]
vehicleLOS$city <- "Los Angeles"

bothcity <- rbind(vehicleBA, vehicleLOS)

aggregatebothcity <- aggregate(Emissions~year+city+fips, ignore.case=TRUE)

g<- ggplot(aggregatebothcity , aes(factor(year),Emissions, fill=city))
g+geom_bar(aes(fill=year), stat="identity")+facet_grid(.~city)+
labs(title="Emissions from motor vehicle sources in Baltimore and Los Angeles")


dev.copy(png, file="plot6.png")

dev.off()