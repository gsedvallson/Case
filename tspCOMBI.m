%% TSP for stop 1 neighborhood search
tic
clc;
clear;
load 'stop33_comb.mat';
% X_cordStop=2;
% Y_cordStop=0;
% StartCost = zeros(length(stop_comb),1);
TourCost = zeros(length(stop_comb),1);


for h = 1:length(stop_comb)

    x = [-125 -126 -124 -122 -129 -122 -128 -128 -121 -124 -124	-123 -121 -121 -122	-125];
    y = [130 128 137 138 136 118 135 134 134 121 130 135 126 134 124 140];
    cust = [0 214 460 483 509 574 647 680 772 930 956 995 1124 1139 1178 1225];
    cords = [x;  y; cust];
   
    le = length(cords);
    
    route = zeros(3,length(cords));
    route(1,:) = x;
    route(2,:) = y;
    route(3,1) = 1;
    route(3,2:length(route)) = stop_comb(h,:);

    v = 1;
    v1 = 1;
    while (v <= size(cords,2))
        if(route(3,v1)==0)
            cords(:,v)=[];
            v = v - 1;
        end
        
        if (v == length(route))
            break;
        end
        v = v + 1;
        v1 = v1 + 1;
    end
    
%     if(sum(cords(4,:)) > 10)
%        stop_comb(h) = []; 
%     end
    
    counter=0;
    d = 0;
    iMin=0;
    jMin =0;
    steps = size(cords,2);
    number_of_moves = 50*steps;
    
    if(size(cords,2) < 3)
         TourCost(h) = 2 * (sqrt((cords(1,1) - cords(1,2)) .^ 2 + (cords(2,1) - cords(2,2)) .^ 2));
    else
    while (counter<number_of_moves)
        dMin=10000000;
        for k=1:(steps-2)
            for l=(k+2):(steps)
                d = evalMove(k,l,cords);
                if(d<dMin)
                    iMin = k;
                    jMin = l;
                    dMin = d;
                end
            end
        end
        cords = makeMove(iMin,jMin,cords);
        counter = counter+1;
        if dMin >= 0
            break;
        end
        
    end
    
    x2 = cords(1,:);
    y2 = cords(2,:);
    
    %     figure(1)
    %     plot([x2 x2(1)],[y2 y2(1)],'k+:')
    %
    %     figure(2)
    %     plot([x x(1)],[y y(1)],'k+:')
    
    D = zeros(length(x2),1);
    if(size(cords,2) > 1)
        for i=1:length(x2)-1
            D(i) = sqrt(sum((x2(i) - x2(i+1)) .^ 2 + (y2(i) - y2(i+1)) .^ 2));
        end
        D(end) = sqrt(sum((x2(end) - x2(1)) .^ 2 + (y2(end) - y2(1)) .^ 2));
    end
    
        
        if (h == 32689)
            disp("route: " + route);
            disp("cords " + cords);
            disp("D: " + D);
            disp("distD: " + sum(D));
        end
   
    TourCost(h) = sum(D);
    % StartCost = sum(D);
    % TourCost = sum(D2);
    end
end


toc

%%

maxDist = max(TourCost);

find(any(TourCost==maxDist,2))
