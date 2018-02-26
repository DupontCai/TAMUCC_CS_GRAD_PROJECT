function VoxelFeatures = features(PointBins,XYZDR)
% PointBins is a vector of point clound Voxel number ID
% XYZDR is a 6D matrix, double, including Poitcloud corordinate(x,y,z),
% waveform deviation(D), Reflectance( R) and number of returns (N)
% VoxelFeatures is 7D matrix including voxel features: Pointbins, std dev z, std dev
% d, std dev r, std dev n, PCA curvature 1 and 2;
% clear VoxelFeatures
VoxelFeatures= [PointBins NaN(size(PointBins,1),5)];

for i = 1:size(VoxelFeatures,1) % goes through all the points in the point cloud, point by point
    
    if isnan(VoxelFeatures(i,2)) % For each point, checks if the characteristics of the voxel have been computed or not. If they have not been computed
        % the code looks at the characteristics of the voxel (xmin, ymin,
        % zmin, xmax, ymax, zmax) and computes ranges and volume
        clear VoxelPoints % VoxelPoints_6 stores the list of points that are contained in voxel Volume_6_02_1Vox(i,2),
        VoxelPoints= find(PointBins==PointBins(i)); % Find the all the points belonging to the same voxel as PoinBins1000Vox(i)
        Voxel = NaN(size(VoxelPoints,1),6);
        % Extract the x,y,z coordinates of every points in the voxel
        for j=1:size(VoxelPoints,1)
            Voxel(j,1)=XYZDR(VoxelPoints(j),1);
            Voxel(j,2)=XYZDR(VoxelPoints(j),2);
            Voxel(j,3)=XYZDR(VoxelPoints(j),3);
            Voxel(j,4)=XYZDR(VoxelPoints(j),4);
            Voxel(j,5)=XYZDR(VoxelPoints(j),5);
            %Voxel(j,6)=XYZDR(VoxelPoints(j),6);
            %Voxel_1000_1_01_100(j,6)=Volume_1000_08_008_100(VoxelPoints_1000_1_01_100(j),5);
            %Voxel_1000_1_01_100(j,7)=Volume_1000_08_008_100(VoxelPoints_1000_1_01_100(j),4);
        end
        % Computes characteristics of the voxel
        if size(Voxel,1)>10
            stdev_z= std(Voxel(:,3));
            stdev_r = std(Voxel(:,4));
            stdev_d = std(Voxel(:,5));
            %stdev_n = std(Voxel(:,6));
            %voxel_volume_1000_08_008_100= Voxel_1000_1_01_100(j,6);
            %voxel_zrange_1000_08_008_100 = Voxel_1000_1_01_100(j,7);%voxelvolume_7_02_1(VoxelPoints_7_02_1(j),1)
            %voxeldensity_1000_08_008_100 = size(VoxelPoints_1000_1_01_100,1)/Voxel_1000_1_01_100(j,6);
        else
            stdev_z = nan;
            stdev_r = nan;
            stdev_d = nan;
            %stdev_n = nan;
            %voxel_volume_1000_08_008_100 = nan
            %voxel_zrange_1000_08_008_100 = nan
            %voxeldensity_1000_08_008_100 = nan
        end
        
        % Computes the principal components extracted from the voxel points
        % 3D distribution
        if size(Voxel,1)>10 % To exclude rare voxels that have 3 points or less
            [coeff,score,latent,tsquared,explained,mu] = pca(Voxel(:,1:3)); % coeff computes 3 PCA vectors & explained computes percentage of total variance explained along each PCA vector
            curvature1 = max(explained)/100;
            curvature2 = explained(3)/explained(2); % a from the Wakita paper
        else
            curvature1 = nan;
            curvature2 = nan;
        end
        
        % Assigns voxel characteristics to all points in the voxel
        for j=1:size(VoxelPoints,1)
            VoxelFeatures(VoxelPoints(j),2)=stdev_z;
            VoxelFeatures(VoxelPoints(j),3)=stdev_r;
            VoxelFeatures(VoxelPoints(j),4)=stdev_d;
            %VoxelFeatures(VoxelPoints(j),5)=stdev_n;
            %Attribute_1000_1_01_100(VoxelPoints_1000_1_01_100(j),5)=voxel_volume_1000_08_008_100;
            %Attribute_1000_1_01_100(VoxelPoints_1000_1_01_100(j),6)=voxel_zrange_1000_08_008_100;
            %Attribute_1000_1_01_100(VoxelPoints_1000_1_01_100(j),7)=voxeldensity_1000_08_008_100;
            VoxelFeatures(VoxelPoints(j),5)=curvature1;
            VoxelFeatures(VoxelPoints(j),6)=curvature2;
        end
    end
end
