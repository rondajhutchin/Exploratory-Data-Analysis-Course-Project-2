library(dplyr)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


emissionsByYear <- NEI %>%
  group_by(year) %>%
  summarize(total_emissions = sum(Emissions))


with(emissionsByYear, barplot(total_emissions, names.arg = year, xlab = "Year", ylab = "PM2.5 Emissions (tons)", main = "Total PM2.5 Emissions from All Sources"), col = cols)


dev.copy(png,'plot1.png')
dev.off()
