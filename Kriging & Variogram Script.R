library(gstat)  
library(sp)
library(automap)
#install.packages("sf")
#install_github("r-spatial/sf")
library(devtools)
library(sf)
library("mapview") # map plot
library("ggplot2") # plotting
mapviewOptions(fgb = FALSE)
library('raster')

#Variogram and Kriging

station_locations <- read.csv("Station Coordinates (3).csv")

#convert the dataframe to have geological feature which can be plotted.
station_locations2 <- na.omit(station_locations) 

coordinates(station_locations2) <- c("x", "y")

#assign a coordinate system.
proj4string(station_locations2) <- CRS("+init=epsg:2193")
#NAD83 Alaska State Plane Zone8
#http://www.spatialreference.org/ref/epsg/26938/
#projection(data)<-CRS("+init=epsg:4326")
#data.UTM <- spTransform(data, CRS("+init=epsg:4326"))
#writeOGR(data.ll, "data.kml", "data", "KML")
#show data point
# create a bubble plot with the random values
bubble(station_locations2, zcol='Precipitation', fill=TRUE, do.sqrt=FALSE, maxsize=3)
plot(station_locations2,asp=1,cex=4*station_locations2$Precipitation/max(station_locations2$Precipitation),pch = 1)
plot(station_locations2,asp=1,pch=1,col="red")

n <-length(station_locations2$Precipitation)
n*(n-1)/2


#Create a variogram
v<-variogram(Precipitation~1,station_locations2,width=2000) 
vm<-vgm(psill=2, model="Sph", range=100, nugget=30)
print(plot(v))
options(warn = -1) # don't print warnings
v.fit = fit.variogram(v, vgm(1, "Sph"))
fit = fit.variogram(v, vgm(c("Sph")))
fit
print(plot(v,pl=F,model=fit, main=("Variogram for Spatial Interpolation of Precipitation data EXP 1000m")))



##########################################################################################################################
#### Create kriging interpolation################
#create bounding box around the points
bbox <- st_bbox(station_locations2)

stl_grid_df <- station_locations2 %>% 
  st_bbox() %>%     # determines bounding box coordinates from meuse
  st_as_sfc() %>%   # creates sfc object from bounding box
  st_make_grid(
    cellsize = c(50, 50), # 50 x 50 pixel size
    what = "centers") %>%
  st_coordinates() %>%
  data.frame()

meuse_grid <- st_as_sf(stl_grid_df, coords=c("X","Y"), crs=st_crs((station_locations2), remove=F))

# create sample variogram
#kr.v <- variogram(Precipitation ~ 1, station_locations2,width=5000)

# fit variogram model
#vfit <- fit.variogram(kr.v, vgm(1, "Exp", 1000, 1))

# Convert meuse samples to SpatialPointsDataFrame
meuse_sp <- as(station_locations2, "Spatial")

# Convert meuse grid to SpatialPixelsDataFrame, the raster/grid equivalent in 
# in the sp world
meuse_grid_sp <- as(as(meuse_grid, "Spatial"), "SpatialPixels")
# ordinary kriging
#lz.ok <- krige(Precipitation~ 1, station_locations2, meuse_grid_sp, vfit)
## [using ordinary kriging]
# mapview(lz.ok, zcol='var1.pred') # + mapview(meuse, zcol='zinc')
#plot(lz.ok['var1.pred'])
#points(station_locations2, col="white", cex=1)

#plot(meuse_grid)
#saveRDS(lz.ok, file="anything.rds")

#############################################################################################################
##################### kriging test 2 ######################################
PbSph <- krige(Precipitation~1, station_locations2, meuse_grid_sp, model = fit)
## [using ordinary kriging]
spplot(PbSph,"var1.pred")

m2000kriging <- raster(PbSph)
proj4string(m2000kriging) <- CRS("+init=epsg:2193")

writeRaster(m2000kriging,'2000mkrigingshp.tif',options=c('TFW=YES'))                      


PbVar <- autofitVariogram(Precipitation~1,station_locations2,model = c( "Exp"))
plot(PbVar, plot.numbers=F)     

PbKrig <- autoKrige(Precipitation~1,  station_locations2, meuse_grid_sp,model = c( "Sph"))
plot(PbKrig)
summary(PbKrig)
