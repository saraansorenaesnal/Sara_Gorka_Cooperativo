getwd()
setwd("C:/Users/Sara Uni/Desktop/BDATA1/DATA SCIENCE I/Reto4/Examen (1)")

df <- read.csv("water-quality-data.csv", header = T, sep = ",")

str(df)
df$ID <- as.integer(df$ID)
df$Sample.ID <- as.integer(df$Sample.ID)
df$Grab.ID <- as.integer(df$Grab.ID)
df$Profile.ID <- as.integer(df$Profile.ID)

rosnerTest(df$Value, k =100, alpha = 0.07)
rosnerTest(df$MDL, k =100, alpha = 0.07)
rosnerTest(df$RDL, k =100, alpha = 0.07)

lillie.test(df$Value)
lillie.test(df$MDL)
lillie.test(df$RDL)

boxplot(df$Value)
boxplot(df$MDL)
boxplot(df$RDL)

sd(df$Value, na.rm = T)
sd(df$MDL, na.rm = T)
sd(df$RDL, na.rm = T)

# Filtro de Hampel

