library(reshape2)
library(ggplot2)
library(scales)
setwd('/Users/Dupont/Documents/Cluster_Dupont/new_data_1004/output/norm_input/feature_new_tls/som67_chuyen')
eva_cal_db<-read.csv('eva_cal_db_dist5_k210.csv')
colnames(eva_cal_db)
eva_reshape<-melt(eva_cal_db,id.vars=c('Dist_type','Cluster_num'))


eva_reshape$Cluster_num<-as.factor(eva_reshape$Cluster_num)
eva_reshape$Dist_type<-as.factor(eva_reshape$Dist_type)
ggplot(data=eva_reshape,aes(x=Cluster_num,y=value,col=Dist_type))+
  geom_point(data=eva_reshape,aes(x=Cluster_num,y=value,col=Dist_type,shape=Dist_type),size=3)+
  theme_bw() + 
  facet_wrap(~variable,scales = "free")+
  xlab('Cluster number')+
  ylab('Value')+
  scale_colour_manual(name = "Distance type",values=hue_pal()(5))+
  scale_shape(name = "Distance type",solid = T)+
  # scale_shape_manual(name = "Distance type",values=c(21:25))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=14,face="bold"),
        legend.title=element_text(size=14,face="bold"),
        legend.text=element_text(size=14),
        strip.text = element_text(size=14,face="bold"))
ggsave("eva_cal_db_dist5_k210.jpg", width = 40, height = 20, units = c("cm"),
       dpi = 300)
  
