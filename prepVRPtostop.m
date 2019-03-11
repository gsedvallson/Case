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
%% calculate distances truckroutes
clear
clc
load('dist_truck');
load('truck_stop_coord');

route = zeros(8,10);
newRoute = zeros(8,10);

route(1,:) = [0 3 0 0 0 0 0 0 0 0]';
route(2,:) = [0 5 9 10 11 32 33 0 0 0]';
route(3,:) = [0 13 16 2 22 3 0 0 0 0]';
route(4,:) = [0 44 38 39 42	14 1 0 0 0]';
route(5,:) = [0 17 18 19 41 28 29 0 0 0]';
route(6,:) = [0 29 20 21 30	31 36 35 9 0]';
route(7,:) = [0 34 44 26 23 10 13 0 0 0]';
route(8,:) = [0 37 43 24 25 40 14 0 0 0]';

distBefore = zeros(8,9);
costBefore = zeros(8,1);
for i = 1:8
    for j = 1:8
        distBefore(i,j) = dist_truck(route(i,j)+1, route(i,j+1)+1);
    end
    costBefore(i) = sum(distBefore(i,:));
end


for h = 1:8
    
    thisRoute = route(h,:);
    counter=0;
    d = 0;
    iMin=0;
    jMin =0;
    steps = length(thisRoute);
    number_of_moves = 50*steps;
    
    
    while (counter<number_of_moves)
        dMin=10000000;
        for k=1:(steps-2)
            for l=(k+3):(steps)
                    d = evalmove2(k+1,l+1,thisRoute,dist_truck);
                if(d<dMin)
                    iMin = k;
                    jMin = l;
                    dMin = d;
                end
            end
        end
        
        thisRoute = makeMove2(iMin,jMin,thisRoute);
        counter = counter+1;
        if dMin >= 0
            
            break;
        end
        
    end
    
    newRoute(h,:) = thisRoute;
    
end

distAfter = zeros(8,9);
costAfter = zeros(8,1);
for i = 1:8
    for j = 1:8
        distAfter(i,j) = dist_truck(newRoute(i,j)+1, newRoute(i,j+1)+1);
    end
    costAfter(i) = sum(distAfter(i,:));
end

totAfther=0;
for i=1:length(costAfter)
    totAfther= totAfther + costAfter(i);
end

totBefore= 0;
for i=1:length(costBefore)
    totBefore= totBefore + costBefore(i);
end





%%

%% *****H�R TESTAR VI*****
clear
clc
load('dist_truck');
load('truck_stop_coord');

% route = zeros(8,10);
newRoute = zeros(7,1);

% route = [0 3 0 0 0 0 0 0 0 0]';
% route = [0 5 9 10 11 32 33 0 0 0]';
% route = [0 13 16 2 22 3 0 0 0 0]';
% route = [0 44 38 39 42	14 1 0 0 0]';
% route = [0 17 18 19 41 28 29 0 0 0]';
% route = [0 29 20 21 30	31 36 35 9 0]';
% route = [0 34 44 26 23 10 13 0 0 0]';
% route = [1 38 44 25 26 41 15];
% route = [1 35 45 27 24 11 14];

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
            for l=(k+3):(steps)
                    d = evalmove2(k,l,route,dist_truck);
                    if(counter==2)
                        disp("d: " + d + ", " + k + " och " + l);
                        disp("Avstand mellan " + k + " och " + l + " = " + dist_truck(route(k),route(l)));
                    end 
                if(d<dMin)
                    iMin = k;
                    jMin = l;
                    dMin = d;
                end
            end
        end
        if(counter==2)
            disp("dMin: " + dMin);
            disp("Valt avst�nd �r mellan " + iMin + " och " + jMin + " som �r " + dist_truck(route(iMin),route(jMin)));
        end
        route = makeMove2(iMin,jMin,route);
        counter = counter+1;
        if dMin >= 0
            break;
        end
        
    end
    
 
distAfter = zeros(8,1);
for i = 1:length(route)-1
    distAfter(i) = dist_truck(route(i), route(i+1));
end
distAfter(end) = dist_truck(route(end), route(1));
costAfter = sum(distAfter(:));















