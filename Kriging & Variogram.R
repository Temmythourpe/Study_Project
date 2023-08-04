getwd()
setwd()

#INSTALL PACKAGES
install.packages("ggplot2")
library(ggplot2)

#CALL THE DATA INTO THE SCRIPT
Tribe <- read.csv(file = "Downloads/Intro Practical 1/E09000007_KS101EW.csv")
View(Tribe)
names(Tribe)[2] <- "Year"
names(Tribe)
names(Tribe)[2] <- "date"
names(Tribe)

#SELECTING SPECIFIC COLUMNS ONLY.. THIS WILL DELETE OTHER VARIABLES IN THE DATA
Tribe <- Tribe[,c(2,4)]
Tribe

Rooms <- read.csv(file = "Downloads/Intro Practical 1/E09000007_KS102EW.csv")
View(Rooms)
Rooms <- Rooms[,c(2,5)]
View(Rooms)

#MERGE DATASETS
Mergedata <- merge(Tribe,Rooms,by = "date")
Mergedata

plot(seq(100))
Bish <- seq(100)
Avg_temp <- c(43.4,54.2,87.2,11.9,37.2,84.6,85.7,89.4)
plot(Avg_temp) 
plot(Avg_temp, pch = 2, cex = .9, col = "orange")
boxplot(Avg_temp)
install.packages("raster")
library(raster)
Germany <- getData("GADM", country = "DEU", level = 2)
plot(Germany)
Nigeria <- getData("GADM", country = "NGA", level = 2)
plot(Nigeria)
summary(Nigeria)

prec <- getData("worldclim", var = "prec", res = 2.5) 
plot(prec)
prec_nga_1 <- crop(prec, Nigeria)
spplot(prec_nga_1)
prec_nga_2 <- mask(prec_nga_1, Nigeria)
spplot(prec_nga_2)

# ASSIGNMENT
# ZIMBABWE ... World Climate  
Zimbabwe <- getData("GADM", country = "ZWE", level = 2)
plot(Zimbabwe)
summary(Zimbabwe)
head(Zimbabwe)
names(Zimbabwe)
View(Zimbabwe)
library(raster)

# Data for Min_Temp for Zimbabwe

Temp_min <- getData("worldclim", var = "tmin", res = 2.5) #Downloads the Min. Temp over Zimbabwe from Worldclim
plot(Temp_min)
summary(Temp_min)
Temp_min_1 <- crop(Temp_min , Zimbabwe)
Temp_min_2 <- mask(Temp_min_1, Zimbabwe)
spplot(Temp_min_2)

# Data for Max_Temp for Zimbabwe

Temp_max <- getData("worldclim", var = "tmax", res = 2.5) #Downloads the Max. Temp over Zimbabwe from Worldclim
plot(Temp_max)
summary(Temp_max)
Temp_max_1 <- crop(Temp_max, Zimbabwe)
Temp_max_2 <- mask(Temp_max_1, Zimbabwe)
spplot(Temp_max_2)

# Data for Avg_Temp for Zimbabwe

Temp_avg <- getData("worldclim", var = "tmean", res = 2.5) #Downloads the Max. Temp over Zimbabwe from Worldclim
plot(Temp_avg)
summary(Temp_avg)
Temp_avg_1 <- crop(Temp_avg, Zimbabwe)
Temp_avg_2 <- mask(Temp_avg_1, Zimbabwe)
spplot(Temp_avg_2)

  
# Data for Min_Temp for Germany
  
Temp_min <- getData("worldclim", var = "tmin", res = 2.5) #Downloads the Min. Temp over Germany from Worldclim
plot(Temp_min)
summary(Temp_min)
Temp_min_1 <- crop(Temp_min , Germany)
Temp_min_2 <- mask(Temp_min_1, Germany)
spplot(Temp_min_2)

# Data for Max_Temp for Germany

Temp_max <- getData("worldclim", var = "tmax", res = 0.5, lon = 11, lat = 52) #Downloads the Max. Temp over Germany from Worldclim
plot(Temp_max)
summary(Temp_max)
Temp_max_1 <- crop(Temp_max, Germany)
Temp_max_2 <- mask(Temp_max_1, Germany)
spplot(Temp_max_2)

# Data for Avg_Temp for Germany

Temp_avg <- getData("worldclim", var = "tmean", res = 0.5, lon = 11, lat = 52) #Downloads the Max. Temp over Germany from Worldclim
plot(Temp_avg)
summary(Temp_avg)
Temp_avg_1 <- crop(Temp_avg, Germany)
Temp_avg_2 <- mask(Temp_avg_1, Germany)
spplot(Temp_avg_2)

# Data for Min_Temp for Brazil
Brazil <- getData("GADM", country = "BRA", level = 2)
b_tmin <- getData("worldclim", var = "tmin", res = 2.5) #Downloads the Min. Temp over Brazil from Worldclim
plot(b_tmin)
summary(b_tmin)
b_tmin_1 <- crop(b_tmin, Brazil)
b_tmin_2 <- mask(b_tmin_1, Brazil)
spplot(b_tmin_2)

# Data for Max_Temp for Germany

Temp_max <- getData("worldclim", var = "tmax", res = 0.5, lon = 52, lat = 11) #Downloads the Max. Temp over Germany from Worldclim
plot(Temp_max)
summary(Temp_max)
Temp_max_1 <- crop(Temp_max, Germany)
Temp_max_2 <- mask(Temp_max_1, Germany)
spplot(Temp_max_2)

# Data for Avg_Temp for Germany

Temp_avg <- getData("worldclim", var = "tmean", res = 0.5, lon = 11, lat = 52) #Downloads the Max. Temp over Germany from Worldclim
plot(Temp_avg)
summary(Temp_avg)
Temp_avg_1 <- crop(Temp_avg, Germany)
Temp_avg_2 <- mask(Temp_avg_1, Germany)
spplot(Temp_avg_2)

install.packages("fun")
library(fun)
mine_sweeper()
gomoku()
prec <- getData("worldclim", var = "prec", res = 2.5)
prec_ger_1 <- crop(prec, germany)
library(raster)
prec <-  getData("worldclim", var = "prec" res = 2.5)
getwd()
setwd(/download.file)
setwd()
getwd("/Users/deyemi/Downloads/")
setwd("/Users/deyemi/Downloads/")
ls
ls()
Design_Storm <- read.csv(file = "rain_dw.csv")
summary(Design_Storm)
head(Design_Storm)
View(Design_Storm)
library(fun)
mine_sweeper()
www.earthobservatory.nasa.gov
getwd()
setwd()
read.csv(file = "rain_dw.csv")
Prep <- read.csv(file = "rain_dw.csv")
summary(Prep)
head(Prep)
plot(Prep)
install.packages("xlsx")
library(xlsx)
install.packages("rJava")
library(rJava)
getwd()
