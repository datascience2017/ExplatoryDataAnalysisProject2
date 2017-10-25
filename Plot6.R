
#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
#vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater 
#changes over time in motor vehicle emissions?

library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC_Subset_MotorVehicle <- SCC[grep("[Vv]ehicles",SCC$EI.Sector),1]

year <- as.factor(SCC_Subset_MotorVehicle$year)
Sources_MotorVehicle <- NEI[NEI$SCC %in% SCC_Subset_MotorVehicle,]
Sources_MotorVehicle_Baltimore <- filter(Sources_MotorVehicle, Sources_MotorVehicle$fips=="24510")
Sources_MotorVehicle_LA <- filter(Sources_MotorVehicle, Sources_MotorVehicle$fips=="06037")

#get a summary of emissions by year
Emissions_Agg_Year_Baltimore <- Sources_MotorVehicle_Baltimore %>% group_by(year) %>% summarize(sum(Emissions))
Emissions_Agg_Year_LA <- Sources_MotorVehicle_LA %>% group_by(year) %>% summarize(sum(Emissions))


#creating plot
png("Plot6.png", width=480, height=480)
par(mfrow = c(1,2)) 
plot(Emissions_Agg_Year_Baltimore$year,Emissions_Agg_Year_Baltimore$'sum(Emissions)', 
     type="l", col="blue", lwd=5, xlab="Year", ylab="Emissions",  
     main = expression("Vehicle Emissions-Baltimore"))

plot(Emissions_Agg_Year_LA$year,Emissions_Agg_Year_LA$'sum(Emissions)', 
     type="l", col="red", lwd=5, xlab="Year", ylab="Emissions",
     main = expression("Vehicle Emissions Los Angeles"))
dev.off()