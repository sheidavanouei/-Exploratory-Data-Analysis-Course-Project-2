NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore <- subset(NEI , fips==24510)

Baltimorebyyear <- aggregate(Emissions ~ year + type, Baltimore, FUN=sum)

ggplot(Baltimorebyyear,aes(factor(year),Emissions,fill=type , alpha=1/3)) +
           geom_bar(stat = "identity") +
           facet_grid(.~type)+
labs(x="year", y="Total PM2.5 Emission")+
       
         labs(title="PM2.5 Emissions Baltimore City 1999-2008 by source type")

dev.copy(png, file="plot3.png")

dev.off()