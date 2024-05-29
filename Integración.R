getwd()
setwd("C:/Users/Sara Uni/Desktop/BDATA1/DATA SCIENCE I/Reto4/Sara_Gorka_Cooperativo")
water <- read.csv("water-quality-data.csv")
df_na <- read.csv("DF_DC_na.csv")

juntar <- merge(water, df_na)
write.csv(juntar, "DF_DC_VO.csv")