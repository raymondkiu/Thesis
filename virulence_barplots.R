#Author Raymond Kiu Raymond.Kiu@quadram.ac.uk
setwd("U:/")
library(RColorBrewer)
library(ggplot2)



#provide the filename below
Stack_data <- read.csv("Barplot-all-virulence-all-isolates88-R.csv")
#Stack_data_2 <- as.character(Stack_data$ID)
#head(Stack_data_2)
head(Stack_data)

png("heatmap-barplot-4-8-18-all.png",
    width = 32*500,        # 5 x 300 pixels
    height = 8*500,
    res = 600,            # 300 pixels per inch
    pointsize = 8)

library(reshape2)
df_long <- melt(Stack_data,  id.vars ="ID" ,  variable.name ="Species")
head(df_long)
library(scales)
ncol(Stack_data)
library(ggplot2)


n <- 60
qual_col_pals = brewer.pal.info[brewer.pal.info$category == 'qual',]
col_vector = unlist(mapply(brewer.pal, qual_col_pals$maxcolors, rownames(qual_col_pals)))

color_new = grDevices::colors()[grep('gr(a|e)y', grDevices::colors(), invert = T)]
#ggplot(df_long,  aes(x = ID,  y = value,  fill =Species)) + 
# geom_bar(stat ="identity" ,  position = position_fill())+ theme(legend.position="right" ,  legend.direction="horizontal" ,  legend.title = element_blank())+
# labs(x="" , y="EGGNOG categories %")+theme(axis.text.x=element_text(angle=90, hjust=1, vjust=0.5)) + scale_fill_manual(values =familyPalette )



ggplot(df_long[order(df_long$value, decreasing = F),],  aes(x = ID,  y = value,  fill =Species)) +  #don't change this line, decreasing is to change the order in barplots

#  geom_bar(stat ="identity" ,  position = position_stack()) + theme(legend.text = element_text(size=10,face= "italic"),legend.position="right" ,  legend.direction="vertical" , legend.title = element_blank())+
#  labs(x=" " , y=" ") + theme(axis.text.x=element_text(angle=90, hjust= 1 , vjust=0.5,size =20, colour="black"), # hjust=1 vjust=0.5 will justify to the centre for the label
#                                                        axis.title.y = element_text(angle=90, hjust=1, vjust=1, size=20), 
#                                                        axis.text.y = element_text(size=20,colour = "black"), 
#                                                       axis.title.x = element_text(size=25)) + scale_fill_manual(values = c("Toxin" = "blue4")) 

  
  geom_bar(stat ="identity" ,  position = position_stack(reverse=TRUE)) + # add in element_text of the face="italic"
  theme(legend.key.size = unit (1,"cm"),legend.text = element_text(size=15),legend.position="right" ,  legend.direction="vertical" , legend.title = element_blank())+
    labs(x=" " , y=" ") + theme(axis.text.x=element_text(angle=90, hjust= 1 , vjust=0.5,size =20, colour="black"), # hjust=1 vjust=0.5 will justify to the centre for the label
                                                          axis.title.y = element_text(angle=90, hjust=1, vjust=1, size=20), 
                                                          axis.text.y = element_text(angle=90,hjust=0.5, vjust=0.5, size=25,colour = "black"), 
                                                         axis.title.x = element_text(size=25)) + 
  scale_fill_manual(values = c("Plasmid"= "grey", "AMR" = "dodgerblue", "Toxin"="blue4"  )) # this will specify the right colour for each column

dev.off()


