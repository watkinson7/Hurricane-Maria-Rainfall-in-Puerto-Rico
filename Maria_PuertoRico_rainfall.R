library(maps)
library(ncdf4)
library(ncdf4.helpers)
library(colorRamps)
# Load Data ---------------------------------------------------------------
#Load Precipitation Data for September 20, 2017 in Puerto Rico
imerg20 <- nc_open("~/R/MEES708X/HW3/IMERG.20170920.nc")
#Load Precipitation Data for September 21, 2017 in Puerto Rico 
imerg21 <- nc_open("~/R/MEES708X/HW3/IMERG.20170921.nc")

# Select Variables from Data ----------------------------------------------
#Select Data from September 20 dataset
lon <- ncvar_get(imerg20, varid = "lon")
lat <- ncvar_get(imerg20, varid = "lat")
precipCal20 <- ncvar_get(imerg20,varid= 'precipitationCal')
precipHQ20 <- ncvar_get(imerg20,varid='HQprecipitation')
#Select Data from September 21 dataset
precipCal21 <- ncvar_get(imerg21,varid= 'precipitationCal')
precipHQ21 <- ncvar_get(imerg21,varid='HQprecipitation')
#Create matrix of difference data between the two variables in each dataset
diff20 <- precipCal20 - precipHQ20
diff21 <- precipCal21 - precipHQ21

# Plots for September 20th Data ----------------------------------------------------------
# Gauge Calibrated precipitation for September 20 
filled.contour(lat,lon,precipCal20,
    col=matlab.like2(23),plot.axes={axis(1);axis(2);
      contour(lat,lon,precipCal20,labcex=1,add=TRUE,lwd=1)})
# Satellite only precipitation for September 20
filled.contour(lat,lon,precipHQ20,
               col=matlab.like2(23), plot.axes={axis(1);axis(2);
                 contour(lat,lon,precipHQ20,add=TRUE,lwd=1)})
# Difference between Gauge Calibrated and satellite data on September 20th
filled.contour(lat,lon,diff20,
               col=matlab.like2(23),plot.axes={axis(1);axis(2);
                 contour(lat,lon,diff20,add=TRUE,lwd=1)})

# Analysis of September 20th data -----------------------------------------
print(max(diff20))
mean(diff20)

# Plots for September 21st Data -------------------------------------------
# Gauge Calibrated precipitation for September 21
filled.contour(lat,lon,precipCal21,
               col=matlab.like2(23),plot.axes={axis(1);axis(2);
                 contour(lat,lon,precipCal21,add=TRUE,lwd=1)})

# Satellite only precipitation for September 21
filled.contour(lat,lon,precipHQ21,
               col=matlab.like2(23),plot.axes={axis(1);axis(2);
                 contour(lat,lon,precipHQ21,add=TRUE,lwd=1)})
#  difference between Gauge Calibrated and satellite data on September 21st
filled.contour(lat,lon,diff21,
               col=matlab.like2(23),plot.axes={axis(1);axis(2);
                 contour(lat,lon,diff21,add=TRUE,lwd=1)})

# Analysis of September 21st data -----------------------------------------
max(diff20)
mean(diff20)

# Daft Work ---------------------------------------------------------------
max(lon)
min(lon)
max(lat)
min(lat)
print(precipCal20)

print(paste0("The maximum differene between variables on September 20th is: ", max(diff20)))
print(paste0("The maximum differene between variables on September 21st is: ", max(diff21)))
print(paste0("The average differene between variables on September 21st is: ", mean(diff21)))
print(paste0("The average difference between variables on September 20th is: ", mean(diff20)))
sum(precipCal20)-sum(precipHQ20)

