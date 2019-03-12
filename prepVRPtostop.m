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

%% Calculate distances for truck routes
clear
clc
load('dist_truck');
load('truck_stop_coord');

%Aktivera en i taget

% [0 3] =>
%route = [1 4];

% [0 5 9 10 11 32 33] =>
%route = [1 6 10 11 12 33 34];

% [0 13 16 2 22 3] =>
%route = [1 14 17 3 23 4];

% [0 44 38 39 42 14 1] =>
%route = [1 45 39 40 43 15 2];

% [0 17 18 19 41 28 29] =>
%route = [1 18 19 20 42 29 30];

% [0 29 20 21 30 31 36 35 9] =>
%route = [1 30 21 22 31 32 37 36 10];

% [0 34 44 26 23 10 13] =>
%route = [1 35 45 27 24 11 14];

% [0 37 43 24 25 40 14] =>
route = [1 38 44 25 26 41 15];


distBefore = zeros(1,7);
for i = 1:length(route)-1
    distBefore(i) = dist_truck(route(i), route(i+1));
end
distBefore(end) = dist_truck(route(end), route(1));
costBefore = sum(distBefore(:));
    

    counter=0;
    d = 0;
    iMin=0;
    jMin =0;
    steps = length(route);
    number_of_moves = 50*steps;
    
    
    while (counter<number_of_moves)
        dMin=10000000;
        for k=1:(steps-2)
            for l=(k+2):(steps)
                    d = evalmove2(k,l,route,dist_truck);
                if(d<dMin)
                    iMin = k;
                    jMin = l;
                    dMin = d;
                end
            end
        end
        route = makeMove2(iMin,jMin,route);
        counter = counter+1;
        if dMin >= 0
            break;
        end
        
    end
    
 
distAfter = zeros(1,7);
for i = 1:length(route)-1
    distAfter(i) = dist_truck(route(i), route(i+1));
end
distAfter(end) = dist_truck(route(end), route(1));
costAfter = sum(distAfter(:));

newRoute = route - 1
costAfter












