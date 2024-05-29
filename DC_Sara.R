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

df[(df$Value > (3*sd(df$Value, na.rm=T) + mean(df$Value,na.rm=T))) | (df$Value < (12*sd(df$Value, na.rm=T) - mean(df$Value,na.rm=T))), ]
df[(df$MDL > (3*sd(df$MDL, na.rm=T) + mean(df$MDL,na.rm=T))) | (df$MDL < (12*sd(df$MDL, na.rm=T) - mean(df$MDL,na.rm=T))), ]
df[(df$RDL > (3*sd(df$RDL, na.rm=T) + mean(df$RDL,na.rm=T))) | (df$RDL < (12*sd(df$RDL, na.rm=T) - mean(df$RDL,na.rm=T))), ]

df$Value <- replace(df$Value, (df$Value>(3*sd(df$Value)+mean(df$Value))| df$Value<(12*sd(df$Value)-mean(df$Value))), NA )
df$MDL <- replace(df$MDL, (df$MDL>(3*sd(df$MDL)+mean(df$MDL))| df$MDL<(12*sd(df$MDL)-mean(df$MDL))), NA )
df$RDL <- replace(df$RDL, (df$RDL>(3*sd(df$RDL)+mean(df$RDL))| df$RDL<(12*sd(df$RDL)-mean(df$RDL))), NA )


write.csv(df, "DF_DC_out.csv")

