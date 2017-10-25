#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
#from 1999 to 2008? Use the base plotting system to make a plot answering this question

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI_Baltimore <- filter(NEI, NEI$fips=="24510")
NEI_Baltimore <- NEI_Baltimore %>% group_by(year) %>% summarize(sum(Emissions))
png("Plot2.png", width=480, height=480)
plot(NEI_Baltimore$year,NEI_Baltimore$'sum(Emissions)', type="l", xlab="Year", ylab="Sum of Emissions",  main = expression("Baltimore " * PM[2.5] * " Emissions - All Sources"))
dev.off()