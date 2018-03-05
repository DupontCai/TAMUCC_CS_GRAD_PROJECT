# TAMUCC_CS_GRAD_PROJECT

# preparing features (implemented in MATLAB)
1. OcTree.m for octree voxelization <br />
2. features.m to create statistical features for each voxel, thus the resulting voxel would 13 features


# SOM modeling (implemented in R)
3. som67_dim10by10_iter1000_all5dist.R: <br />
To examine the impact of different distance calcuation methods, models based on 5 different distances (Euclidean, Maximum, Manhattan, Canberra and Minkowski) were built and compared. For each of the 5 distanced based models,the full model were set as 100 clusters with dimension 10 by 10. To better interpret the clustering result, the 100 clusters were regrouped t to 9 sets of superclusters (number of clusters ranging from 2 to 10) for each full models. Thus, 50 models were built in total, with 5 full models and 45 sub-models. 

