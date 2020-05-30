library(dplyr)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


emissionsByYear <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year) %>%
  summarize(total_emissions = sum(Emissions))

cols1 <- c("red", "blue", "yellow", "green")

with(emissionsByYear, barplot(total_emissions, names.arg = year, xlab = "Year", ylab = "PM2.5 Emissions (tons)", main = "Total Baltimore City PM2.5 Emissions", col = cols1))


dev.copy(png,'plot2.png')
dev.off()
