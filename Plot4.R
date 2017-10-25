# Across the United States, how have emissions from coal combustion-related sources changed 
#from 1999-2008?

library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#dim(NEI) # 6497651, 6
#dim(SCC) # 11717, 15
SCC_Subset_Coal <- SCC[grep("[Cc]oal",SCC$Short.Name),1]

Sources_Coal <- NEI[NEI$SCC %in% coalSCC,]
year <- as.factor(Sources_Coal$year)
class(year)
#get a summary of emissions by year
Emissions_Agg_Year <- Sources_Coal %>% group_by(year) %>% summarize(sum(Emissions))
#creating plot
png("Plot4.png", width=480, height=480)
plot(Emissions_Agg_Year$year,Emissions_Agg_Year$'sum(Emissions)', 
     type="l", col="red",lwd = 5, xlab="Year", ylab="Sum of Emissions",  
     main = expression( "Emissions - Coal Combustion Related Sources"))
dev.off()