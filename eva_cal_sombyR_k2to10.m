%eva.cluster for sombyR
data=csvread('cluster_c2to10_all5dist_byR_20171118.csv',1,1);
load('TLS_6_7_weighted_normalized_input.mat');
data=data(:,2:51);




eva_track_cal=zeros(50,1);
eva_track_db=zeros(50,1);
eva_track_gap=zeros(50,1);
eva_track_sil=zeros(50,1);
eva_method={'CalinskiHarabasz','DaviesBouldin','gap','silhouette'};

pool=parpool(20)
parfor i=1:50
        tic
eva = evalclusters(TLS_6_7_weighted_normalized_input,data(:,i),eva_method{1});

eva_track_db(i) = eva.CriterionValues; %
        toc
        disp(i)
        disp(eva_track_db(i))
end
save('eva_cal_sombyR_k2to10.mat','eva_track_db');



