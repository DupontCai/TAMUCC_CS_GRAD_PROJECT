library(SOMbrero)
library(plotly)
library(foreach)
library(doParallel)

library(ggplot2)
library(grid)
library(gridExtra)
require(lattice)
library(cowplot)


cl<-makeCluster(5)
registerDoParallel(cl)

###look at the result 50 models 5dista*10 cluster type

setwd('/Users/Dupont/Documents/Cluster_Dupont/new_data_1004/output/norm_input/feature_new_tls/som67_chuyen')
load("som10by10_dist.RData")
graphics.off()
# plot_list = vector("list", 5)
plot_list = matrix(list(), 1,5)
foreach (i = 1:5) %do% {
  # p <-plot(som10by10_dist[[1,i]], what="energy")
  plot_list[[1,i]] <-plot(som10by10_dist[[1,i]], what="obs", type="hitmap")
  # plot(som10by10_dist[[1,i]], what="prototypes", type="umatrix")
  # plot(som10by10_dist[[1,i]], what="prototypes", type="mds")
  # plot_list[[i]] = p
}
plot(som10by10_dist[[1,1]], type="color")


# Z
# D
# R
# Std Dev Z of large voxel
# Std Dev R of large voxel
# Std Dev D of large voxel
# Curvature 1 of Largevoxel
# Curvature 2 of Large voxel
# Std Dev Z of small voxel
# Std Dev R of small voxel
# Std Dev D of small voxel
# Curvature 1of small voxel
# Curvature 2of small voxel

for (i in 1:5) {
# colnames(som10by10_dist[[1,i]]$data)<-c('Z','D','R','SD_Z_L','SD_R_L','SD_D_L','CUR_1_L','CUR_2_L','SD_Z_S','SD_R_S','SD_D_S','CUR_1_S','CUR_2_S')
# colnames(som10by10_dist[[1,i]]$data)<-c('Z','D','R','Z_SDL','R_SDL','D_SDL','C_1L','C_2L','Z_SDS','R_SDS','D_SDS','C_1S','C_2S')
colnames(som10by10_dist[[1,i]]$data)<-c('F1','F2','F3','F4','F5','F6','F7','F8','F9','F10','F11','F12','F13')

}
jpeg(file="123.jpeg",width=8000,height=6000,res=500)
plot(som10by10_dist[[1,2]], what="obs", type="radar",key.loc=c(-1,6),mar=c(0,2,2,0))
dev.off()



for (i in 1:5) 
  for (j in 2:10){
  # colnames(som10by10_dist[[1,i]]$data)<-c('Z','D','R','SD_Z_L','SD_R_L','SD_D_L','CUR_1_L','CUR_2_L','SD_Z_S','SD_R_S','SD_D_S','CUR_1_S','CUR_2_S')
  # colnames(som10by10_dist[[1,i]]$data)<-c('Z','D','R','Z_SDL','R_SDL','D_SDL','C_1L','C_2L','Z_SDS','R_SDS','D_SDS','C_1S','C_2S')
  colnames(my.sck4to10[[j,i]]$som$data)<-c('F1','F2','F3','F4','F5','F6','F7','F8','F9','F10','F11','F12','F13')
  
  }




jpeg(file="1111.jpeg",width=8000,height=6000,res=600)
par(mfrow=c(4,5))
plot(som10by10_dist[[1,1]], what="obs", type="hitmap")
plot(som10by10_dist[[1,2]], what="obs", type="hitmap")
plot(som10by10_dist[[1,3]], what="obs", type="hitmap")
plot(som10by10_dist[[1,4]], what="obs", type="hitmap")
plot(som10by10_dist[[1,5]], what="obs", type="hitmap")
plot(som10by10_dist[[1,1]], what="prototypes", type="umatrix")
plot(som10by10_dist[[1,2]], what="prototypes", type="umatrix")
plot(som10by10_dist[[1,3]], what="prototypes", type="umatrix")
plot(som10by10_dist[[1,4]], what="prototypes", type="umatrix")
plot(som10by10_dist[[1,5]], what="prototypes", type="umatrix")
plot(som10by10_dist[[1,1]], what="prototypes", type="mds")
plot(som10by10_dist[[1,2]], what="prototypes", type="mds")
plot(som10by10_dist[[1,3]], what="prototypes", type="mds")
plot(som10by10_dist[[1,4]], what="prototypes", type="mds")
plot(som10by10_dist[[1,5]], what="prototypes", type="mds")

dev.off()

jpeg(file="2222.jpeg",width=8000,height=6000,res=600)
par(mfrow=c(2,3))
plot(som10by10_dist[[1,1]], what="obs", type="radar")
plot(som10by10_dist[[1,2]], what="obs", type="radar")
plot(som10by10_dist[[1,3]], what="obs", type="radar")
plot(som10by10_dist[[1,4]], what="obs", type="radar")
plot(som10by10_dist[[1,5]], what="obs", type="radar", key.loc=c(-0.5,5,0.5,5), mar=c(0,10,2,0))
dev.off()



subplot(plot_list, nrows = 2)

plot(som10by10_dist[[1,1]], what="obs", type="hitmap")

# summary(som10by10_dist[[1,1]])
# plot(som10by10_dist[[1,i]], what="obs", type="barplot", print.title=TRUE)
# plot(som10by10_dist[[1,1]], what="obs", type="radar", key.loc=c(-0.5,5), mar=c(0,10,2,0))
#
# plot(som10by10_dist[[1,2]], what="obs", type="boxplot", print.title=TRUE)
# plot(som10by10_dist[[1,1]], what="prototypes", type="poly.dist")
# plot(som10by10_dist[[1,i]], what="prototypes", type="umatrix")
# plot(som10by10_dist[[1,1]], what="prototypes", type="smooth.dist")
# plot(som10by10_dist[[1,i]], what="prototypes", type="mds")
# plot(som10by10_dist[[1,1]], what="prototypes", type="grid.dist")

# som10by10_dist[[1,i]]

for (i in 1:5) {
  # colnames(som10by10_dist[[1,i]]$data)<-c('Z','D','R','SD_Z_L','SD_R_L','SD_D_L','CUR_1_L','CUR_2_L','SD_Z_S','SD_R_S','SD_D_S','CUR_1_S','CUR_2_S')
  # colnames(som10by10_dist[[1,i]]$data)<-c('Z','D','R','Z_SDL','R_SDL','D_SDL','C_1L','C_2L','Z_SDS','R_SDS','D_SDS','C_1S','C_2S')
  colnames(som10by10_dist[[1,i]]$data)<-c('F1','F2','F3','F4','F5','F6','F7','F8','F9','F10','F11','F12','F13')
  
}

for (i in 1:5){
filename <- paste("radar_som10by10_dist",i, ".jpeg", sep="")
jpeg(file=filename,width=8000,height=6000,res=500)
plot(som10by10_dist[[1,2]], what="obs", type="radar",key.loc=c(-1,6),mar=c(0,2,2,0))
dev.off()
}


for (i in 1:5){
filename <- paste("dendrogram_my.sck_6_",i, ".jpeg", sep="")
jpeg(file=filename,width=8000,height=4000,res=500)
plot(my.sck4to10[[j,i]], plot.var=FALSE)
dev.off()
}


for (i in 1:5){
  for (j in 4:8){
  filename <- paste("hitmap_my.sck_",j,i, ".jpeg", sep="")
  jpeg(file=filename,width=4000,height=3000,res=600)
  plot(my.sck4to10[[j,i]], type="hitmap", plot.legend=TRUE)
  dev.off()
  }
}
graphics.off()
plot(my.sck4to10[[8,5]], type="hitmap", plot.legend=TRUE)

for (i in 1:5){
  filename <- paste("grid_my.sck_6_",i, ".jpeg", sep="")
  jpeg(file=filename,width=4000,height=3000,res=600)
  plot(my.sck4to10[[6,i]], type="grid", plot.legend=TRUE)
  dev.off()
}

for (i in 1:5){
  filename <- paste("radar_my.sck_6_",i, ".jpeg", sep="")
  jpeg(file=filename,width=4000,height=3000,res=600)
  plot(my.sck4to10[[6,i]], what="obs", type="radar",key.loc=c(-1,6),mar=c(0,2,2,0))
  dev.off()
}





pltList <- lapply(1:5, function(i){
  plot(my.sck4to10[[6,i]], plot.var=FALSE)})

# or we can output into 1 PDF with 3 pages using print
pdf("TempPDF.pdf")
for(i in seq(1,5,1))
  print(grid.arrange(pltList[[i]],nrow = 1))
dev.off()


png(file="dendrogram_k6.png",width=10000,height=2000,res=300)
op<-par(mfrow=c(1,5))

# p11<-plot(my.sck4to10[[6,1]], plot.var=FALSE)
# p12<-plot(my.sck4to10[[6,2]], plot.var=FALSE)
# p13<-plot(my.sck4to10[[6,3]], plot.var=FALSE)
# p14<-plot(my.sck4to10[[6,4]], plot.var=FALSE)
# p15<-plot(my.sck4to10[[6,5]], plot.var=T)
# p21<-plot(my.sck4to10[[6,1]], type="hitmap", plot.legend=F)
# p22<-plot(my.sck4to10[[6,2]], type="hitmap", plot.legend=F)
# p23<-plot(my.sck4to10[[6,3]], type="hitmap", plot.legend=F)
# p24<-plot(my.sck4to10[[6,4]], type="hitmap", plot.legend=F)
# p25<-plot(my.sck4to10[[6,5]], type="hitmap", plot.legend=TRUE)
# p31<-plot(my.sck4to10[[6,1]], type="grid", plot.legend=F)
# p32<-plot(my.sck4to10[[6,2]], type="grid", plot.legend=F)
# p33<-plot(my.sck4to10[[6,3]], type="grid", plot.legend=F)
# p34<-plot(my.sck4to10[[6,4]], type="grid", plot.legend=F)
# p35<-plot(my.sck4to10[[6,5]], type="grid", plot.legend=TRUE)
plot(my.sck4to10[[6,1]], type="hitmap", plot.legend=F)
par(mar=c(2,2,2,2))
par(new=F)
plot(my.sck4to10[[6,1]], plot.var=FALSE)
plot(my.sck4to10[[6,1]], type="color")

plot(my.sck4to10[[6,2]], plot.var=FALSE)
plot(my.sck4to10[[6,3]], plot.var=FALSE)
plot(my.sck4to10[[6,4]], plot.var=FALSE)
plot(my.sck4to10[[6,5]], plot.var=FALSE)
# plot(my.sck4to10[[6,1]], type="hitmap", plot.legend=F)
# plot(my.sck4to10[[6,2]], type="hitmap", plot.legend=F)
# plot(my.sck4to10[[6,3]], type="hitmap", plot.legend=F)
# plot(my.sck4to10[[6,4]], type="hitmap", plot.legend=F)
# plot(my.sck4to10[[6,5]], type="hitmap", plot.legend=TRUE)
# plot(my.sck4to10[[6,1]], type="grid", plot.legend=F)
# plot(my.sck4to10[[6,2]], type="grid", plot.legend=F)
# plot(my.sck4to10[[6,3]], type="grid", plot.legend=F)
# plot(my.sck4to10[[6,4]], type="grid", plot.legend=F)
# plot(my.sck4to10[[6,5]], type="grid", plot.legend=TRUE)


par(op)
# print(p11, position = c(0, 0, 0.5, 1), more = TRUE)
# print(p12, position = c(0.5, 0, 1, 1))
# grid.arrange(p11, p12, p13, p14, p15, p21, p22, p23, p24, p25, p31, p32, p33, p34, p35, ncol = 5)

dev.off()