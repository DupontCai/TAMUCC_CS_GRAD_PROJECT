%++++++++++++in chuyen's pc+++++++++++++

cd('C:\Users\cnguyen13\Documents\Dupont');
load('alldata_plot_with_background.mat');
UAS_XYZRGB(:,3)=UAS_XYZRGB(:,3)-0.5;  %for plot, showing the cluster points



% range(UAS_XYZRGB(:,3));
% color=['r','g','b','c','m','y']; 
% xyz=rand(1000,3);
color=zeros(10,3);
color(:,1)=[1,0,0,0,1,1,0.5,0,0,0.5];
color(:,2)=[0,1,0,1,0,1,0,0.5,0.5,0];
color(:,3)=[0,0,1,1,1,0,0,0.0,0.5,0.5];


% for i = 7:10
% figure
% showPointCloud(xyz(:,1),xyz(:,2),xyz(:,3),color(i,:));
% end



%%%==========plot with all cluster layers+++++++++++++++++

for j = 1:2;
for k=2:10;
h=gcf;    
% pcshow(UAS_XYZRGB(:,1:3),RGB);
% hold on
% for i = 1:k;
% h=figure;    

% showPointCloud(clust(clust(:,j*10-4)==i,51:53),clust(clust(:,j*10-4)==i,j*10-4),'MarkerSize',6);
% pcshow(clust(clust(:,j*k-4)==i,51:53),color(i,:),'MarkerSize',6);
pcshow(uas_xyz,clust(:,(j-1)*10+k),'MarkerSize',6);

% hold on

% end
% hold off
view(0,90);

filename=['dist' num2str(j) '_clust' num2str(k) '_all.jpeg'];
% set(h, 'PaperPosition', [0 0 20 20])    % can be bigger than screen 
% set(h, 'PaperSize', [20 20])    % Same, but for PDF output
% set(h,'units','normalized','outerposition',[0 0 1 1]);
set(h,'PaperUnits','inches','PaperPosition',[0 0 30 30]);

% set(h,'PaperOrientation','landscape');
% set(h,'PaperUnits','normalized');
% set(h,'PaperPosition', [0 0 1 1]);
% print(gcf, '-dpdf', filename);
% print(h, '-djpeg', filename, '-r300');
saveas(h,filename);
end
end 

% for j = 1:5;
% % h=figure;    
% showPointCloud(UAS_XYZRGB(:,1:3),RGB);
%     view(0,90);
%     hold on
% showPointCloud(clust(:,51:53),clust(:,j*10-4),'MarkerSize',6);
%     view(0,90);
% h=gcf;    
% filename=['dist' num2str(j) '_clust6_all.jpeg'];
% % set(h, 'PaperPosition', [0 0 20 20])    % can be bigger than screen 
% % set(h, 'PaperSize', [20 20])    % Same, but for PDF output
% % set(h,'units','normalized','outerposition',[0 0 1 1]);
% set(h,'PaperUnits','inches','PaperPosition',[0 0 30 30]);
% 
% % set(h,'PaperOrientation','landscape');
% % set(h,'PaperUnits','normalized');
% % set(h,'PaperPosition', [0 0 1 1]);
% % print(gcf, '-dpdf', filename);
% % print(h, '-djpeg', filename, '-r300');
% saveas(h,filename);
% end



%%%======plot with individual layers++++++++++++++

for j = j:5;
for k=2:10;
for i = 1:k;
% h=figure;    
h=gcf;    
pcshow(UAS_XYZRGB(:,1:3),RGB);
hold on
% showPointCloud(clust(clust(:,j*10-4)==i,51:53),clust(clust(:,j*10-4)==i,j*10-4),'MarkerSize',6);
pcshow(clust(clust(:,j*k-4)==i,51:53),color(i,:),'MarkerSize',6);
hold off
view(0,90);

filename=['dist' num2str(j) '_clust' num2str(k) '_k' num2str(i) '.jpeg'];
% set(h, 'PaperPosition', [0 0 20 20])    % can be bigger than screen 
% set(h, 'PaperSize', [20 20])    % Same, but for PDF output
% set(h,'units','normalized','outerposition',[0 0 1 1]);
set(h,'PaperUnits','inches','PaperPosition',[0 0 30 30]);

% set(h,'PaperOrientation','landscape');
% set(h,'PaperUnits','normalized');
% set(h,'PaperPosition', [0 0 1 1]);
% print(gcf, '-dpdf', filename);
% print(h, '-djpeg', filename, '-r300');
saveas(h,filename);

end
end
end 





% for i = 1:6;
%     for j=1:5;
% showPointCloud(UAS_XYZRGB(:,1:3),RGB);
%     view(0,90);
%     hold on
% % showPointCloud(clust(clust(:,j*10-4)==i,51:53),clust(clust(:,j*10-4)==i,j*10-4),'MarkerSize',6);
% showPointCloud(clust(clust(:,j*10-4)==i,51:53),color(i,:),'MarkerSize',6);
% 
%     view(0,90);
%     hold off
% h=gcf;    
% 
% filename=['dist' num2str(j) '_clust6' num2str(i) '.jpeg']; 
% set(h,'PaperUnits','inches','PaperPosition',[0 0 30 30]);
% % print(h, '-djpeg', filename, '-r300');
% saveas(h,filename);
% 
%     end
% end










%%++++++++++++++++in my mac+++++++++++++++

cd('/Users/Dupont/Documents/Cluster_Dupont/new_data_1004/output/norm_input/feature_new_tls/som67_chuyen/plot_with_background');
load(fullfile('..','UAS_XYZRGB_good.mat'));
load(fullfile('..','TLS_6_7_XYZ_no_nan.mat'));
clust=csvread(fullfile('..','cluster_c2to10_all5dist_byR_20171118.csv'),1,1);
clust=clust(:,2:51);
clust(:,51:53)=TLS_6_7_XYZ_no_nan;
RGB=(UAS_XYZRGB(:,4:6)/65536);
save('alldata_plot_with_background.mat','-v7.3');
cd('C:\Users\cnguyen13\Documents\Dupont');
load('alldata_plot_with_background.mat');



range(UAS_XYZRGB(:,3));
color=['r','g','b','c','m','y'];    
% pool=parpool(3);
UAS_XYZRGB(:,3)=UAS_XYZRGB(:,3)-0.5;  %for plot, showing the cluster points
for j = 1:5;
% h=figure;    
showPointCloud(UAS_XYZRGB(:,1),UAS_XYZRGB(:,2),UAS_XYZRGB(:,3),RGB);
    view(0,90);
    hold on
showPointCloud(clust(:,51),clust(:,52),clust(:,53),clust(:,j*10-4),'MarkerSize',6);
    view(0,90);
h=gcf;    
filename=['dist' num2str(i) '_clust6_all.jpeg'];
% set(h, 'PaperPosition', [0 0 20 20])    % can be bigger than screen 
% set(h, 'PaperSize', [20 20])    % Same, but for PDF output
% set(h,'units','normalized','outerposition',[0 0 1 1]);
set(h,'PaperUnits','inches','PaperPosition',[0 0 30 30]);

% set(h,'PaperOrientation','landscape');
% set(h,'PaperUnits','normalized');
% set(h,'PaperPosition', [0 0 1 1]);
% print(gcf, '-dpdf', filename);
% print(h, '-djpeg', filename, '-r300');
saveas(h,filename);
end





for i = 1:6;
    for j=1:5;
showPointCloud(UAS_XYZRGB(:,1),UAS_XYZRGB(:,2),UAS_XYZRGB(:,3),RGB);
    view(0,90);
    hold on
showPointCloud(clust(clust(:,j*10-4)==i,51),clust(clust(:,j*10-4)==i,52),clust(clust(:,j*10-4)==i,53),color(i),'MarkerSize',6);
    view(0,90);
h=gcf;    

filename=['dist' num2str(i) '_clust6' num2str(i) '.jpeg']; 
set(h,'PaperUnits','inches','PaperPosition',[0 0 30 30]);
% % print(h, '-djpeg', filename, '-r300');
saveas(h,filename);

    end
end



color=['r','g','b','c','m','y'];



figure;
subplot(2,3,1);
   p1= showPointCloud(UAS_XYZRGB(:,1),UAS_XYZRGB(:,2),UAS_XYZRGB(:,3),RGB);
    view(0,90);
    hold on
   p2= showPointCloud(clust(clust(:,6)==1,51),clust(clust(:,6)==1,52),clust(clust(:,6)==1,53),'r','MarkerSize',10);
    view(0,90);
    get(gca, 'Renderer');
ax = gca;
ax.Children
ax.SortMethod
ax.SortMethod = 'childorder';
ax.Children
ax.Children = ax.Children([1 2]);


subplot(2,3,2);
    showPointCloud(UAS_XYZRGB(:,1),UAS_XYZRGB(:,2),UAS_XYZRGB(:,3),RGB);
    view(0,90);
    hold on
    showPointCloud(clust(clust(:,6)==2,51),clust(clust(:,6)==2,52),clust(clust(:,6)==2,53),'g','MarkerSize',10);
    view(0,90);
    ax = gca;
    ax.Children = ax.Children([2 1]);
 subplot(2,3,3);
    showPointCloud(UAS_XYZRGB(:,1),UAS_XYZRGB(:,2),UAS_XYZRGB(:,3),RGB);
    view(0,90);
    hold on
    showPointCloud(clust(clust(:,6)==3,51),clust(clust(:,6)==3,52),clust(clust(:,6)==3,53),'b','MarkerSize',10);
    view(0,90);
 subplot(2,3,4);
    showPointCloud(UAS_XYZRGB(:,1),UAS_XYZRGB(:,2),UAS_XYZRGB(:,3),RGB);
    view(0,90);
    hold on
    showPointCloud(clust(clust(:,6)==4,51),clust(clust(:,6)==4,52),clust(clust(:,6)==4,53),'c','MarkerSize',10);
    view(0,90);
 subplot(2,3,5);
    showPointCloud(UAS_XYZRGB(:,1),UAS_XYZRGB(:,2),UAS_XYZRGB(:,3),RGB);
    view(0,90);
    hold on
    showPointCloud(clust(clust(:,6)==5,51),clust(clust(:,6)==5,52),clust(clust(:,6)==5,53),'m','MarkerSize',10);
    view(0,90);
 subplot(2,3,6);
    showPointCloud(UAS_XYZRGB(:,1),UAS_XYZRGB(:,2),UAS_XYZRGB(:,3),RGB);
    view(0,90);
    hold on
    showPointCloud(clust(clust(:,6)==6,51),clust(clust(:,6)==6,52),clust(clust(:,6)==6,53),'y','MarkerSize',10);
    view(0,90);
    