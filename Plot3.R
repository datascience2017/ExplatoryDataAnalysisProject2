# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

library("dplyr")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")       
NEI_Baltimore1 <- filter(NEI, NEI$fips=="24510")
png("Plot3.png", width=480, height=480)
ggplot(data=NEI_Baltimore1,aes(x = year, y =Emissions, fill=type))+
  geom_bar(stat="identity")+
  facet_grid(.~type)+
  labs(x="Year", y=" Emissions", main = expression("Baltimore " * PM[2.5] * " Emissions - All Sources"))
dev.off()
