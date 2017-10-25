NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#View(NEI)
#View(SCC)
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008. 

#dim(NEI) # 6497651, 6
#dim(SCC) # 11717, 15
NEI$year <- as.numeric(NEI$year)
NEI_1 <- NEI %>% group_by(year) %>% summarize(sum(Emissions))
png("Plot1.png", width=480, height=480)
plot(NEI_1$year, NEI_1$`sum(Emissions)`, type="l", xlab="Year", ylab="Emissions", main = expression("United States " * PM[2.5] * " Emissions: All Sources"))
dev.off()
