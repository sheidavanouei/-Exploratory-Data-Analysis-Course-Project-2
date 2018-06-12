NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISCC <- merge(NEI, SCC, by="SCC")

coalNEISCC <- grepl("coal", NEISCC$Short.Name , ignore.case= TRUE)
aggregatecoal <- aggregate(Emissions ~year , coalNEISCC, sum)


names(aggregatecoal)[1] <- "year"
names(aggregatecoal)[2]<- "Emissions"

g<- ggplot(aggregatecoal, aes(factor(year),Emissions))
g+geom_bar(stat = "identity")+
        xlab("year") +
        ylab(expression("Total PM2.5 Emissions")) +
        ggtitle("Total Emissions from coal sources from 1999 to 2008") 

dev.copy(png, file="plot4.png")

dev.off()