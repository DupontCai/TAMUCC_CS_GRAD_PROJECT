# source("http://bioconductor.org/biocLite.R")
# biocLite("rhdf5")
library(rhdf5)
library(SOMbrero)
library(foreach)
library(doParallel)
# library(scatterplot3d)
# library(ggplot2)
# library(ggdendro)
# library(ggfortify)

# no_cores <- detectCores() - 1
# cl<-makeCluster(no_cores)
cl<-makeCluster(20)
registerDoParallel(cl)

setwd('/Users/Dupont/Documents/Cluster_Dupont/new_data_1004/output/norm_input/feature_new_tls/som67_chuyen')
h5ls("/Users/Dupont/Documents/Cluster_Dupont/new_data_1004/output/norm_input/feature_new_tls/som67_chuyen/TLS_6_7_weighted_normalized_input.mat")
f<-h5read("/Users/Dupont/Documents/Cluster_Dupont/new_data_1004/output/norm_input/feature_new_tls/som67_chuyen/TLS_6_7_weighted_normalized_input.mat","TLS_6_7_weighted_normalized_input")
Normalized_Input<-f[1:1000,]
# Normalized_Input<-f[sample(nrow(f), 1000), ]

# setwd('~/Cluster_Dupont/new_ot_1004/output/norm_input/feature_new_tls/norm_input_weighted/som67_chuyen')
# h5ls('~/Cluster_Dupont/new_ot_1004/output/norm_input/feature_new_tls/norm_input_weighted/kmean67/chuyen/TLS_6_7_weighted_normalized_input.mat')
# f<-h5read("~/Cluster_Dupont/new_ot_1004/output/norm_input/feature_new_tls/norm_input_weighted/kmean67/chuyen/TLS_6_7_weighted_normalized_input.mat","TLS_6_7_weighted_normalized_input")
# Normalized_Input<-f
# #
#
#
# # View(Normalized_Input)

# initial grid/som to define the topology (square vs hex?) and distance type (euclidian vs linkdis?)~
dist_method<-c("euclidean", "maximum", "manhattan", "canberra", "minkowski") #"binary" is not included

som10by10_dist<-matrix(list(), 1,5)
my.sck4to10<-matrix(list(), 10,5)


# x <-
#   foreach(b=bvec, .combine='cbind') %:%
#   foreach(a=avec, .combine='c') %do% {
#      sim(a, b)
#      }
# x

avec<-c(2:10)
bvec<-c(1:5)

som10by10_dist<-matrix(list(), 1,length(bvec))
# my.sck4to10<-matrix(list(), 10,5)

tic=proc.time()

foreach (i=1:5) %do% {

    som10by10_dist[[1,i]]<-trainSOM(x.data=Normalized_Input,maxit=1000,dimension=c(10,10),dist.type=dist_method[i], verbose=TRUE, nb.save=10)

}
# som10by10_dist<-
#   foreach (i=bvec,.combine='cbind') %do% {
#   trainSOM(x.data=Normalized_Input,maxit=1000,dimension=c(10,10),dist.type=dist_method[i], verbose=TRUE, nb.save=10)
#
# }
toc=proc.time()
toc-tic


save.image('som67_dim10by10_iter1000_all5dist.RData')

# my.sck4to10 <- matrix(list(), length(avec), length(bvec))
my.sck4to10 <- matrix(list(), 10, 5)

# my.sck4to10<-foreach (i=bvec,.combine='cbind') %:%
#   foreach(j=avec, .combine='c') %do% {
#     # tic=proc.time()
#     superClass(som10by10_dist[[1,i]], k=j)
#     #
#     # toc=proc.time()
#     # toc-tic
#   }

for (i in 1:5) {
  for (j in 2:10){
    my.sck4to10[[j,i]]<-superClass(som10by10_dist[[1,i]], k=j)
  }
}

# my.sck4to10[[1,3]]$cluster
# my.sck4to10[[j,i]]$cluster

# foreach (i=1:5,.combine='rbind') %:%
#   foreach(j=2:10, .combine='c') %do% {
#   tic=proc.time()
#   som10by10_dist[[1,i]]<-trainSOM(x.data=Normalized_Input,maxit=1000,dimension=c(10,10),dist.type=dist_method[i], verbose=TRUE, nb.save=10)
#
#   my.sck4to10[[j,i]]<-superClass(som10by10_dist[[1,i]], k=j)
#
#
#
#
#   toc=proc.time()
#   toc-tic
#   }






match.cluster=matrix(list(), 1,5)
ori.cluster=matrix(list(), 1,5)
final.cluster=matrix(list(), 1,5)
for (i in 1:5) {
match.cluster[[1,i]]=matrix(nrow=100,ncol=10)
match.cluster[[1,i]][,1]<-c(1:100)

ori.cluster[[1,i]]=matrix(nrow=nrow(Normalized_Input),ncol=2)
ori.cluster[[1,i]][,1]<-c(1:nrow(Normalized_Input))
# ori.cluster[,2]<-my.sc$som$clustering
ori.cluster[[1,i]][,2]<-som10by10_dist[[1,i]]$clustering

colnames(match.cluster[[1,i]])<-c('c_old','c_new2','c_new3','c_new4','c_new5','c_new6','c_new7','c_new8','c_new9','c_new10')
colnames(ori.cluster[[1,i]])<-c("id","c_old")
}

# i= dist_method, j=super_cluster
# foreach (i=1:5,.combine='rbind') %:%
#   foreach(j=2:10, .combine='c') %do% {
for (i in 1:5){
  for (j in 2:10){

    match.cluster[[1,i]][,j]<-my.sck4to10[[j,i]]$cluster
    final.cluster[[1,i]]<-merge(ori.cluster[[1,i]],match.cluster[[1,i]],by="c_old")

    final.cluster[[1,i]] <- final.cluster[[1,i]][order(final.cluster[[1,i]]$id),]
}

}


cluster_alldist<-cbind(final.cluster[[1,1]],final.cluster[[1,2]],final.cluster[[1,3]],final.cluster[[1,4]],final.cluster[[1,5]])
cluster_alldist<-cluster_alldist[,-c(13,24,35,46)]
colnames(cluster_alldist)<-c("d1_c100","id","d1_c2","d1_c3","d1_c4","d1_c5","d1_c6","d1_c7","d1_c8","d1_c9","d1_c10",
                             "d2_c100","d2_c2","d2_c3","d2_c4","d2_c5","d2_c6","d2_c7","d2_c8","d2_c9","d2_c10",
                             "d3_c100","d3_c2","d3_c3","d3_c4","d3_c5","d3_c6","d3_c7","d3_c8","d3_c9","d3_c10",
                             "d3_c100","d3_c2","d3_c3","d3_c4","d3_c5","d3_c6","d3_c7","d3_c8","d3_c9","d3_c10",
                              "d4_c100","d4_c2","d4_c3","d4_c4","d4_c5","d4_c6","d4_c7","d4_c8","d4_c9","d4_c10")

cluster_alldist<-cluster_alldist[,c(2,1,3:51)]
write.csv(cluster_alldist, file = "cluster_c2to10_all5dist_byR_20171115.csv",row.names=T)
# head(cluster_alldist,n=100)
#
#





# dend <- as.dendrogram(my.sck4to10[[6,5]]$tree)
# ggd1<-as.ggdend(dend)
# ggplot(ggd1, labels = FALSE) +
#   scale_y_reverse(expand = c(0.2, 0)) +
#   coord_polar(theta="x")


#
# som10by10 <- trainSOM(x.data=Normalized_Input,maxit=1000,dimension=c(10,10), verbose=TRUE, nb.save=10)
# plot(som10by10, what="energy")
# plot(som10by10, what="obs", type="hitmap")
# summary(som10by10)
# plot(som10by10, what="obs", type="barplot", print.title=TRUE)
# plot(som10by10, what="obs", type="radar", key.loc=c(-0.5,5), mar=c(0,10,2,0))
#
# plot(som10by10, what="obs", type="boxplot", print.title=TRUE)
# plot(som10by10, what="prototypes", type="poly.dist")
# plot(som10by10, what="prototypes", type="umatrix")
# plot(som10by10, what="prototypes", type="smooth.dist")
# plot(som10by10, what="prototypes", type="mds")
# plot(som10by10, what="prototypes", type="grid.dist")

# getwd()
# load("som67_dim10by10_iter1000.RData")
# # quality(som10by10)
# #
# plot(superClass(som10by10))
# # my.sc5<-superClass(som10by10, k=5)
# # my.sc6<-superClass(som10by10, k=6)
# # my.sc7<-superClass(som10by10, k=7)
# # my.sc8<-superClass(som10by10, k=8)
# # my.sc9<-superClass(som10by10, k=9)
# # my.sc10<-superClass(som10by10, k=10)
# my.sck4to10<-matrix(list(), 10,1)
# # my.sck4to10_summary<-matrix(list(), 10,1)
# # my.sck4to10_dendrogram<-matrix(list(), 10,1)
# # my.sck4to10_hitmap<-matrix(list(), 10,1)
# # my.sck4to10_grid<-matrix(list(), 10,1)
# # my.sck4to10_boxplot<-matrix(list(), 10,1)
#
# foreach (i = 4:10)%do%
# {
#   tic=proc.time()
#   my.sck4to10[[i,1]]<-superClass(som10by10, k=i)
#   # my.sck4to10_summary[[i,1]]<-summary(my.sck4to10[[i,1]])
#   # my.sck4to10_dendrogram[[i,1]]<-plot(my.sck4to10[[i,1]], plot.var=FALSE)
#   # my.sck4to10_hitmap[[i,1]]<-plot(my.sck4to10[[i,1]], type="hitmap", plot.legend=TRUE)
#   # my.sck4to10_grid[[i,1]]<-plot(my.sck4to10[[i,1]], type="grid", plot.legend=TRUE)
#   # my.sck4to10_boxplot[[i,1]]<-plot(my.sck4to10[[i,1]], type="boxplot", print.title=TRUE)
#   toc=proc.time()
#   toc-tic
# }





# h5ls("TLS_6_7_XYZ_no_nan.mat")
# xyz<-h5read("TLS_6_7_XYZ_no_nan.mat","TLS_6_7_XYZ_no_nan")
# nrow(final.cluster)
# nrow(xyz)
# ncol(final.cluster)
#
# final.cluster[,12:14]<-xyz
# head(final.cluster,n=100)
# colnames(final.cluster)
# final.cluster <- subset(final.cluster, select=c(2,12:14,1,5:11))
# colnames(final.cluster)[2:4] <- c("x","y","z")
# write.csv(final.cluster, file = "final.cluster_c4to10_byR_20171109.csv",row.names=T)
#
#
#
# read.csv("final.cluster_c4to10_byR_20171109.csv",header=T,sep=",")
#
#
#
#
#
#
#
#
#
# # my.sc <- superClass(som10by10, k=4)
# # summary(my.sc)
# # plot(my.sc, plot.var=FALSE)
# #
# # plot(my.sc, type="grid", plot.legend=TRUE)
# # plot(my.sc, type="dendro3d")
# # plot(my.sc, type="hitmap", plot.legend=TRUE)
# # plot(my.sc, type="barplot", print.title=TRUE)
# # plot(my.sc, type="boxplot", print.title=TRUE)
# # plot(my.sc, type="color")
# # plot(my.sc, type="radar", key.loc=c(-0.5,5), mar=c(0,10,2,0))
# #
# # match.cluster=matrix(nrow=25,ncol=2)
# # match.cluster[,1]<-c(1:25)
# # match.cluster[,2]<-my.sc$cluster
# # ori.cluster=matrix(nrow=nrow(Normalized_Input),ncol=2)
# # ori.cluster[,1]<-c(1:nrow(Normalized_Input))
# # ori.cluster[,2]<-my.sc$som$clustering
# # colnames(match.cluster)<-c('c_old','c_new')
# # colnames(ori.cluster)<-c("id","c_old")
# #
# #
# #
# # final.cluster<-merge(ori.cluster,match.cluster,by="c_old")
#
save.image('som67_dim10by10_iter1000_all5dist.RData')
q()









