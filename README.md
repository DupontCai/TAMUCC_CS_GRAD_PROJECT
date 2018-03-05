# TAMUCC_CS_GRAD_PROJECT

# Preparing features (implemented in MATLAB)
1. OcTree.m <br />
Octrees is a method to partition a3-D spacebyrecursively subdividingit into eight octants. Take our 3D pie shape data for example:
At depth=0, it is the original 3d structure,
At depth=1, the original voxel was cut into eight pieces;
At depth=2, the eight pieces were further cut into 64 smaller pieces.
At depth=n, there would be $8^n$ much smaller voxels. <br />

There are two ways of octree partition: equal and weighted. Equal means after each partition, the eight octant would have same volume, while weighted indicates same number of points for each octant. In this study, after trial and error, the weighted Octree method was chosen, and depths were set as 6 and 7 to create multiple scale voxels.

2. features.m  <br />
Five statistics features for each of the large and small voxel size, including Standard deviation for Z, D, R, and principle component (PCA or curvature) 1 and 2  were calculated. Thus 10 more features were created, in addition to the z,d,r point features, there were 13 features to be fed into the modeling process.

3. Normalized_Input.m <br />
To make the features of the same scale, the 13 features created were normalized by Z-score to be final inputs for modeling process. <br />

The above processes were implemented in MATLAB 2016b in high performance cluster (HPC) at Texas A\&M University Corpus Christi. <br />


# SOM modeling (implemented in R)
4. som67_dim10by10_iter1000_all5dist.R <br />
To examine the impact of different distance calcuation methods, models based on 5 different distances (Euclidean, Maximum, Manhattan, Canberra and Minkowski) were built and compared. For each of the 5 distanced based models,the full model were set as 100 clusters with dimension 10 by 10. To better interpret the clustering result, the 100 clusters were regrouped t to 9 sets of superclusters (number of clusters ranging from 2 to 10) for each full models. Thus, 50 models were built in total, with 5 full models and 45 sub-models. <br />

5. eva_plot.R <br />
For quantitative evaluation, Davies-Bouldin (DB) and Calinski Harabasz (CH) indexes were used to evaluate the intra-class similarities and inter-class differences among the clusters. Both DB and CH values are relative, but with the same data, the lower DB as well the Higher CH values indicate better clustering qualities, while the higher DB and the lower CH values suggests worse clustering qualities. results see ![alt text](https://github.com/DupontCai/TAMUCC_CS_GRAD_PROJECT/blob/master/eva_cal_db_dist5_k210.jpg)



