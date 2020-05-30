library(dplyr)
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


emissionsByYear <- NEI %>%
  filter(fips == "24510" & type == "ON-ROAD") %>%
  group_by(year) %>%
  summarize(total_emissions = sum(Emissions))


emissionsByYear$year <- as.factor(emissionsByYear$year)


ggplot(emissionsByYear, aes(x=year, y=total_emissions, fill = year)) + geom_bar(stat="identity") + labs(x="Year", y="PM2.5 Emissions (tons)") + ggtitle("Motor Vehicle PM2.5 Emissions in Baltimore City")


dev.copy(png,'plot5.png')
dev.off()
