setwd("C:/Users/Gorka/Documents/ExamenDS/Gorka_Alvarez_examen_reto-4")

library(digest)
library(discretization)
library(dplyr)
library(EnvStats)
library(fastDummies)
library(naniar)
library(nortest)
library(readxl)
library(smoothmest)
library(VIM)
library(plumber)

water<- read.csv("water-quality-data.csv")

water$ID<-as.character(water$ID) 
water$Sample.ID<-as.character(water$Sample.ID)
water$Grab.ID<-as.character(water$Grab.ID)
water$Profile.ID<-as.character(water$Profile.ID)

# Data Cleaning ----
## 1 ----
miss_var_summary(water) # Por variable
miss_case_summary(water) # Por registro

## 2 ----
miss_var_summary(water)[1,]

## 3 ----
miss_case_summary(water)[1:5,]

## 4 ----
set.seed(10)
df_muestra<- water[sample(nrow(water), round(nrow(water)*0.01)), ]

vis_miss(df_muestra, cluster = T)

df_muestra<- kNN(df_muestra, variable = c("Grab.ID", "Value"), dist_var = c("Area", "Site.Type"))
vis_miss(df_muestra, cluster=T)

# Guardar en csv ----
write.csv(df_muestra, "DF_DC_na.csv")
