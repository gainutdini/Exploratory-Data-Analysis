## Download the zip file
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
## Unzipping the files
unzip(zipfile = "dataFiles.zip")

## Readinf th files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Selecting the Baltimore City
Balt <- NEI[NEI$fips == "24510",]

## Extract data by calculating the sum of Emissions by Years
Balt_em <- aggregate(Emissions~year, Balt, sum)

## Plotting 
plot2 <- with(Balt_em, plot(year, Emissions, type = "l", 
                                xlab="Year", ylab = "Total Emissions", 
                                main="Total Emissions for each year"))
## Saving the copy of the plot to PNG
dev.copy(png, file="plot2.png")
dev.off()
