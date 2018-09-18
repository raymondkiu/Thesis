setwd("U:/Raymond_Kiu/Research/Thesis/Chapter_6/without_probiotic/")

library(ggfortify)
library(cluster)
require("gplots")
require("ggplot2")
require("RColorBrewer")
data <- read.csv("PCA2.csv")
head(data[1])


df <- data[c(2:ncol(data))]

head(df)

png("PCA_chicken5.png",
    width = 6*800,        # 5 x 300 pixels
   height = 6*800,
  res = 800,            # 300 pixels per inch
 pointsize = 12)

autoplot(prcomp(df), data = data, colour = 'ID', size =4, loadings.label =TRUE,loadings.label.repel= TRUE,loadings.label.size=0,  label.size ="10", loadings.label.colour="black")+
theme(legend.position="bottom", legend.direction="horizontal", legend.title = element_blank())+
 scale_color_manual(values=c("Healthy"="#00cc66","NE"="Red", "Sub-NE"="#ff6666"))+ 
#  scale_color_manual(values=c())+ 
  geom_point(aes(shape=ID, color=ID))
#  scale_shape_manual(values=c(3, 16, 17))
#autoplot(pam(df, 2), frame = TRUE, frame.type = 'norm') 
#autoplot(fanny(df, 2), frame = TRUE)+
#  theme(legend.position="bottom", legend.direction="horizontal", legend.title = element_blank())
#autoplot
dev.off()

