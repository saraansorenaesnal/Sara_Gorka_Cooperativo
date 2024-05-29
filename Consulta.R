df<- read.csv("DF_DC_VO.csv")

df %>% group_by(Area, Date.Analyzed) %>% 
  summarize_at(vars(Value, MDL, RDL), mean, na.rm=T)
