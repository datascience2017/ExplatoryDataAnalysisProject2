# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?


library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC_Subset_MotorVehicle <- SCC[grep("[Vv]ehicles",SCC$EI.Sector),1]
View(SCC_Subset_MotorVehicle)
year <- as.factor(SCC_Subset_MotorVehicle$year)
Sources_MotorVehicle <- NEI[NEI$SCC %in% SCC_Subset_MotorVehicle,]
Sources_MotorVehicle_Baltimore<- filter(Sources_MotorVehicle, Sources_MotorVehicle$fips=="24510")

#get a summary of emissions by year
Emissions_Agg_Year_Baltimore <- Sources_MotorVehicle_Baltimore %>% group_by(year) %>% summarize(sum(Emissions))

#creating plot
png("Plot5.png", width=480, height=480)
plot(Emissions_Agg_Year$year,Emissions_Agg_Year$'sum(Emissions)', 
     type="l", col="blue", lwd=5, xlab="Year", ylab="Emissions",  
     main = expression( "Emissions by Motor Vehicles in Baltimore City"))
dev.off()