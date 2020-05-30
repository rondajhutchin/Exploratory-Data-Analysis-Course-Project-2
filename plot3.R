library(dplyr)
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


emissionsByYear <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year, type) %>%
  summarize(total_emissions = sum(Emissions))


emissionsByYear$year <- as.factor(emissionsByYear$year)


ggplot(emissionsByYear, aes(x=year, y=total_emissions, color = type)) + geom_bar(stat="identity") + facet_grid(. ~ type) + labs(x="Year", y="PM2.5 Emissions (tons)") + ggtitle("Baltimore City PM2.5 Emissions by Type")


dev.copy(png,'plot3.png')
dev.off()

