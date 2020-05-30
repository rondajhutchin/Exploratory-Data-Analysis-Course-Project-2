library(dplyr)
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


CoalEm <- SCC %>%
  filter(grepl("coal", EI.Sector, ignore.case=TRUE)) %>%
  select(SCC)


emissionsByYear <- NEI %>%
  filter(SCC %in% CoalEm$SCC) %>%
  group_by(year) %>%
  summarize(total_emissions = sum(Emissions))


emissionsByYear$year <- as.factor(emissionsByYear$year)


ggplot(emissionsByYear, aes(x=year, y=total_emissions, fill = year)) + geom_bar(stat="identity") + labs(x="Year", y="PM2.5 Emissions (tons)") + ggtitle("US Coal Combustion-related PM2.5 Emissions from 1999 - 2008")


dev.copy(png,'plot4.png')
dev.off()

