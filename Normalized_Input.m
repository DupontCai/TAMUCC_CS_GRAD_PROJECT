function Normalized_Input = Normalized_Input(Pointfeature,Features1,Features2);
% combine the two Features set from two different Octree Features
Input1 = Features1(:,2:end);
Input2 = Features2(:,2:end);
Input = [Pointfeature,Input1, Input2];
% delete any points'features contain nan
Input_no_nan=Input(find(sum(isnan(Input),2)==0),:);
%normalized the input
Normalized_Input = zscore(Input_no_nan);
end 





tic
load ('~/Cluster_Dupont/new_ot_1004/output/Chuyen/TLS_XYZDR.mat');
load('~/Cluster_Dupont/new_ot_1004/output/norm_input/feature_new_tls/feature_new_tls_weighted_5.mat');
load('~/Cluster_Dupont/new_ot_1004/output/norm_input/feature_new_tls/feature_new_tls_weighted_6.mat');
load('~/Cluster_Dupont/new_ot_1004/output/norm_input/feature_new_tls/feature_new_tls_weighted_7.mat');
%load('~/Cluster_Dupont/new_ot_1004/output/norm_input/feature_new_tls/feature_new_tls_weighted_5.mat');


Pointfeature=TLS_XYZDR(:,3:5);
Input1 = feature_new_tls_weighted_5(:,2:end);
Input2 = feature_new_tls_weighted_6(:,2:end);
Input3 = feature_new_tls_weighted_7(:,2:end);
% Input4 = feature_new_tls_weighted_8(:,2:end);



%create norm_input_weighted_567
Input_567 = [Pointfeature,Input1, Input2,Input3];
% delete any points'features contain nan
Input_567_no_nan=Input_567(find(sum(isnan(Input_567),2)==0),:);
%normalized the input
norm_input_weighted_567 = zscore(Input_567_no_nan);





%create norm_input_weighted_67
Input_67 = [Pointfeature,Input2,Input3];
% delete any points'features contain nan
Input_67_no_nan=Input_67(find(sum(isnan(Input_67),2)==0),:);
%normalized the input
norm_input_weighted_67 = zscore(Input_67_no_nan);

%create norm_input_weighted_57
Input_57 = [Pointfeature,Input1,Input3];
% delete any points'features contain nan
Input_57_no_nan=Input_57(find(sum(isnan(Input_57),2)==0),:);
%normalized the input
norm_input_weighted_57 = zscore(Input_57_no_nan);



%create norm_input_weighted_56
Input_56 = [Pointfeature,Input1,Input2];
% delete any points'features contain nan
Input_56_no_nan=Input_56(find(sum(isnan(Input_56),2)==0),:);
%normalized the input
norm_input_weighted_56 = zscore(Input_56_no_nan);




% %create norm_input_weighted_78
% Input_78 = [Pointfeature,Input3,Input4];
% % delete any points'features contain nan
% Input_78_no_nan=Input_78(find(sum(isnan(Input_78),2)==0),:);
% %normalized the input
% norm_input_weighted_78 = zscore(Input_78_no_nan);
% 
% %create norm_input_weighted_5678
% Input_5678 = [Pointfeature,Input1, Input2,Input3,Input4];
% % delete any points'features contain nan
% Input_5678_no_nan=Input_5678(find(sum(isnan(Input_5678),2)==0),:);
% %normalized the input
% norm_input_weighted_5678 = zscore(Input_5678_no_nan);
% 
% %create norm_input_weighted_568
% Input_568 = [Pointfeature,Input1,Input2,Input4];
% % delete any points'features contain nan
% Input_568_no_nan=Input_568(find(sum(isnan(Input_568),2)==0),:);
% %normalized the input
% norm_input_weighted_568 = zscore(Input_568_no_nan);
% 
% %create norm_input_weighted_678
% Input_678 = [Pointfeature,Input2,Input3,Input4];
% % delete any points'features contain nan
% Input_678_no_nan=Input_678(find(sum(isnan(Input_678),2)==0),:);
% %normalized the input
% norm_input_weighted_678 = zscore(Input_678_no_nan);
% 
% %create norm_input_weighted_58
% Input_58 = [Pointfeature,Input1,Input4];
% % delete any points'features contain nan
% Input_58_no_nan=Input_58(find(sum(isnan(Input_58),2)==0),:);
% %normalized the input
% norm_input_weighted_58 = zscore(Input_58_no_nan);
% 
% %create norm_input_weighted_68
% Input_68 = [Pointfeature,Input2,Input4];
% % delete any points'features contain nan
% Input_68_no_nan=Input_68(find(sum(isnan(Input_68),2)==0),:);
% %normalized the input
% norm_input_weighted_68 = zscore(Input_68_no_nan);
% 
% 
% 
% save('norm_input_weighted_5678.mat','norm_input_weighted_5678','-v7.3');
% save('norm_input_weighted_568.mat','norm_input_weighted_568','-v7.3');
% save('norm_input_weighted_678.mat','norm_input_weighted_678','-v7.3');
% save('norm_input_weighted_58.mat','norm_input_weighted_58','-v7.3');
% save('norm_input_weighted_68.mat','norm_input_weighted_68','-v7.3');
% save('norm_input_weighted_78.mat','norm_input_weighted_78','-v7.3');

save('norm_input_weighted_567.mat','norm_input_weighted_567','-v7.3');
save('norm_input_weighted_57.mat','norm_input_weighted_57','-v7.3');
save('norm_input_weighted_56.mat','norm_input_weighted_56','-v7.3');
save('norm_input_weighted_67.mat','norm_input_weighted_67','-v7.3');

toc