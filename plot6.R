library(dplyr)
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


emissionsByYear <- NEI %>%
  filter(fips %in% c("24510", "06037") & type == "ON-ROAD") %>%
  group_by(year, fips) %>%
  summarize(total_emissions = sum(Emissions))


emissionsByYear$year <- as.factor(emissionsByYear$year)
emissionsByYear$county_name <- factor(emissionsByYear$fips, levels=c("06037", "24510"), labels=c("Los Angeles County", "Baltimore City")) 


ggplot(emissionsByYear, aes(x=year, y=total_emissions)) + 
  geom_bar(stat="identity", aes(fill=county_name), position = "dodge") +
  guides(fill=guide_legend(title=NULL)) +
  labs(x="Year", y="PM2.5 Emissions (tons)") +
  ggtitle("Los Angeles County and Baltimore City Vehicle PM2.5 Emissions")


dev.copy(png,'plot6.png')
dev.off()
