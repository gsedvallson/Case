%% combinations 
clear;
tic;
%2^65-1 =36893488000000000000
%2^44-1 =17592186044415
% 2^40 -1 = 1099511627775
% 2^22 -1 = 4194303
d=(dec2bin(1:4194303)); 
stop_ny = zeros(4194303,22);

for i=1:length(d)
    for j=1:22
        stop_ny(i,j) = str2num(d(i,j));
    end
end



toc;
%% SPP 

clear;
load('truckstopdist.mat');


demand_at_stop=truckstopdist(:,5);







