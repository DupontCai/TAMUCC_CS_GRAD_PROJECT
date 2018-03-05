cd '~/Cluster_Dupont/new_ot_1004/tls_nonpara_67';



tic;

load('~/Cluster_Dupont/new_ot_1004/TLS_XYZ.mat')

OT=OcTree(TLS_XYZ,'binCapacity',10000,'maxDepth',7,'maxSize',5,'minSize',0.03,'style','weighted');
size_x=OT.BinBoundaries(:,4)-OT.BinBoundaries(:,1);
size_y=OT.BinBoundaries(:,5)-OT.BinBoundaries(:,2);
size_z=OT.BinBoundaries(:,6)-OT.BinBoundaries(:,3);


disp(quantile(size_z,[0.025 0.25 0.50 0.75 0.975]));
disp(quantile(size_x,[0.025 0.25 0.50 0.75 0.975]));
disp(quantile(size_y,[0.025 0.25 0.50 0.75 0.975]));

save('TLS_WEIGHTED_NONPARA_7.mat');
toc;
